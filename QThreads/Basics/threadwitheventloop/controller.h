#pragma once

#include <QObject>
#include <QThread>
#include <QTimer>

class Controller final : public QObject
{
    Q_OBJECT

public:
    Controller();
    ~Controller();

public:
    void Start();
    void Stop();

signals:
    void InitializeWorkerRequested();
    void StartWorkerRequested();
    void StopWorkerRequested();

private slots:
    void OnDataGenerated(const QString& data);

private:
    QThread _worker_thread;
    QTimer _timer;
};
