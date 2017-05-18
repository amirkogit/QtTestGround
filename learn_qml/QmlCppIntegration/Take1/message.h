#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

class MessageBody;

class Message : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(MessageBody* body READ body WRITE setBody NOTIFY bodyChanged)

public:
    Message();
    ~Message();

    void setAuthor(const QString &auth) {
        if(auth != m_author) {
            m_author = auth;
            emit authorChanged();
        }
    }

    QString author() const {
        return m_author;
    }

    MessageBody* body() const {
        return m_body;
    }

    void setBody(MessageBody* body) {
        m_body = body;
        emit bodyChanged();
    }

signals:
    void authorChanged();
    void bodyChanged();

private:
    QString m_author;       // exposed to QML as author PROPERTY
    MessageBody* m_body;    // exposed to QML as body PROPERTY
    QString m_other;        // not exposed to QML
};


class MessageBody : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)

public:
    MessageBody() {}
    ~MessageBody() {}

    QString description() const {
        return m_description;
    }

    void setDescription(const QString& desc) {
        if(m_description != desc) {
            m_description = desc;
            emit descriptionChanged();
        }
    }

signals:
    void descriptionChanged();

private:
    QString m_description;

};

#endif // MESSAGE_H
