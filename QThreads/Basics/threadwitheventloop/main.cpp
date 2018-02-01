#include <QApplication>
#include "app.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);
    QApplication::setApplicationDisplayName("Client Application");

    AppMain client;
    client.show();

    return app.exec();
}
