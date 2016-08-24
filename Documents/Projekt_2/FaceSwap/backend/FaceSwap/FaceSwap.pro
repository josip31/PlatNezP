TEMPLATE = lib
TARGET = FaceSwapbackend
QT += qml quick
CONFIG += qt plugin
CONFIG +=c++11
CONFIG += no_lflags_merge

load(ubuntu-click)

TARGET = $$qtLibraryTarget($$TARGET)

# Input
SOURCES += \
    backend.cpp \
    mytype.cpp

HEADERS += \
    backend.h \
    mytype.h \


OTHER_FILES = qmldir \
              shape_predictor_68_face_landmarks.dat \
              faceswap.qmltypes

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
installPath = $${UBUNTU_CLICK_PLUGIN_PATH}/FaceSwap
qmldir.path = $$installPath
target.path = $$installPath
INSTALLS += target qmldir

INCLUDEPATH += /usr/include/c++/5.4.0/
DEPENDPATH += /usr/include/c++/5.4.0/ #ovo je dobro ne brisati

#LIBS += -pthread
#LIBS += -lpng -ljpeg

QMAKE_CXXFLAGS += -std=c++11 -DDLIB_PNG_SUPPORT -DDLIB_JPEG_SUPPORT


LIBS += -L/home/josip/Documents/Projekt_2/FaceSwap/backend/FaceSwap/lib -ldlib

LIBS += -ldlib -lopencv_core -lopencv_photo -lopencv_objdetect -lopencv_imgproc -lopencv_imgcodecs

INCLUDEPATH += $$PWD/.
DEPENDPATH += $$PWD/.


