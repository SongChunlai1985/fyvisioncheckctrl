#ifndef LOGINHANDLER_H
#define LOGINHANDLER_H

#include <QObject>
#include <QDebug>

class LoginHandler : public QObject
{
    Q_OBJECT
public:
    explicit LoginHandler(QObject *parent = nullptr);

signals:
    void signalLoginSucceeded();

public slots:
    void slotLogin(const QString &username, const QString &password);
};

#endif // LOGINHANDLER_H
