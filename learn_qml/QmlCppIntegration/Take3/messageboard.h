#ifndef MESSAGEBOARD_H
#define MESSAGEBOARD_H

#include <QObject>
#include <QDebug>

// exposing methods(including Qt-slots)
// exposing signals to QML
class MessageBoard : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE bool postMessage(const QString& msg) {
        qDebug() << "Called C++ method with " << msg;
        emit newMessagePosted(msg); // after the signal is emitted, QML signal handler OnNewMessagePosted() is invoked
        return true;
    }

public slots:
    void refresh() {
        qDebug() << "Called the C++ slot[refresh()]";
    }

signals:
    void newMessagePosted(const QString& subject);
};

#endif // MESSAGEBOARD_H
