#include "workthread.h"

WorkThread::WorkThread(){
}

void WorkThread::load(QString Database_Token_,
                      QString Database_id_,
                      QString Database_uid_,
                      QString schoolName_,
                      QString UserName_)
{
     Database_Token = Database_Token_;
     Database_id    = Database_id_;
     Database_uid   = Database_uid_;
     schoolName     = schoolName_;
     UserName       = UserName_;
}

void WorkThread::run()
{
    qDebug() << "run开始";
    JNIModel.startActivity(Database_Token,
                           Database_id,
                           Database_uid,
                           schoolName,
                           UserName);
    qDebug() << "run结束";
}
