#include "window.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    ApplicationWindow window;
    window.show();
    return app.exec();
}
