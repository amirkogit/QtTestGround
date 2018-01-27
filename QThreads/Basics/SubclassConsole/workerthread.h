#ifndef WORKERTHREAD_H
#define WORKERTHREAD_H

#include <QThread>

class WorkerThread : public QThread
{
    Q_OBJECT

private:
    void run() override;

signals:
    void resultReady(const QString& s);
};

#endif // WORKERTHREAD_H
