#include "mytype.h"
#include <QImage>
#include <QDir>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QStandardPaths>
#include <QFile>

#include <dlib/image_processing/frontal_face_detector.h>
#include <dlib/gui_widgets.h>
#include <dlib/image_processing/render_face_detections.h>
#include <dlib/image_io.h>
#include <dlib/image_processing.h>
#include <opencv2/photo.hpp>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <iostream>

using namespace cv;

MyType::MyType(QObject *parent): QObject(parent)
{
    this->detector = dlib::get_frontal_face_detector();
    dlib::deserialize("../FaceSwap/backend/FaceSwap/shape_predictor_68_face_landmarks.dat") >> sp;
    QStringList dirList=QStandardPaths::standardLocations(QStandardPaths::PicturesLocation);
    IMAGE_SAVE_PATH=dirList.at(0).toLocal8Bit().constData();
   }

MyType::~MyType() {

}

std::vector<cv::Point2f> MyType::imageToPoints(std::string path){
      std::vector<Point2f> points;
      try
        {
           dlib::array2d<dlib::rgb_pixel> img;
           dlib::load_image(img, path);

           std::vector<dlib::rectangle> dets = detector(img);

           dlib::full_object_detection shape = sp(img, dets[0]);
        for (int i=0;i< 68;i++){

          int xx=shape.part(i).x();
          int yy=shape.part(i).y();
          cv::Point2f temp(xx,yy);
         points.push_back(temp);
        }

        }
        catch (std::exception& e)
        {
          //  std::cout << "\nexception thrown!" << std::endl;
           // std::cout << e.what() << std::endl;
        }



        return points;
 }


void MyType::warpAffineTrans(Mat &warpImage, Mat &src, std::vector<Point2f> &srcVec, std::vector<Point2f> &dstVec)
{
    Mat warpMat = getAffineTransform( srcVec, dstVec );
    warpAffine( src, warpImage, warpMat, warpImage.size(), INTER_LINEAR, BORDER_REFLECT_101);
}

void MyType::triangulate(Mat &img1, Mat &img2, std::vector<Point2f> &pts1, std::vector<Point2f> &pts2)
{

    Rect rect1 = boundingRect(pts1);
    Rect rect2 = boundingRect(pts2);

   std::vector<Point2f> t1Rect, t2Rect;
   std::vector<Point> t2RectInt;
    for(int i = 0; i < 3; i++)
    {

        t1Rect.push_back( Point2f( pts1[i].x - rect1.x, pts1[i].y -  rect1.y) );
        t2Rect.push_back( Point2f( pts2[i].x - rect2.x, pts2[i].y - rect2.y) );
        t2RectInt.push_back( Point(pts2[i].x - rect2.x, pts2[i].y - rect2.y) );

    }

    Mat mask = Mat::zeros(rect2.height, rect2.width, CV_32FC3);
    fillConvexPoly(mask, t2RectInt, Scalar(1.0, 1.0, 1.0), 16, 0);

    Mat img1Rect;
    img1(rect1).copyTo(img1Rect);

    Mat img2Rect = Mat::zeros(rect2.height, rect2.width, img1Rect.type());

    warpAffineTrans(img2Rect, img1Rect, t1Rect, t2Rect);

    multiply(img2Rect,mask, img2Rect);
    multiply(img2(rect2), Scalar(1.0,1.0,1.0) - mask, img2(rect2));
    img2(rect2) = img2(rect2) + img2Rect;


}

void MyType::calculateDelaunayTriangles(Rect rect, std::vector<Point2f> &points, std::vector< std::vector<int> > &delaunayTriangle){

    Subdiv2D subdiv(rect);


    for( std::vector<Point2f>::iterator it = points.begin(); it != points.end(); it++)
        subdiv.insert(*it);

    std::vector<Vec6f> triangleList;
    subdiv.getTriangleList(triangleList);
    std::vector<Point2f> pt(3);
    std::vector<int> ind(3);

    for( size_t i = 0; i < triangleList.size(); i++ )
    {
        Vec6f t = triangleList[i];
        pt[0] = Point2f(t[0], t[1]);
        pt[1] = Point2f(t[2], t[3]);
        pt[2] = Point2f(t[4], t[5 ]);

        if ( rect.contains(pt[0]) && rect.contains(pt[1]) && rect.contains(pt[2])){
            for(int j = 0; j < 3; j++)
                for(size_t k = 0; k < points.size(); k++)
                    if(abs(pt[j].x - points[k].x) < 1.0 && abs(pt[j].y - points[k].y) < 1)
                        ind[j] = k;

            delaunayTriangle.push_back(ind);
        }
    }

}

void MyType::doTheSwap(){

    std::string filename1=img1_src.toStdString();
    std::string filename2=img2_src.toStdString();
    filename1.erase(0,7);
    filename2.erase(0,7);
   // std::cout<<filename1<<std::endl<<filename2;

    Mat img1 = imread(filename1);
    Mat img2 = imread(filename2);
    Mat img1Warped = img2.clone();

    std::vector<Point2f> points1, points2;
    points1 = this->imageToPoints(filename1);
    points2 = this->imageToPoints(filename2);

    img1.convertTo(img1, CV_32F);
    img1Warped.convertTo(img1Warped, CV_32F);

    std::vector<Point2f> hull1;
    std::vector<Point2f> hull2;
    std::vector<int> hullIndex;

    convexHull(points2, hullIndex, false, false);

    for(size_t i = 0; i < hullIndex.size(); i++)
    {
        hull1.push_back(points1[hullIndex[i]]);
        hull2.push_back(points2[hullIndex[i]]);
    }


    std::vector< std::vector<int> > dt;
    Rect rect(0, 0, img1Warped.cols, img1Warped.rows);
    calculateDelaunayTriangles(rect, hull2, dt);

    for(size_t i = 0; i < dt.size(); i++)
    {
        std::vector<Point2f> t1, t2;

        for(size_t j = 0; j < 3; j++)
        {
            t1.push_back(hull1[dt[i][j]]);
            t2.push_back(hull2[dt[i][j]]);
        }

        this->triangulate(img1, img1Warped, t1, t2);

    }

    std::vector<Point> hull8U;

    for(size_t i = 0; i < hull2.size(); i++)
    {
        Point pt(hull2[i].x, hull2[i].y);
        hull8U.push_back(pt);
    }

    Mat mask = Mat::zeros(img2.rows, img2.cols, img2.depth());
    fillConvexPoly(mask,&hull8U[0], hull8U.size(), Scalar(255,255,255));

    Rect r = boundingRect(hull2);
    Point center = (r.tl() + r.br()) / 2;
    Mat output;
    img1Warped.convertTo(img1Warped, CV_8UC3);
    seamlessClone(img1Warped,img2, mask, center, output, NORMAL_CLONE);
    setImageswapped(QUrl(QString::fromStdString(IMAGE_SAVE_PATH+"/face_swap.jpg")));
    imwrite(IMAGE_SAVE_PATH+"/face_swap.jpg",output);
    emit imageSwappedChanged();

}

