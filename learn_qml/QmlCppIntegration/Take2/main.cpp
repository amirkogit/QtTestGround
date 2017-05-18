#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "message.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

   // Inorder to use the properties of these classes from QML, the instance of these classes must be
   // registered as QML type
    qmlRegisterType<Message>("org.qml_cpp_integration.example",1,0,"Message");
    qmlRegisterType<MessageBody>("org.qml_cpp_integration.example",1,0,"MessageBody");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
