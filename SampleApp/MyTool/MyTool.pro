TEMPLATE = subdirs

SUBDIRS += \
    RFIDModule \
    Main \
    CloudConnect

CONFIG += ordered

#Main.depends = RFIDModule CloudConnect
