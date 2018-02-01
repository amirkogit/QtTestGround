#pragma once

#include <QObject>
#include <QDialog>

#include "controller.h"

class QPushButton;

class AppMain : public QDialog
{
    Q_OBJECT

public:
    explicit AppMain (QWidget* parent = nullptr);

private slots:
    void OnHandleStart();
    void OnHandleStop();

private:
    QPushButton* _start_btn = nullptr;
    QPushButton* _stop_btn = nullptr;
    Controller _controller;
};

