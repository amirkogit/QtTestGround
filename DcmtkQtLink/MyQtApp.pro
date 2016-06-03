QT += core
QT -= gui

CONFIG += c++11

TARGET = MyQtApp
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp

INCLUDEPATH +=  $$PWD/thirdparty/dcmtk/include
DEPENDPATH += $$PWD/thirdparty/dcmtk/include

win32:CONFIG(debug,debug|release): LIBS += -L$$PWD/thirdparty/dcmtk/lib/ -ldcmdatad -ldcmimgled -ldcmimaged -ldcmjplsd -loflogd -lofstdd -ldcmjpegd
win32:CONFIG(release,debug|release): LIBS += -L$$PWD/thirdparty/dcmtk/lib/ -ldcmdata -ldcmimgle -ldcmimage -ldcmjpls -loflog -lofstd -ldcmjpeg

win32:CONFIG(debug,debug|release): DESTDIR = bin/debug
else:win32:CONFIG(release,release|debug) : DESTDIR = bin/release

win32{
    CONFIG(debug,debug|release) {
        dlls_to_move.path = $$DESTDIR
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmdatad.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmimgled.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmimaged.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmjplsd.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/oflogd.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/ofstdd.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmjpegd.dll
        INSTALLS += dlls_to_move
    }
    else {
        dlls_to_move.path = $$DESTDIR
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmdata.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmimgle.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmimage.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmjpls.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/oflog.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/ofstd.dll
        dlls_to_move.files += $$PWD/thirdparty/dcmtk/bin/dcmjpeg.dll
        INSTALLS += dlls_to_move
    }

    # copy resources
    resources_to_move.path = $$DESTDIR
    resources_to_move.files += $$PWD/resources/dicom_testdata.dcm
    INSTALLS += resources_to_move
}
