#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "instantiable.h"
#include "noninstantiable.h"
#include "uncreatabletype.h"
#include "singletontypeqjsvalue.h"
#include "singletontypeexample.h"

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

    // Register UncreatableType. Instances cannot be created in QML but can access other properties
    // like Enums type
    qmlRegisterUncreatableType<UncreatableType>("org.qml_cpp_integration.example",1,0,
                                                "UncreatableType",
                                                "Cannot create a class of type UncreatableType");

    // Register the singleton type provider with QML by calling this function in an initialization function.
    qmlRegisterSingletonType("Qt.example.qjsvalueApi", 1, 0,
                             "MyApi",
                             example_qjsvalue_singletontype_provider);


    // Register the singleton type provider with QML that provides multiple property values
    qmlRegisterSingletonType("Qt.example.qjsmultiplevalueApi", 1, 0,
                             "MultipleValueProvider",
                             example_qjsmultiplevalue_singletontype_provider);

    // Register the singleton type provider with QML
    qmlRegisterSingletonType<SingletonTypeExample>("Qt.example.qobjectSingleton", 1, 0,
                                                   "MySingletonObjApi",
                                                   example_qobject_singletontype_provider);


    // load the QmlEngine with default qml page (main.qml)
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
