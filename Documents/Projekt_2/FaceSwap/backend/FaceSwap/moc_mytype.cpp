/****************************************************************************
** Meta object code from reading C++ file 'mytype.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "mytype.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mytype.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.4.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MyType_t {
    QByteArrayData data[11];
    char stringdata[143];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MyType_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MyType_t qt_meta_stringdata_MyType = {
    {
QT_MOC_LITERAL(0, 0, 6), // "MyType"
QT_MOC_LITERAL(1, 7, 16), // "messageSetSignal"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 19), // "image1sourceChanged"
QT_MOC_LITERAL(4, 45, 19), // "image2sourceChanged"
QT_MOC_LITERAL(5, 65, 19), // "imageSwappedChanged"
QT_MOC_LITERAL(6, 85, 10), // "createSwap"
QT_MOC_LITERAL(7, 96, 7), // "message"
QT_MOC_LITERAL(8, 104, 12), // "image1source"
QT_MOC_LITERAL(9, 117, 12), // "image2source"
QT_MOC_LITERAL(10, 130, 12) // "imageswapped"

    },
    "MyType\0messageSetSignal\0\0image1sourceChanged\0"
    "image2sourceChanged\0imageSwappedChanged\0"
    "createSwap\0message\0image1source\0"
    "image2source\0imageswapped"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MyType[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       4,   44, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x06 /* Public */,
       3,    0,   40,    2, 0x06 /* Public */,
       4,    0,   41,    2, 0x06 /* Public */,
       5,    0,   42,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       6,    0,   43,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // properties: name, type, flags
       7, QMetaType::QString, 0x00495103,
       8, QMetaType::QString, 0x00495103,
       9, QMetaType::QString, 0x00495103,
      10, QMetaType::QUrl, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       1,
       3,

       0        // eod
};

void MyType::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MyType *_t = static_cast<MyType *>(_o);
        switch (_id) {
        case 0: _t->messageSetSignal(); break;
        case 1: _t->image1sourceChanged(); break;
        case 2: _t->image2sourceChanged(); break;
        case 3: _t->imageSwappedChanged(); break;
        case 4: _t->createSwap(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (MyType::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyType::messageSetSignal)) {
                *result = 0;
            }
        }
        {
            typedef void (MyType::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyType::image1sourceChanged)) {
                *result = 1;
            }
        }
        {
            typedef void (MyType::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyType::image2sourceChanged)) {
                *result = 2;
            }
        }
        {
            typedef void (MyType::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyType::imageSwappedChanged)) {
                *result = 3;
            }
        }
    }
    Q_UNUSED(_a);
}

const QMetaObject MyType::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MyType.data,
      qt_meta_data_MyType,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *MyType::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MyType::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MyType.stringdata))
        return static_cast<void*>(const_cast< MyType*>(this));
    return QObject::qt_metacast(_clname);
}

int MyType::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = message(); break;
        case 1: *reinterpret_cast< QString*>(_v) = image1source(); break;
        case 2: *reinterpret_cast< QString*>(_v) = image2source(); break;
        case 3: *reinterpret_cast< QUrl*>(_v) = imageswapped(); break;
        default: break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setMessage(*reinterpret_cast< QString*>(_v)); break;
        case 1: setImage1source(*reinterpret_cast< QString*>(_v)); break;
        case 2: setImage2source(*reinterpret_cast< QString*>(_v)); break;
        case 3: setImageswapped(*reinterpret_cast< QUrl*>(_v)); break;
        default: break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MyType::messageSetSignal()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void MyType::image1sourceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}

// SIGNAL 2
void MyType::image2sourceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, Q_NULLPTR);
}

// SIGNAL 3
void MyType::imageSwappedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
