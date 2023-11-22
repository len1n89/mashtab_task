#ifndef COMMANDMODEL_H
#define COMMANDMODEL_H

#include <QAbstractListModel>
#include <QPair>
#include <QString>

class CommandModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        ImagePathRole = Qt::UserRole + 1,
        CommandNameRole
    };

    CommandModel(QObject *parent = 0);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void add(const QString &path, const QString &name);

private:
    QList<QPair<QString, QString>> m_data;
};

#endif // COMMANDMODEL_H
