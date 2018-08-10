#ifndef WINDOW_H
#define WINDOW_H

#include <QWidget>

QT_BEGIN_NAMESPACE
class QTextBrowser;
class FileListModel;
QT_END_NAMESPACE

class ApplicationWindow : public QWidget
{
    Q_OBJECT

public:
    ApplicationWindow(QWidget *parent = 0);

private:
    void setupUI();

private slots:
    void updateFileCount(int number);
    void updateOnClickHandler(const QModelIndex& index);
    void clearLogViewer();

private:
    QTextBrowser *m_logViewer;
    FileListModel* m_fileListModel;
};

#endif // WINDOW_H
