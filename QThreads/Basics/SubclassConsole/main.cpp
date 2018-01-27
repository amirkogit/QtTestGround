#include <QCoreApplication>
#include <QDebug>
#include <QThread>

// Project includes
#include "workerthread.h"
#include "controller.h"

void Calculate(int a)
{
    //int sum = a + b;
    qDebug() << "Inside Calculate method()";
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    qDebug() << "Simple threading demo.";

    qDebug() << "Launch thread directly";
    WorkerThread *thread = new WorkerThread;
    thread->start();
    thread->wait();

    qDebug() << "launch thread via Controller";
    Controller controller;
    controller.StartWorkInAThread();

    // TODO: this should be possible with Qt 5.10
//    qDebug() << "Testing QThread::create() method";
//    QThread *thread2 = QThread::create(Calculate,2);
//    thread2->start();
//    thread2->wait();

    return a.exec();
}
