import QtQuick 2.5
import QtQuick.Dialogs 1.0

FileDialog {
    id: fileDialog
    title: "Please choose an image"
    nameFilters: [ "Image files (*.jpg *.png)"]
    folder :  shortcuts.pictures
    onAccepted: {

       if(mainwindow.selectedImage==mainwindow.image1){
            mainwindow.image1.source=fileDialog.fileUrl

       }
       else{
             mainwindow.image2.source=fileDialog.fileUrl
       }
       fileDialog.close()
    }
    onRejected: {
        fileDialog.close()
    }
    Component.onCompleted: visible = true

}
