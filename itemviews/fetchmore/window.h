#ifndef WINDOW_H
#define WINDOW_H

#include <QWidget>

QT_BEGIN_NAMESPACE
class QTextBrowser;
QT_END_NAMESPACE

class Window : public QWidget
{
    Q_OBJECT

public:
    Window(QWidget *parent = 0);

private:
    void setupUI();

private slots:
    void updateFileCount(int number);
    void updateOnClickHandler(const QModelIndex& index);
    void clearLogViewer();

private:
    QTextBrowser *m_logViewer;
};

#endif // WINDOW_H
