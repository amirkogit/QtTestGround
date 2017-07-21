include(../defaults.pri)

CONFIG += console
CONFIG -= app_bundle
#CONFIG -= qt
QT += serialport

TEMPLATE = app

SOURCES += main.cpp

LIBS += -L../src -lmyapp
