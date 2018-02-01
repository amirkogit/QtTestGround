QT += network widgets

CONFIG += c++11 console

HEADERS       = app.h \
    worker.h \
    controller.h
SOURCES       = app.cpp \
                main.cpp \
    worker.cpp \
    controller.cpp

TARGET = client
