#ifndef FACESWAPLOGIC_H
#define FACESWAPLOGIC_H



#include <QObject>
#include <QUrl>

#include <opencv2/core.hpp>
#include <dlib/image_processing/frontal_face_detector.h>
#include <dlib/gui_widgets.h>
#include <dlib/image_processing/render_face_detections.h>
#include <dlib/image_io.h>
#include <dlib/image_processing.h>


class MyType : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageSetSignal )
    Q_PROPERTY(QString image1source READ image1source WRITE setImage1source NOTIFY image1sourceChanged)
    Q_PROPERTY(QString image2source READ image2source WRITE setImage2source NOTIFY image1sourceChanged)
    Q_PROPERTY(QUrl imageswapped READ imageswapped WRITE setImageswapped NOTIFY imageSwappedChanged)
public:
    explicit MyType(QObject *parent = 0);
    ~MyType();
    void swap();

public Q_SLOTS:
    void createSwap(){doTheSwap();}

Q_SIGNALS:
    void messageSetSignal();
    void image1sourceChanged();
    void image2sourceChanged();
    void imageSwappedChanged();

protected:
    int picture_number=0;
    std::string IMAGE_SAVE_PATH;
    QString m_message;
    QString img1_src;
    QString img2_src;
    QUrl img_swp;
    dlib::frontal_face_detector detector;
    dlib::shape_predictor sp;

    QString image1source(){return img1_src;}
    void setImage1source (QString src){img1_src=src;}

    QString image2source(){return img2_src;}
    void setImage2source (QString src){img2_src=src;}



    QString message() { return m_message; }
    void setMessage(QString msg) { m_message = msg; Q_EMIT messageSetSignal(); }

    QUrl imageswapped(){return img_swp;}
    void setImageswapped (QUrl src){img_swp=src;}



    std::vector<cv::Point2f> imageToPoints(std::string);
    void warpAffineTrans(cv::Mat&, cv::Mat&, std::vector<cv::Point2f>&, std::vector<cv::Point2f>&);
    void triangulate(cv::Mat &, cv::Mat &, std::vector<cv::Point2f> &, std::vector<cv::Point2f> &);
    void calculateDelaunayTriangles(cv::Rect rect, std::vector<cv::Point2f> &points, std::vector< std::vector<int> > &);
    void doTheSwap();


};

#endif
