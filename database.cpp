#include "database.h"

database::database(){
}

QString database::clear()
{
    schoolName = "";
    schoolid = 0;
    schooluid = "";
    classList = QJsonArray();
    classNameList.clear();
    gradeListset.clear();
    gradeList.clear();
    studentTable = QJsonArray();
    classNameTable.clear();
    schoolNameList.clear();
    return "";
}

QJsonObject database::postData(QString url, QByteArray data)
{
    Request.setRawHeader("Authorization", Token.toLocal8Bit());                                    //在https头上加载令牌
    Url = QUrl(url);
    Request.setUrl(Url);
    qDebug().noquote() << __FUNCTION__ << data;

    QJsonObject dataJ = ByteArray2JsonObject(data);
    QByteArray BytePost;
    BytePost.append("checkTime=").append(QString::number(qint64(dataJ["checkTime"].toDouble()))).append("&");
    BytePost.append("leftEye=").append(QString::number(dataJ["leftEye"].toInt())).append("&");
    BytePost.append("rightEye=").append(QString::number(dataJ["rightEye"].toInt())).append("&");
    BytePost.append("studentId=").append(QString::number(qint64(dataJ["studentId"].toDouble()))).append("&");
    BytePost.append("batchId=").append(QString::number(qint64(dataJ["batchId"].toDouble())));

    qDebug().noquote() << __FUNCTION__ << BytePost;

    QNetworkReply *pReply = pManager->post(Request, BytePost.data());

    QEventLoop loop;
    connect(pReply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    connect(pReply, static_cast<void (QNetworkReply::*)(QNetworkReply::NetworkError)>(&QNetworkReply::error), &loop, &QEventLoop::quit);
    loop.exec();

    QByteArray Replydata = pReply->readAll();
    qDebug().noquote() << __FUNCTION__ << Replydata;
    qDebug().noquote() << __FUNCTION__ << JsonObject2String(ByteArray2JsonObject(Replydata));

    QJsonObject ReplyJson = ByteArray2JsonObject(Replydata);
    QJsonObject rdata = ReplyJson["data"].toObject();
    code = ReplyJson["code"].toInt();
    QString msg = ReplyJson["msg" ].toString();
    qDebug() << __FUNCTION__ << msg;

    return rdata;
}

QJsonObject database::getData(QString url, QString dataname)
{
    Request.setRawHeader("Authorization", Token.toLocal8Bit());                                    //在https头上加载令牌
    Request.setUrl(url);                                                                           //https
    QNetworkReply *pReply ;
    if(dataname == "addBatchId")
    {
        QByteArray BytePost;
        BytePost.append("schoolId=").append(QString::number(schoolid));
        pReply = pManager->post(Request, BytePost.data());
    }
    else if(dataname == "finishBatchId")
    {
        QByteArray BytePost;
        BytePost.append("batchId=").append(QString::number(BatchId));
        pReply = pManager->post(Request, BytePost.data());
    }
    else
    {
        pReply = pManager->get(Request);
    }

    QEventLoop loop;
    connect(pReply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    connect(pReply, static_cast<void (QNetworkReply::*)(QNetworkReply::NetworkError)>(&QNetworkReply::error), &loop, &QEventLoop::quit);
    loop.exec();

    QByteArray Replydata = pReply->readAll();
    qDebug().noquote() << __FUNCTION__ << JsonObject2String(ByteArray2JsonObject(Replydata));

    QJsonObject ReplyJson = ByteArray2JsonObject(Replydata);
    QJsonObject data = ReplyJson["data"].toObject();
    if(dataname == "getSchool")
    {
        schoolName = data["schoolName"].toString();
        schoolid   = data["id"        ].toInt();
        schooluid  = data["uid"       ].toString();
        schoolNameList.push_back(schoolName);
    }

    if(dataname == "getClassList")
    {
        classList = ReplyJson["data"].toArray();
        foreach (QJsonValue Class, classList)
        {
            QJsonObject Objclass = Class.toObject();
            classNameList.push_back(Objclass["className"].toString());
            gradeListset.push_back(Objclass["grade"].toString());
            gradeList.push_back(Objclass["grade"].toString());
        }
        gradeListset = gradeListset.toSet().toList();
        foreach (QString grade, gradeListset)
        {
            QStringList gradeClass;
            foreach (QJsonValue Class, classList)
            {
                QJsonObject Objclass = Class.toObject();
                if(grade == Objclass["grade"].toString())gradeClass.push_back(Objclass["className"].toString());
            }
            classNameTable.push_back(gradeClass);
        }
        qDebug() << __FUNCTION__ << "classNameTable=" << classNameTable;
    }

    if(dataname == "getBatchId")
    {
        BatchId = ReplyJson["data"].toInt();
    }

    if(dataname == "addBatchId")
    {
        BatchId = ReplyJson["data"].toObject()["id"].toInt();
    }

    if(dataname == "finishBatchId")
    {
        finishBatchId = ReplyJson["msg"].toString();
    }

    if(dataname == "getStudentList")
    {
        studentList = ReplyJson["data"].toArray();
    }

    code = ReplyJson["code"].toInt();
    QString msg = ReplyJson["msg" ].toString();
    qDebug() << __FUNCTION__ << msg;
    return data;
}

QString database::login(QString url, QString username, QString password)
{
    if(username == "" || password == "")return "";
    Url = QUrl(url);

    if(init)
    {
        QSslConfiguration conf = Request.sslConfiguration();
        conf.setPeerVerifyMode(QSslSocket::VerifyNone);
        conf.setProtocol(QSsl::TlsV1_2);
        Request.setSslConfiguration(conf);
        Request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        init = 0;
    }

    QEventLoop loop;
    QByteArray BytePost;

    BytePost.append("account=").append(username).append("&");
    BytePost.append("password=").append(password);

    Request.setUrl(Url);                                                                           //https

    QNetworkReply *pReply = pManager->post(Request, BytePost.data());

    connect(pReply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    connect(pReply, static_cast<void (QNetworkReply::*)(QNetworkReply::NetworkError)>(&QNetworkReply::error), &loop, &QEventLoop::quit);
    loop.exec();

    QByteArray Replydata = pReply->readAll();
    qDebug().noquote() << __FUNCTION__ << JsonObject2String(ByteArray2JsonObject(Replydata));

    QJsonObject ReplyJson = ByteArray2JsonObject(Replydata);
    QJsonObject data = ReplyJson["data"].toObject();
    ExpireTime = data["expireTime"].toString();
    Token = data["token"].toString();
    code = ReplyJson["code"].toInt();
    QString msg = ReplyJson["msg"].toString();

    if(code == 200)return "OK";
    return msg;
}
