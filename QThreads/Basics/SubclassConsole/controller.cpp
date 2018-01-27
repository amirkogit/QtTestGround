#include "controller.h"
#include <QDebug>
#include "workerthread.h"

Controller::Controller(QObject *parent) : QObject(parent)
{

}

void Controller::StartWorkInAThread()
{
    WorkerThread* worker_thread = new WorkerThread();
    connect(worker_thread, &WorkerThread::resultReady, this, &Controller::HandleResults);
    connect(worker_thread, &WorkerThread::finished, worker_thread, &QObject::deleteLater);

    worker_thread->start();
    worker_thread->wait();
}

void Controller::HandleResults(const QString &s)
{
    qDebug() << "Controller:: Results obtained from thread: " << s;
}
