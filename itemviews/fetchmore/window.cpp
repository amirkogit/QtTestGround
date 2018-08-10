#include "filelistmodel.h"
#include "window.h"

#include <QtWidgets>

ApplicationWindow::ApplicationWindow(QWidget *parent)
    : QWidget(parent)
{
    setupUI();
}

void ApplicationWindow::updateFileCount(int number)
{
    m_logViewer->append(tr("%1 items added.").arg(number));
    auto filelist = m_fileListModel->getFileList();
    m_logViewer->append(filelist.join(", "));
}

void ApplicationWindow::updateOnClickHandler(const QModelIndex& index)
{
    m_logViewer->append(tr("%1 row %2 column clicked.").arg(index.row()).arg(index.column()));
    m_logViewer->append(tr("Value of clicked item: %1").arg(index.data().toString()));
}

void ApplicationWindow::clearLogViewer()
{
    m_logViewer->clear();
}

void ApplicationWindow::setupUI()
{
    m_fileListModel = new FileListModel(this);
    m_fileListModel->setDirPath("C:\\temp\\dcmtestdata");

    QLabel *label = new QLabel(tr("&Directory:"));
    QLineEdit *lineEdit = new QLineEdit;
    label->setBuddy(lineEdit);

    QListView *view = new QListView;
    view->setModel(m_fileListModel);

    m_logViewer = new QTextBrowser;
    m_logViewer->setSizePolicy(QSizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred));

    QPushButton* clearButton = new QPushButton("Clear log");

    // connect all signals and slots
    connect(lineEdit, &QLineEdit::textChanged,
            m_fileListModel, &FileListModel::setDirPath);
    connect(lineEdit, &QLineEdit::textChanged,
            m_logViewer, &QTextEdit::clear);
    connect(m_fileListModel, &FileListModel::numberPopulated,
            this, &ApplicationWindow::updateFileCount);
    connect(view, &QListView::clicked,
            this, &ApplicationWindow::updateOnClickHandler);
    connect(clearButton, &QPushButton::clicked,
            this, &ApplicationWindow::clearLogViewer);

    // add all widgets to layout
    QGridLayout *layout = new QGridLayout;
    layout->addWidget(label, 0, 0);
    layout->addWidget(lineEdit, 0, 1);
    layout->addWidget(view, 1, 0, 1, 2);
    layout->addWidget(m_logViewer, 2, 0, 1, 2);
    layout->addWidget(clearButton,3, 0, 1, 2);

    setLayout(layout);
    setWindowTitle(tr("Fetch More Example"));
    resize(1200,800);
}
