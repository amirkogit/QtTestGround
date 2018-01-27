#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>

class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);
    void StartWorkInAThread();

signals:

public slots:
    void HandleResults(const QString& s);
};

#endif // CONTROLLER_H
