#include "loginhandler.h"

LoginHandler::LoginHandler(QObject *parent) : QObject(parent)
{

}

void LoginHandler::slotLogin(const QString &username, const QString &password)
{
    qDebug() << username << ":" << password;
    emit signalLoginSucceeded();
}
