TARGET = mv_edit

TEMPLATE = app

QT += widgets
requires(qtConfig(tableview))

SOURCES += main.cpp \
           mainwindow.cpp \
           mymodel.cpp

HEADERS += mainwindow.h \
           mymodel.h
