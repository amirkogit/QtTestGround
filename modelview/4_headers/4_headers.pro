TARGET = mv_headers

TEMPLATE = app

QT += widgets
requires(qtConfig(tableview))

SOURCES += main.cpp  \
           mymodel.cpp

HEADERS += mymodel.h


