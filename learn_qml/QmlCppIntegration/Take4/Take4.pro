TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    instantiable.cpp \
    noninstantiable.cpp \
    uncreatabletype.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    instantiable.h \
    noninstantiable.h \
    uncreatabletype.h \
    singletontypeqjsvalue.h \
    singletontypeexample.h

DISTFILES += \
    readme
