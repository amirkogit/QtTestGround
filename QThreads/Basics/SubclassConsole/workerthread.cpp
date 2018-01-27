#include "workerthread.h"
#include <QDebug>

void WorkerThread::run()
{
    QString result;

    // some expensive or blocking operations
    result = "Hello From Thread";
    qDebug() << result;
    emit resultReady(result);
}
