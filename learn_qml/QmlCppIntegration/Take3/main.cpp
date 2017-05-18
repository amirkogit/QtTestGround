#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "message.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Message>("org.qml_cpp_integration.example",1,0,"Message");
    qmlRegisterType<MessageAuthor>("org.qml_cpp_integration.example",1,0,"MessageAuthor");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
