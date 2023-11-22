#include "commandmodel.h"


CommandModel::CommandModel(QObject *parent)
{

}

int CommandModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant CommandModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case ImagePathRole:
        return QVariant(m_data.at(index.row()).first);
    case CommandNameRole:
        return QVariant(m_data.at(index.row()).second);
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CommandModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[ImagePathRole] = "ipagePath";
    roles[CommandNameRole] = "commandName";

    return roles;
}

void CommandModel::add(const QString &path, const QString &name)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    QPair<QString, QString> pair;
    pair.first = path;
    pair.second = name;
    m_data.append(pair);
    endInsertRows();

    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
}
