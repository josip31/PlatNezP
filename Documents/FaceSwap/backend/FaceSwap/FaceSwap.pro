TEMPLATE = lib
TARGET = FaceSwapbackend
QT += qml quick
CONFIG += qt plugin
CONFIG +=c++11

#load(ubuntu-click)

TARGET = $$qtLibraryTarget($$TARGET)

# Input
SOURCES += \
    backend.cpp \
    mytype.cpp

HEADERS += \
    backend.h \
    mytype.h

OTHER_FILES = qmldir \
              shape_predictor_68_face_landmarks.dat \

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


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../Downloads/dlib/build/dlib/release/ -ldlib
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../Downloads/dlib/build/dlib/debug/ -ldlib
else:unix: LIBS += -L$$PWD/../../../../../Downloads/dlib/build/dlib/ -ldlib

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/release/ -lopencv_core
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/debug/ -lopencv_core
else:unix: LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/ -lopencv_core

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/release/ -lopencv_imgcodecs
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/debug/ -lopencv_imgcodecs
else:unix: LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/ -lopencv_imgcodecs

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/release/ -lopencv_imgproc
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/debug/ -lopencv_imgproc
else:unix: LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/ -lopencv_imgproc

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/release/ -lopencv_objdetect
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/debug/ -lopencv_objdetect
else:unix: LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/ -lopencv_objdetect

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/release/ -lopencv_photo
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/debug/ -lopencv_photo
else:unix: LIBS += -L$$PWD/../../../../../Downloads/opencv/build/lib/ -lopencv_photo

INCLUDEPATH += $$PWD/../../../../../Downloads/opencv/build/include
DEPENDPATH += $$PWD/../../../../../Downloads/opencv/build/include


INSTALLS += target qmldir
