QT += widgets
requires(qtConfig(listview))

HEADERS   = filelistmodel.h \
            window.h
SOURCES   = filelistmodel.cpp \
            main.cpp \
            window.cpp

INSTALLS += target
