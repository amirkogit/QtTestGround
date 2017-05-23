#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "instantiable.h"
#include "noninstantiable.h"
#include "uncreatabletype.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // register Instantiable class to be available to QML
    qmlRegisterType<Instantiable>("org.qml_cpp_integration.example",1,0,"Instantiable");

    // use the following to make NonInstantiable class unavailable to QML
    qmlRegisterType<NonInstantiable>();

    // Following code will make NonInstantiable available to QML
    //qmlRegisterType<NonInstantiable>("org.qml_cpp_integration.example",1,0,"NonInstantiable");

    qmlRegisterUncreatableType<UncreatableType>("org.qml_cpp_integration.example",1,0,
                                                "UncreatableType",
                                                "Cannot create a class of type UncreatableType");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
