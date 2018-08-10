#include "filelistmodel.h"

#include <QApplication>
#include <QBrush>
#include <QDir>
#include <QPalette>

FileListModel::FileListModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

//![4]
int FileListModel::rowCount(const QModelIndex & /* parent */) const
{
    return m_fileCount;
}

QVariant FileListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() >= m_fileList.size() || index.row() < 0)
        return QVariant();

    if (role == Qt::DisplayRole) {
        return m_fileList.at(index.row());
    } else if (role == Qt::BackgroundRole) {
        int batch = (index.row() / 100) % 2;
        if (batch == 0)
            return qApp->palette().base();
        else
            return qApp->palette().alternateBase();
    }
    return QVariant();
}

QStringList FileListModel::getFileList() const
{
    return m_fileList;
}

int FileListModel::getFileCount() const
{
    return m_fileCount;
}
//![4]

//![1]
bool FileListModel::canFetchMore(const QModelIndex & /* index */) const
{
    if (m_fileCount < m_fileList.size())
        return true;
    else
        return false;
}
//![1]

//![2]
void FileListModel::fetchMore(const QModelIndex & /* index */)
{
    int remainder = m_fileList.size() - m_fileCount;
    int itemsToFetch = qMin(100, remainder);

    if (itemsToFetch <= 0)
        return;

    beginInsertRows(QModelIndex(), m_fileCount, m_fileCount+itemsToFetch-1);

    m_fileCount += itemsToFetch;

    endInsertRows();

    emit numberPopulated(itemsToFetch);
}
//![2]

//![0]
void FileListModel::setDirPath(const QString &path)
{
    QDir dir(path);

    beginResetModel();
    m_fileList = dir.entryList();
    m_fileCount = 0;
    endResetModel();
}
//![0]

