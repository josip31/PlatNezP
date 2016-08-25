import QtQuick 2.5
//import Ubuntu.Components 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    id:imagePreviewItem
    width: stack.width
    height: stack.height
    property alias imagePreviewImage: imagePreviewImage
    property alias imagePreviewItem: imagePreviewItem
    property bool isGood: false
    anchors.margins: {left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/;}
    Image{
        id:imagePreviewImage
        width: parent.width
        height: parent.height /12 * 10
        fillMode: Image.Stretch
        smooth: true
        anchors.top:parent.top
    }
    Button{
        id:saveImage
        text:"Save"
        width: parent.width / 3
        height: parent.height/12
        anchors.left:parent.left
        anchors.bottom: parent.bottom

        anchors.margins:{ left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/ ; top:4/*units.gu(0.5)*/; bottom:4/*units.gu(0.5)*/}
        //color: "#2F5997"
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

        onClicked: {
            isGood:true
            if (mainwindow.selectedImage==mainwindow.image1){
                mainwindow.image1.source=camera.imageCapture.capturedImagePath

            }
            else{
                mainwindow.image2.source=camera.imageCapture.capturedImagePath
            }
            stack.pop()
            stack.pop()

        }
    }
    Button{
        id:goBack
        text:"Back"
        width: parent.width / 3
        height: parent.height/12
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        anchors.margins:{ left:4/*units.gu(0.5)*/; right:4/*units.gu(0.5)*/; top:4/*units.gu(0.5)*/; bottom:4/*units.gu(0.5)*/}
       // color: "#2F5997"
        onClicked: {
            isGood:false
            stack.pop()
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

}

