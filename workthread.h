#ifndef WORKTHREAD_H
#define WORKTHREAD_H

#include <QThread>
#include <QDebug>

#include <wifimanager/wifimanager.h>

class WorkThread: public QThread
{
public:
    WorkThread();
    WifiManager JNIModel;
    void load(QString Database_Token_,
              QString Database_id_,
              QString Database_uid_,
              QString schoolName_,
              QString UserName_);

    QString Database_Token;
    QString Database_id;
    QString Database_uid;
    QString schoolName;
    QString UserName;
protected:
    void run();
};

#endif // WORKTHREAD_H
