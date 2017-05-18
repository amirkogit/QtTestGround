#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "message.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Inorder to use the properties of these classes from QML, the instance of these classes must be
    // properly set as context property of the QML engine
    Message msg;
    MessageBody msg_body;

    engine.rootContext()->setContextProperty("msg", &msg);
    engine.rootContext()->setContextProperty("msgbody", &msg_body);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
