#ifndef MYSUBCLASSTHREAD_H
#define MYSUBCLASSTHREAD_H

#include <QThread>

class MySubclassThread : public QThread
{
    Q_OBJECT

private:
    void run() override;

signals:
    void resultReady(const QString& s);
};

#endif // MYSUBCLASSTHREAD_H
