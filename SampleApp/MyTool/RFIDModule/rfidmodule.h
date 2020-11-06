#ifndef RFIDMODULE_H
#define RFIDMODULE_H

#include "rfidmodule_global.h"

class RFIDMODULESHARED_EXPORT RFIDModule
{

public:
    RFIDModule();
    int GetSum(int a, int b);
    int GetDiff(int a, int b);
};

#endif // RFIDMODULE_H
