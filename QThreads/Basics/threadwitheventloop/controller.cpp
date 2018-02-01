#include "controller.h"
#include "worker.h"
#include <QDebug>

Controller::Controller()
{
    // create threads
    Worker* worker = new Worker();
    worker->moveToThread(&_worker_thread);
    connect(&_worker_thread, &QThread::finished, worker, &QObject::deleteLater);

    // connect other signals
    connect(this, &Controller::InitializeWorkerRequested, worker, &Worker::Initialize);
    connect(worker, &Worker::Initialized, this, [=](bool success) {
        // inform this class or any other to make sure that the worker is successfully initialized
        if(success) {
            qDebug() << "Worker thread initialized successfully.";
        }
        else {
            qDebug() << "Worker thread failed to initialize.";
        }
    });

    connect(this, &Controller::StartWorkerRequested, worker, &Worker::Start);
    connect(worker, &Worker::Started, this, [=](bool success) {
        if(success) {
            qDebug() << "Worker thread started.";
            qDebug() << "Starting timer";
            _timer.start();
        }
        else {
            qDebug() << "Worker thread is not started.";
        }
    });

    connect(this, &Controller::StopWorkerRequested, worker, &Worker::Stop);
    connect(worker, &Worker::Stopped, this, [=](bool success) {
        if(success) {
            qDebug() << "Worker thread stopped.";
            qDebug() << "Stopping timer.";
            _timer.stop();
        }
        else {
            qDebug() << "Worker thread is not stopped.";
        }
    });

    // connect signals for timer
    _timer.setTimerType(Qt::PreciseTimer);
    _timer.setSingleShot(false);
    _timer.setInterval(25); // 40 Hz
    connect(&_timer, &QTimer::timeout, worker, &Worker::GenerateData);
    connect(worker, &Worker::DataGenerated, this, &Controller::OnDataGenerated);

    // start the worker thread
    _worker_thread.start();
}

Controller::~Controller()
{
    // clean up thread
    _worker_thread.quit();
    _worker_thread.wait();
}

void Controller::Start()
{
    // initialize worker thread. we cannot directly call the method of worker thread. so use signal
    emit InitializeWorkerRequested();
    emit StartWorkerRequested();
}

void Controller::Stop()
{
    emit StopWorkerRequested();
}

void Controller::OnDataGenerated(const QString &data)
{
    qDebug() << "Generated data: " << data;
}
