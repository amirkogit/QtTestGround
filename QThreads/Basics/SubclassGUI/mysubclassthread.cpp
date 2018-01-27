#include "mysubclassthread.h"

void MySubclassThread::run()
{
    QString result;

    // some expensive or blocking operations
    result = "Hello From Thread";
    emit resultReady(result);
}
