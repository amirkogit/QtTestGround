#ifndef SINGLETONTYPEQJSVALUE_H
#define SINGLETONTYPEQJSVALUE_H

#include <QDateTime>

// An example of Singleton type of QJSValue
// Ref: http://doc.qt.io/qt-5/qqmlengine.html#qmlRegisterSingletonType
// Here you have to define the singleton type provider function (callback).


// handles a single property
static QJSValue example_qjsvalue_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)

    static int seedValue = 10;
    QJSValue example = scriptEngine->newObject();
    example.setProperty("someProperty", seedValue++);
    return example;
}

// handles multiple property
static QJSValue example_qjsmultiplevalue_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)

    QJSValue example = scriptEngine->newObject();
    example.setProperty("propertyInt", 80);
    example.setProperty("propertyString","testString");
    example.setProperty("propertyDate",QDateTime::currentDateTime().toString());
    return example;
}

#endif // SINGLETONTYPEQJSVALUE_H
