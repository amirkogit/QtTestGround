#include <QtWidgets>
#include "app.h"

AppMain::AppMain(QWidget *parent)
{
    resize(400,150);

    auto button_box = new QDialogButtonBox;
    _start_btn = new QPushButton(tr("Start"));
    _stop_btn = new QPushButton(tr("Stop"));
    button_box->addButton(_start_btn, QDialogButtonBox::ActionRole);
    button_box->addButton(_stop_btn, QDialogButtonBox::RejectRole);

    connect(_start_btn, &QAbstractButton::clicked, this, &AppMain::OnHandleStart);
    connect(_stop_btn, &QAbstractButton::clicked, this, &AppMain::OnHandleStop);

    QGridLayout *main_layout = nullptr;
    main_layout = new QGridLayout(this);
    main_layout->addWidget(button_box, 1, 0, 1, 2);

    setWindowTitle(QGuiApplication::applicationDisplayName());
}

void AppMain::OnHandleStart()
{
    _controller.Start();
}

void AppMain::OnHandleStop()
{
    _controller.Stop();
}
