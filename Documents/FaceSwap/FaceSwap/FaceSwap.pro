TEMPLATE = app #bio aux
TARGET = FaceSwap

QT +=core quick
QT += multimedia
#CONFIG +=static
QTPLUGIN += qavfcamera

RESOURCES += faceswapresource.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  FaceSwap.apparmor \
               FaceSwap.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               FaceSwap.desktop \
               add-user-icon.jpg

QML2_IMPORT_PATH= /home/josip/Qt/5.7/gcc_64

#specify where the qml/js files are installed to
qml_files.path = /FaceSwap
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /FaceSwap
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is automatically created in 
#the build directory
desktop_file.path = /FaceSwap
desktop_file.files = $$OUT_PWD/FaceSwap.desktop 
desktop_file.CONFIG += no_check_exist 

INSTALLS+=config_files qml_files desktop_file

DISTFILES += \
    ChoosePictureFromGalleryView.qml \
    ImagePreview.qml \
    OpenPictureDialog.qml \
    TakePicture.qml

QML2_IMPORT_PATH += /home/josip/Documents/Projekt_2/FaceSwap/backend/FaceSwap/

SOURCES += \
    main.cpp

INCLUDEPATH += $$PWD/../../../../bin/qt/5.7/gcc_64/include
DEPENDPATH += $$PWD/../../../../bin/qt/5.7/gcc_64/include

