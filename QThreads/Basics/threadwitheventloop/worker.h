#pragma once

#include <QObject>

// using signals and slots to call methods of this class. It is not safe to call the methods of this
// class directly from the main thread

class Worker  final : public QObject
{
    Q_OBJECT

public:
    Worker();
    ~Worker();

public:
    void Initialize();
    void Start();
    void Stop();
    void GenerateData();

signals:
    void Initialized(bool status);
    void Started(bool status);
    void Stopped(bool status);
    void DataGenerated(const QString& data); // we can also use custom data here

private:
   // contains member data that communicates with other classes via signal and slot
   QString _data;
};

