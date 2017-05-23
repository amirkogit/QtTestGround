#ifndef UNCREATABLETYPE_H
#define UNCREATABLETYPE_H

#include <QObject>

class UncreatableType : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString someText READ someText WRITE setSomeText NOTIFY someTextChanged)
    Q_ENUMS(DaysType)

public:
    UncreatableType();

    enum DaysType {
        SUNDAY = 1,
        MONDAY = 2,
        TUESDAY = 3,
        WEDNESDAY = 4,
        THURSDAY = 5,
        FRIDAY = 6,
        SATURDAY = 7
    };

    Q_INVOKABLE QString getClassName() {
        return "UncreatableType";
    }

    QString someText() const {
        return m_someText;
    }

    void setSomeText(const QString& txt) {
        m_someText = txt;
    }

signals:
    void someTextChanged();

private:
    QString m_someText;
};

#endif // UNCREATABLETYPE_H
