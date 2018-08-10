TARGET =   mv_readonly

TEMPLATE = app

QT += widgets
requires(qtConfig(tableview))

SOURCES += main.cpp \
           mymodel.cpp

HEADERS += mymodel.h
