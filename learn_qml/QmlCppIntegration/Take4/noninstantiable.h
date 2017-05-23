#ifndef NONINSTANTIABLE_H
#define NONINSTANTIABLE_H

#include <QObject>

class NonInstantiable : public QObject
{
    Q_OBJECT

public:
    NonInstantiable();

private:
    int m_objectId;
    QString m_name;
};

#endif // NONINSTANTIABLE_H
