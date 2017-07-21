include(../defaults.pri)
CONFIG   += console
CONFIG   -= app_bundle
#CONFIG   -= qt
QT += serialport
TEMPLATE = lib

TARGET = myapp

SOURCES += myclass.cpp \
    camera.cpp \
    myserialcommunication.cpp
HEADERS += myclass.h \
    camera.h \
    myserialcommunication.h
