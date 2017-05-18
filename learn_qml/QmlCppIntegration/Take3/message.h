#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

class MessageAuthor : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QString email READ email WRITE setEmail)

public:
    MessageAuthor() {
        m_name = "Default name from C++";
        m_email = "Default email from C++";
    }

    QString name() const {
        return m_name;
    }

    void setName(const QString& name) {
        m_name = name;
    }

    QString email() const {
        return m_email;
    }

    void setEmail(const QString& email) {
        m_email = email;
    }

private:
    QString m_name;
    QString m_email;
};


class Message : public QObject
{
    Q_OBJECT

    Q_PROPERTY(MessageAuthor* author READ author)

public:
    Message()
        :m_author(new MessageAuthor())
    {
    }

    MessageAuthor* author() const {
        return m_author;
    }

private:
    MessageAuthor* m_author;
};

#endif // MESSAGE_H
