#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QThread>

#include "mysubclassthread.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->btnLaunchThread, &QPushButton::clicked, this, &MainWindow::HandleOnThreadLaunch);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::HandleOnThreadLaunch()
{
    qDebug() << "Launching a thread...";

    MySubclassThread *thread = new MySubclassThread;
    connect(thread, &MySubclassThread::resultReady, this, &MainWindow::HandleThreadResult);
    connect(thread, &MySubclassThread::finished, thread, &MainWindow::deleteLater);
    thread->start();
    thread->wait();
}

void MainWindow::HandleThreadResult(const QString &s)
{
    qDebug() << "Result we got from another thread: " << s;
}
