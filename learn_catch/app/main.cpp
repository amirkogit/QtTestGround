#include <iostream>
#include <myclass.h>
#include <camera.h>
#include <myserialcommunication.h>

using namespace std;

int main()
{
    MyClass mathoperations;
    cout << "Result of addition: " << mathoperations.addition(10, 20) << endl;
    cout << "Result of product: " << mathoperations.product(4,5) << endl;

    Camera camera;
    cout << "Center X: " << camera.getCenterX() << endl;
    cout << "Center Y: " << camera.getCenterY() << endl;
    cout << "Center Z: " << camera.getCenterZ() << endl;

    MySerialCommunication serialComm;
    cout << "SerialPortInfo: \n" << serialComm.getAllSerialPortInfo().toStdString() << endl;

    return 0;
}
