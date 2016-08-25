import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import FaceSwap 1.0




/*!
    \brief MainView with a Label and Button elements.
*/
Window{
    id:initialWindow
    width: 500//units.gu(70)
    height:650//units.gu(80)
    title: "FaceSwap"
    color: "#E6E6FA"

StackView{
    id: stack
    initialItem: mainwindow
    anchors.fill:parent

    Item{
        id:mainwindow
        //anchors.fill:parent
        property alias image1: addFirstPicture
        property alias image2: addSecondPicture
        property var selectedImage
        property bool image1Ready:false
        property bool image2Ready:false
       // backgroundColor: "#E6E6FA"

        Item{
            id:firstRow
            width: parent.width
            height: parent.height / 31 * 17
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/}
            Rectangle{
                width: parent.width
                height: parent.height
                border.color: "#2F5997"
                border.width: 2/*units.gu(0.5)*/
                FaceSwapLogic {
                    id:swapImageLogic
                    message: "test"
                    onImageswappedChanged: {
                        swapedImage.source=imageswapped
                    }
                }

               /* ProgressBar{
                    id:progressBar
                    visible: false
                    anchors.centerIn: parent
                    value: 0
                }*/

                Image{
                    id:swapedImage
                    fillMode: Image.Stretch
                    asynchronous:true
                    cache:false
                    smooth: true
                    anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/;}
                    anchors.fill: parent

                }
            }
        }
        Item{
            id:secondRow
            width: parent.width
            height: parent.height / 31 * 10
            anchors.top:firstRow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ;top:4/*units.gu(0.5)*/}

            OpenPictureDialog{
                id:addPictureDialog
            }

            Item{
                id:firstColumn
                height: parent.height
                width: parent.width /2
                anchors.top:parent.top
                anchors.left: parent.left
                Rectangle{
                   id:firstPictureRect
                   border.color: "#2F5997"
                   border.width: 2/*units.gu(0.5)*/
                   anchors.fill: parent
                   Image {
                        id: addFirstPicture
                        source: "add-user-icon.jpg"
                        fillMode: Image.Stretch
                        smooth: true
                        anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/}
                        anchors.fill: parent
                        onSourceChanged: {
                            if(source != "add-user-icon.jpg")
                                mainwindow.image1Ready=true;
                            else
                                mainwindow.image1Ready=false;
                        }
                   }
                   MouseArea{
                       id:firstPictureArea
                       anchors.fill:addFirstPicture

                       onClicked: {
                           mainwindow.selectedImage=addFirstPicture
                           addPictureDialog.popup()}
                   }
               }

            }
            Item{
                id:secondColumn
                height: parent.height
                width: parent.width /2
                anchors.right: parent.right
                anchors.top:parent.top
                Rectangle{
                    id:secondPictureRect
                    border.color: "#2F5997"
                    border.width: 2/*units.gu(0.5)*/
                    anchors.fill: parent
                    Image {
                        id: addSecondPicture
                        source: "add-user-icon.jpg"
                        smooth: true
                        fillMode: Image.Stretch
                        anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/}
                        anchors.fill: parent
                        onSourceChanged: {
                            if(source != "add-user-icon.jpg")
                                mainwindow.image2Ready=true;
                            else
                                mainwindow.image2Ready=false;
                        }

                    }

                    MouseArea{
                        id:secondPictureArea
                        anchors.fill:addSecondPicture
                        onClicked: {
                            mainwindow.selectedImage=addSecondPicture
                            addPictureDialog.popup()}
                    }
                }
            }
        }
        Item{
            id:thirdRow
            width: parent.width
            height: parent.height / 31 * 3
            anchors.top:secondRow.bottom
            anchors.bottom:parent.Bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/;bottom:4/*units.gu(0.5)*/}

           Button{
                id:swapButton
                //color: "#2F5997"
                anchors.left:parent.left
                text: "Swap"
                height: parent.height
                width: parent.width/3
                enabled: mainwindow.image1Ready && mainwindow.image2Ready
                onClicked:{
                    //progressBar.visible=true
                    swapedImage.source=""
                    swapImageLogic.image2source=addSecondPicture.source
                    swapImageLogic.image1source=addFirstPicture.source
                    swapImageLogic.createSwap()

                }
                style : ButtonStyle {
                    background: Rectangle{
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#a2b5cd" : "#fcfcfc" }
                            GradientStop { position: 1 ; color: control.pressed ? "#fcfcfc" : "#a2b5cd" }
                        }

                    }
                 }
            }
           Button{
                id:closeAppButton
               // color: "#2F5997"
                anchors.right: parent.right
                text: "Close"

                height: parent.height
                width: parent.width/3
                style : ButtonStyle {
                    background: Rectangle{
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#a2b5cd" : "#fcfcfc" }
                            GradientStop { position: 1 ; color: control.pressed ? "#fcfcfc" : "#a2b5cd" }
                        }

                    }
                 }

                onClicked:{
                    initialWindow.close();
                }
            }


        }

    }
}

}
