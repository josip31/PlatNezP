import QtQuick 2.4
import QtMultimedia 5.5
import QtQuick.Window 2.2
import Ubuntu.Components 1.3

Item{
    anchors.fill: mainwindow

    Rectangle{
        id:cameraFrame
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.right:parent.right
        width: parent.width
        height: parent.height/10 * 9
        border.color: "#2F5997"
        border.width: units.gu(0.5)
        anchors.margins: {left:units.gu(0.5); right:units.gu(0.5) ; top:units.gu(0.5)}

        ImagePreview{
            id:imagePreviewView
            imagePreviewItem.visible:false
        }

        Camera {
            id: camera
            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
            exposure {
                exposureCompensation: -1.0
                exposureMode: Camera.ExposurePortrait
            }
            flash.mode: Camera.FlashRedEyeReduction

            imageCapture {

                onImageCaptured: {
                       stack.push(imagePreviewView)
                       imagePreviewView.imagePreviewImage.source=preview
                       if (!imagePreviewView.isGood) {
                            imageCapture.cancelCapture()
                       }

                }
            }
        }

        VideoOutput {
            source: camera
            anchors.fill:parent
            fillMode: VideoOutput.Stretch
            focus : visible

        }

    }
    Button{
        id:takePictureButton
        width: parent.width / 3
        height: parent.height/12
        anchors.bottom: parent.bottom
        anchors.left:parent.left
        anchors.margins:{ left:units.gu(0.5); right:units.gu(0.5) ; top:units.gu(0.5)}
        text:"Take picture"
        color: "#2F5997"
        onClicked: camera.imageCapture.captureToLocation("")
    }
    Button{
        id:goBackButton
        width: parent.width / 3
        height: parent.height/12
        anchors.bottom: parent.bottom
        anchors.right:parent.right
        anchors.margins:{ left:units.gu(0.5); right:units.gu(0.5) ; top:units.gu(0.5); bottom:units.gu(0.5)}
        text:"Back"
        color: "#2F5997"
        onClicked: {stack.pop()}
    }
}

