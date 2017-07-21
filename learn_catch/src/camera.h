#ifndef CAMERA_H
#define CAMERA_H

#include <QtSerialPort/QSerialPort>

class Camera
{
public:
    Camera();

    double getCenterX();
    double getCenterY();
    double getCenterZ();
};

#endif // CAMERA_H
