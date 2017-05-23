#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "instantiable.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // register Instantiable class to be available to QML
    qmlRegisterType<Instantiable>("org.qml_cpp_integration.example",1,0,"Instantiable");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
