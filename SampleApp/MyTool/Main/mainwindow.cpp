#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "rfidmodule.h"
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent) :
                                          QMainWindow(parent),
                                          ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QMessageBox msg;
    RFIDModule rfid;
    int result = rfid.GetSum(2,4);
    QString rs = QString("Sum = %1").arg(result);
    QString ds = QString(" Diff=%1").arg(rfid.GetDiff(100,30));
    msg.setText(rs + ds);
    msg.exec();
}
