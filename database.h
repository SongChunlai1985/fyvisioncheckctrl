#ifndef IOTMESSAGE_H
#define IOTMESSAGE_H

#include <QObject>
#include <QNetworkCookie>

#include <network/tcpwork.h>
#include <network/httpwork.h>

class database: public QObject
{
    Q_OBJECT
public:
    tcpwork dataGet;
    QByteArray loginJsonByteArray;
    database();
    QString login(QString url, QString username, QString password);
    QNetworkCookie cookie;

    QUrl Url;
    QNetworkAccessManager* pManager = new QNetworkAccessManager(this);
    QNetworkRequest Request;
    int init = 1;
    QString Token;
    QString ExpireTime;
    QJsonObject getData(QString url, QString dataname);

    int code;

    QString schoolName;
    QStringList schoolNameList;
    int schoolid;
    QString schooluid;
    int BatchId;
    QString finishBatchId;

    QJsonArray classList;
    QStringList classNameList;
    QList<QStringList> classNameTable;
    QStringList gradeListset;
    QStringList gradeList;
    QJsonArray studentTable;
    QJsonArray studentList;
    QString clear();

    QJsonObject postData(QString url, QByteArray data);
};

#endif // IOTMESSAGE_H
