#include "myserialcommunication.h"
#include <QtSerialPort/QSerialPortInfo>
#include <QStringList>
#include <QObject>

MySerialCommunication::MySerialCommunication()
{
}

QString MySerialCommunication::getAllSerialPortInfo()
{
    QStringList serialPortInfos;

    const auto infos = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &info : infos) {
        QString sportInfo = QObject::tr("Port: ") + info.portName() + "\n"
                + QObject::tr("Location: ") + info.systemLocation() + "\n"
                + QObject::tr("Description: ") + info.description() + "\n"
                + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";

        serialPortInfos << sportInfo;
    }

    QString result = serialPortInfos.join(", ");

    return result;
}
