#ifndef SINGLETONTYPEEXAMPLE_H
#define SINGLETONTYPEEXAMPLE_H

// Singleton type example that is derived from QObject

#include <QObject>

class SingletonTypeExample : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int propertyInt READ propertyInt WRITE setPropertyInt NOTIFY propertyIntChanged)
    Q_PROPERTY(QString propertyString READ propertyString WRITE setPropertyString NOTIFY propertyStringChanged)

public:
    // constructor
    SingletonTypeExample(QObject* parent = 0)
        : QObject(parent),m_propertyInt(250), m_propertyString("Default Str from C++")
    {

    }

    // destructor
    ~SingletonTypeExample() {}

    // invokable functions
    Q_INVOKABLE bool someInvokableFunction() {
        setPropertyInt(1000);
        return true;
    }

    // Getters and Setters for property
    int propertyInt() const {
        return m_propertyInt;
    }

    void setPropertyInt(int val) {
        m_propertyInt = val;
        emit propertyIntChanged(val);
    }

    QString propertyString() const {
        return m_propertyString;
    }

    void setPropertyString(const QString& val) {
        m_propertyString = val;
        emit propertyStringChanged(val);
    }

signals:
    void propertyIntChanged(int newValue);
    void propertyStringChanged(QString newValue);

private:
    int m_propertyInt;
    QString m_propertyString;
};


// some forward declarations
class QQmlEngine;
class QJSEngine;

// Define Singleton type provider function (callback).
static QObject *example_qobject_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    SingletonTypeExample *example = new SingletonTypeExample();
    return example;
}

#endif // SINGLETONTYPEEXAMPLE_H
