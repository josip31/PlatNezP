import QtQuick 2.5
import QtQuick.Controls 1.4

Menu {
    id:importPictureMenu
    title:"Add picture"

    TakePicture{
        id:takePicture
        visible:false
    }

    MenuItem{
        text:"Import image"
        checkable: false
        enabled: false
        iconName: "FaceSwap"
        iconSource: "FaceSwap.png"

    }

    MenuItem{
        text:"Camera"
        onTriggered: {
           stack.push(takePicture)
        }
    }

    MenuItem{
        text:"Gallery"
        onTriggered:{
           var loader=Qt.createQmlObject('import QtQuick 2.4; Loader{source:"ChoosePictureFromGalleryView.qml"}',mainwindow,"ChoosePictureFromGalleryView.qml")
        }

    }
    MenuItem{
        text:"Remove"
        onTriggered: {
            if (mainwindow.selectedImage==mainwindow.image1){
                mainwindow.image1.source="add-user-icon.jpg"
            }
            else{
                mainwindow.image2.source="add-user-icon.jpg"
            }
        }
    }

}

