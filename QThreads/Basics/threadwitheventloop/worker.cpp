#include <QtCore>
#include <QDebug>

#include "worker.h"

Worker::Worker()
{
    qDebug() << "Worker object is created.";
}

Worker::~Worker()
{
    qDebug() << "Worker object is destroyed.";
}

void Worker::Initialize()
{
    // do some initializing task and emit signal that this object is initialized

    bool status = true;
    emit Initialized(status);
}

void Worker::Start()
{
    // do some work to start processing

    bool status = true;
    emit Started(status);
}

void Worker::Stop()
{
    // do whatever need to stop operations
    bool status = true;
    emit Stopped(status);
}

void Worker::GenerateData()
{
    // read the data that is generated from some external entity for example some server that continuously delivers
    // a sensor reading at different times.
    // a client application would poll continuously to read the sensor data in this worker thread.

    // here process some time consuming tasks
    // prepare data that can be read from the client
    //...

    int w = QRandomGenerator::global()->bounded(16384);
    QString some_data = QString("%1 %2").arg("random value = ").arg(w);
    // get data from somewhere

    // send to client for processing ...
    emit DataGenerated(some_data);
}
