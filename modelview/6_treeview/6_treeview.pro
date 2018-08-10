TARGET = mv_tree
TEMPLATE = app
QT += widgets
requires(qtConfig(treeview))
SOURCES += main.cpp \
    mainwindow.cpp
HEADERS += mainwindow.h


