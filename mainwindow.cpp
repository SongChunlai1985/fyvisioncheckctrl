#include "mainwindow.h"

void MainWindow::SetLight(int dg3, int dg4, int dg5, int dg6, int dg7, int dg8, int dg9, int dg10)
{
    if(dg3 == 2) image3s = mns; if(dg3 == 0) image3s = mxs; if(dg3 == 1) image3s = mrs;
    if(dg4 == 2) image4s = mns; if(dg4 == 0) image4s = mxs; if(dg4 == 1) image4s = mrs;
    if(dg5 == 2) image5s = mns; if(dg5 == 0) image5s = mxs; if(dg5 == 1) image5s = mrs;
    if(dg6 == 2) image6s = mns; if(dg6 == 0) image6s = mxs; if(dg6 == 1) image6s = mrs;
    if(dg7 == 2) image7s = mns; if(dg7 == 0) image7s = mxs; if(dg7 == 1) image7s = mrs;
    if(dg8 == 2) image8s = mns; if(dg8 == 0) image8s = mxs; if(dg8 == 1) image8s = mrs;
    if(dg9 == 2) image9s = mns; if(dg9 == 0) image9s = mxs; if(dg9 == 1) image9s = mrs;
    if(dg10 == 2) image10s = mns; if(dg10 == 0) image10s = mxs; if(dg10 == 1) image10s = mrs;
}

void MainWindow::TcpConnected()
{
    emit tcpConnected();
}

void MainWindow::TcpDisConnected()
{
    dbg("Tcp连接断开");
    emit tcpDisConnected();
}

void MainWindow::UdpMsgReady()
{
    while(udpw.udpprrcv->hasPendingDatagrams())
    {
        QByteArray dt;
        dt.resize(udpw.udpprrcv->pendingDatagramSize());
        QHostAddress sender;
        quint16 senderPort;
        udpw.udpprrcv->readDatagram(dt.data(), dt.size(), &sender, &senderPort);
        QString dts(dt);
        if(QString(dts).left(37) == "__FYVISIONCHECK__PAIRING__BROADCAST__")
        {
            if(tcpw.tcpsender->isOpen()) tcpw.tcpsender->close();
            tcpw.tcpsender->connectToHost(sender, tcpport);
//            // 判断是否连接
//            if(tcpw.tcpsender -> isOpen())
//            {
//                qDebug() << "Connected";
//            }
//            else {
//                qDebug() << "Not connected";
//                emit tcpDisConnected();
//            }
            serverip = sender.toString().mid(7);
            dbg(QString(" gotme ") + sender.toString() + " ");
        }
    }
}

void MainWindow::dbg(QString msg)                                                                  //socat - udp4-listen:123456
{
    if(msg == "") return;
    udpw.dbg(msg);
}

void MainWindow::setuip(QString IP)
{
    udpw.UIp = IP;
    tcpw.tcpsender->close();
    tcpw.tcpsender->connectToHost(QHostAddress(IP), tcpport);
    serverip = IP;
    TextIP = IP;
    SaveUserData();
    qDebug() << __FUNCTION__ << IP;
}

QString MainWindow::setIp(QString ScanMessage)
{
    QJsonObject ObjScanMessage = String2JsonObject(ScanMessage);
    QString IP = ObjScanMessage["IP"].toString();
    if(IP != "")
    {
        setuip(IP);
        TextIP = IP;
        SaveUserData();
        return "已连接";
    }
    return "";
}

void MainWindow::drawE()
{
    Fcv.drawE2(6, np, edir, eimg);
}

MainWindow::MainWindow()
{
    if(!QDir(rootPath).exists()) QDir().mkpath(rootPath);                                          //建立目录需要一些时间
    if(!QDir(rootPath+dataPath).exists()) QDir().mkpath(rootPath + dataPath);

    udpw.myname = "Pad";
    CurrentRow = 0;

    tblvisionrecord_table_model_horHeader = QStringList
    {
        "条目", "*所属区", "*所属学校", "*学校机构代码", "*姓名", "*学籍号",
        "*证件类型（身份证/护照/其他）", "*证件号码", "*性别", "*机构单位层次",
        "*学校性质", "*学年", "*年级", "*班级", "*身高（cm）", "*体重（kg）",
        "一般检查医师", "*裸眼视力左（对数表）", "*裸眼视力右（对数表）", "视力检查医师",
        "血压收缩压（mmHg）", "血压舒张压（mmHg）", "*脉搏（次数/分钟）",
        "血压脉搏检查医师", "*心脏（正常/异常/未体检）", "心脏备注", "*肺（正常/异常/未体检）",
        "肺备注", "*肝脾（正常/异常/未体检）", "肝脾备注", "心肺脾检查医师",
        "*眼科（常规）（外眼（斜视等）、内眼（沙眼等））（正常/异常/未体检）",
        "眼科（常规）备注", "眼科（可选）（色觉、矫正视力等）（正常/异常/未体检）",
        "眼科（可选）备注", "*口腔（牙齿、牙周等）（正常/异常/未体检）", "口腔备注",
        "*耳鼻咽喉科（常规）（外耳、内耳、鼻腔、咽喉部、扁桃体等）（正常/异常/未体检）",
        "耳鼻咽喉（常规）备注", "耳鼻咽喉科（可选）（嗅觉、听力）（正常/异常/未体检）",
        "耳鼻咽喉（可选）备注", "*残缺畸形（正常/异常/未体检）", "畸形备注",
        "*外科（常规）（头部、颈部、胸部、脊柱、腹部、四肢、皮肤、淋巴结等）（正常/异常/未体检）",
        "外科（常规）备注", "外科（可选）（隐睾、疝气、包皮过长、精索静脉曲张等）（正常/异常/未体检）",
        "外科（可选）备注", "外科检查医师", "血常规检查（正常/异常/未体检）", "血常规备注",
        "血清丙氨酸氨基转移酶（U/L）（正常/异常/未体检）", "血清丙氨酸氨基转移酶备注", "血常规检查医师",
        "肛门（正常/异常/未体检）", "肛门备注", "足底（正常/异常/未体检）", "足底备注",
        "月经史（有/无/未体检）", "尿常规（正常/异常/未体检）", "尿常规备注",
        "蛔虫卵（μm）（有/无/未体检）", "检查医师", "即往病史（有就填写真实情况/无/未体检）",
        "现病史（有就填写真实情况/无/未体检）", "体检结论", "健康指导", "*体检机构", "*检查日期", "体检备注",
        "完成状态", "计划检测时间", "导入时间", "导入人员",
        "学校ID", "学校UID", "班级ID", "班级UID", "学生ID", "学生UID", "SHA256", "SN",
        "预留1", "预留2", "预留3", "预留4", "预留5", "预留6", "预留7"
    };

    tblstudent_table_model_horHeader = QStringList
    {
        "学生ID", "姓名", "年级", "班级", "学校", "检查状态", "班ID", "班UID", "学校ID", "学校UID", "UID",
        "预留1", "预留2", "预留3", "预留4", "预留5", "预留6", "预留7"
    };
}

void MainWindow::init()
{
    std::vector<std::string> ip = getMyIp();
    
    for(uint i = 0; i < ip.size(); i++)
    {
        qDebug() << __FUNCTION__ << QString::fromStdString(ip[i]);
        if(ip[i].find(".", 0) < ip[i].length() &&
                ip[i] != "127.0.0.1")
        {
            MyIp = ip[i];
        }
    }
    
    connect(tcpw.tcpsender, &QTcpSocket::connected, this, &MainWindow::TcpConnected);
    connect(tcpw.tcpsender, &QTcpSocket::disconnected, this, &MainWindow::TcpDisConnected);
    connect(tcpw.tcpsender, &QTcpSocket::readyRead, this, &MainWindow::TcpMsgReady);
    connect(udpw.udpprrcv, &QUdpSocket::readyRead, this, &MainWindow::UdpMsgReady);
    
    Fcv.drawE0(150, 150, 300, 0, 255);
    Fcv.init();
    
    mxs = Fcv.QmlLoadimage("assets:/w.png");                                                      //这里不直接用图片地址因为qml频繁操作文件会产生卡顿
    mrs = Fcv.QmlLoadimage("assets:/r.png");
    mns = "";                                                                                     //Fcv.QmlLoadimage("assets:/n.png");

    checkPermission("android.permission.WRITE_EXTERNAL_STORAGE");

    QFile *file = new QFile(rootPath + dataPath + "/userdata.csv");
    if(!file->exists())return;
    file->open(QIODevice::ReadOnly);
    UserData = file->readAll();
    QList<QByteArray> Userdata = UserData.split(',');
    if(Userdata.size() > 0)UserName = Userdata[0];
    if(Userdata.size() > 1)TextIP = Userdata[1];
    if(Userdata.size() > 2)totalsymbol = Userdata[2].toInt();
    if(Userdata.size() > 3)view = Userdata[3];
    if(Userdata.size() > 4)programMode = Userdata[4];
    if(Userdata.size() > 5)distance = Userdata[5];
    if(Userdata.size() > 6)rememberPW = Userdata[6].toInt();
    if(Userdata.size() > 7)PassWord = QString(QByteArray::fromBase64(
                                                QByteArray::fromBase64(Userdata[7],
                                                QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals),
                                                QByteArray::OmitTrailingEquals)
                                             );

    totalsymbol = totalsymbol == 0 ? 4 : totalsymbol;
    file->close();
#if 0
    ble.BlueDeviceInit("SH-eS.*", "53480001-534d-4152-542d-455343414c45");
    connect(&ble, &BlueDevice::ValueArrive, this, &MainWindow::ValueArrive);
#endif

    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &MainWindow::queryMessage);
    timer->setInterval(1000);
    timer->start();

    timer1 = new QTimer(this);
    connect(timer1, &QTimer::timeout, this, &MainWindow::returnhzt2);
    timer1->setInterval(1);
}

void MainWindow::queryMessage()
{
#if 0
    if(Done)return;
    Done = 1;
#endif
    QJsonObject queryJson = ByteArray2JsonObject(WT.JNIModel.queryMessage().toUtf8());
    //qDebug().noquote() << __FUNCTION__ << JsonObject2ByteArray(queryJson);
    if(queryJson["msg"].toString() == "success")
    {
        emit tofm07();
        data0 = queryJson["data"].toObject();
        initWork(data0["classgrade"].toString(), data0["className"].toString());
        fm05_ab1_onClicked();
        dataFromhzt = 1;
    }
}
void MainWindow::queryMessage2()
{
    QJsonArray items = DataJson["items"].toArray();
    for(int i = 0; i < items.size(); i++)
    {
        QJsonObject stu = items[i].toObject();
        if(stu["k11_studentuid"].toString() == data0["studentuid"].toString())
        {
            emit quickSelectrow(i);
        }
    }
}

void MainWindow::returnhzt2()
{
    timer1->stop();
    WT.JNIModel.returnhzt();
}

void MainWindow::returnhzt()
{
    timer1->start();
}

void MainWindow::ValueArrive(QByteArray value)
{
    qDebug() << QString(value);
    value.replace("W:", "@");
    value.replace("H:", "@");
    value.replace("\r\n", "");

    QByteArrayList values = value.split('@');
    foreach(QByteArray value, values) {
        qDebug() << QString(value);
    }
}

void MainWindow::TcpMsgReady()
{
    QByteArray receivemsg = tcpw.tcpsender->readAll();
    if(receivemsg == "") return;
    QList<QByteArray> msgs = receivemsg.split('\0');                                                //去除粘连
    dbg(__FUNCTION__ + QString("------------------------------------"));

    if(QString(msgs[0]) == " welcome ")
    {
        tcpw.tsend("__SHOW_DEVICE_INFO__");
        msgs[0] = "";
        if(UserName != "")login(UserName, PassWord, rememberPW);                                   //掉线续传
    }

    if(msgs.size() > 1)                                                                              //拼接处理
    {
        NextMsg.push_back(msgs[0]);
        msgs[0] = NextMsg;
        NextMsg = msgs[msgs.size()-1];
    }
    else
    {
        NextMsg.push_back(receivemsg);
    }

    for(int i = 0; i < msgs.size() - 1; i++)
    {
        dbg(__FUNCTION__ + QString("'") + QString(msgs[i]) + QString("' 共") + QString::number(msgs.size()) + QString("段"));

        QJsonObject JsonPakge = ByteArray2JsonObject(msgs[i]);

        if(JsonPakge["keypress"] == "M") {
            lv = JsonPakge["currentlevel"].toString().toInt();
            Fcv.drawE2(40, JsonPakge["currentdirection"].toString().toInt(), edir, eimg, totalsymbol);
            if(JsonPakge["swch"].toString().toInt()) lr = "1"; else lr = "0";

            tstend = JsonPakge["testend"].toString();
            SetLight(JsonPakge["light03"].toString().toInt(),
                     JsonPakge["light04"].toString().toInt(),
                     JsonPakge["light05"].toString().toInt(),
                     JsonPakge["light06"].toString().toInt(),
                     JsonPakge["light07"].toString().toInt(),
                     JsonPakge["light08"].toString().toInt(),
                     JsonPakge["light09"].toString().toInt(),
                     JsonPakge["light10"].toString().toInt()
                    );
            el01 = JsonPakge["DecimalRecord"].toString();
            el02 = JsonPakge["FiveMarkRecord"].toString();
            if(tstend == "10")
            {
                el01 = JsonPakge["testresultr"].toString();
                el02 = JsonPakge["testresultl"].toString();

                fm07_getTable();

                QString testresultl = JsonPakge["testresultl"].toString();
                QStringList testresultlL = testresultl.split('/');

                QString testresultr = JsonPakge["testresultr"].toString();
                QStringList testresultrL = testresultr.split('/');

                if(tmpstudentTable[0].toArray()[0].toObject()["id"].toString().toInt() > 0){
                    Database.postData("https://height.haizitong.com/api/addVisionData", mkjson
                                      ("studentId", tmpstudentTable[0].toArray()[0].toObject()["id"].toString().toInt(),
                                       "leftEye", int(QString(testresultlL[0]).toDouble() * 10),
                                       "rightEye", int(QString(testresultrL[0]).toDouble() * 10),
                                       "checkTime", QDateTime::currentMSecsSinceEpoch(),
                                       "batchId", double(Database.BatchId))
                                     );
                }
            }
            EyeChart      = JsonPakge["EyeChart"].toString();
            Type          = JsonPakge["Type"].toString();
            StepStr       = JsonPakge["StepStr"].toString();
            Number        = JsonPakge["Number"].toString();
            DirectionName = JsonPakge["DirectionName"].toString();
            emit sigarv();
            continue;
        }

        if(JsonPakge["keypress"] == "当日检查计划数据")
        {
            DataArray.clear();
            DataArray.push_back(msgs[0]);

            qDebug().noquote() << __FUNCTION__ << QString("当日检查计划数据: ") +
                                  QString::number(DataArray.size()) + QString(" ") << DataArray;

            DataJson      = JsonPakge["data"].toObject();
            DataJsonArray = DataJson["items"].toArray();
            Header        = DataJsonArray.first().toObject().keys();
            SelectedRows.clear();
            SelectedRows.resize(DataJsonArray.size());

            // sleep(2);
            emit databaseready_TodayPlan();
            if(dataFromhzt == 1)
            {
                queryMessage2();
                dataFromhzt = 0;
            }
            continue;
        }

        if(JsonPakge["keypress"] == "学生信息数据")
        {
            DataArray.clear();
            DataArray.push_back(msgs[0]);

            qDebug().noquote() << __FUNCTION__ << QString("学生信息数据: ") +
                                  QString::number(DataArray.size()) + QString(" ") << DataArray;

            DataJson      = JsonPakge["data"].toObject();
            DataJsonArray = DataJson["items"].toArray();
            Header        = DataJsonArray.first().toObject().keys();
            SelectedRows.clear();
            SelectedRows.resize(DataJsonArray.size());
            dbg("学生信息数据:" + QString::number(SelectedRows.size()) + "条");
            emit databaseready_StudentInfo();
            continue;
        }

        if(JsonPakge["keypress"] == "学生检查记录")
        {
            DataArray.clear();
            DataArray.push_back(msgs[0]);

            qDebug().noquote() << __FUNCTION__ << QString("学生检查记录: ") +
                                  QString::number(DataArray.size()) + QString(" ") << DataArray;

            DataJson      = JsonPakge["data"].toObject();
            DataJsonArray = DataJson["items"].toArray();
            Header        = DataJsonArray.first().toObject().keys();
            SelectedRows.clear();
            SelectedRows.resize(DataJsonArray.size());

//            leftLevel = "4.8";
//            rightLevel = "4.8";

//            if(DataJsonArray.size() >= 2 && programMode == "快速模式")
//            {
//                leftLevel  = DataJsonArray.last().toObject()["k__0016_Q"].toString();
//                rightLevel = DataJsonArray.last().toObject()["k__0017_R"].toString();
//            }

            if(tstend != "10")sendCheckMode();
            emit databaseready_CheckRecord();
            continue;
        }

        if(JsonPakge["keypress"] == "导入完成")
        {
            if(ImportForm == "Form05")tcpw.tsend(mkjson("keypress", "查询当日检查计划"));
            if(ImportForm == "Form06")tcpw.tsend(mkjson("keypress", "学生信息检索"));
        }

        if(JsonPakge["keypress"] == "更改完成状态完成")
        {
            int sum = 0;
            for(int i = 0; i < SelectedRows.size(); i++)
            {
                if(SelectedRows[i] == 1)
                {
                    SelectedRows[i] = 0;
                    setRow(i);
                    setStep(STEP);
                    sum++;
                }
            }
            if(!sum) tcpw.tsend(SearchJosn);
        }
        if(JsonPakge["软件信息"] != "")
        {
            emit softInfoArrive(JsonPakge["软件信息"].toString(), ANDROID_VERSION_NAME);
        }

        if(JsonPakge["keypress"] == "检查方式")
        {
            Ready = true;
            emit checkReady();
        }
    }
}

void MainWindow::setStep(QString Step)
{
    STEP = Step;
    tcpw.tsend(mkjson("keypress", "更改完成状态", "Step", Step));
}

void MainWindow::on_pushButton_clicked()
{
    tcpw.tsend(mkjson("keypress", "W"));
}

void MainWindow::on_pushButton_5_clicked()
{
    tcpw.tsend(mkjson("keypress", "S"));
}

void MainWindow::cstart()
{
    qDebug("%s", "command start sent");
    if(!Ready)
    {
        QThread::msleep(500);
//        QEventLoop loop;
//        connect(this, &MainWindow::checkReady, &loop, &QEventLoop::quit);
//        loop.exec();
//        qDebug("%s", "ready");
        if (!Ready) qDebug() << "not ready";
    }                                                                                                      //等待通讯完成

    tcpw.tsend(mkjson("keypress", "F"));
    qDebug("%s", "command end sent");
}

void MainWindow::on_pushButton_9_clicked()
{
    tcpw.tsend(mkjson("keypress", "Q"));
    distance = "5米";
    SaveUserData();
}

void MainWindow::on_pushButton_6_clicked()
{
    tcpw.tsend(mkjson("keypress", "E"));
    distance =/*"2.5米"*/ "4米";
    SaveUserData();
}

void MainWindow::continu()
{
    downloaddata();
    tcpw.tsend(mkjson("keypress", "continue"));
}

void MainWindow::fm05_ab1_onClicked()
{
    qDebug().noquote() << __FUNCTION__;
    Ready = false;
    tcpw.tsend(mkjson("keypress", "查询当日检查计划",
                      "currentClass", currentClass));
}

void MainWindow::fm07_getTable()
{
    tcpw.tsend(mkjson("keypress", "查询学生检查记录"));
}

void MainWindow::fm06_ab1_onClicked(QString k02_Name,
                                    QString k11_Class,
                                    QString k07_SchoolName,
                                    QString k18_CheckTime_a,
                                    QString k18_CheckTime_b,
                                    QString k10_Grade,
                                    QString k01_StudentID,
                                    QString k16_Step
                                    ){
    if(k16_Step == "")k16_Step = "空白状态";
    if(k16_Step == "全部状态")k16_Step = "";
    SearchJosn  = mkjson("keypress", "学生信息检索",
                         /*"k02_Name"*/          "k__0003_D", k02_Name,
                         /*"k11_Class"*/         "k__0012_M", k11_Class,
                         /*"k07_SchoolName"*/    "k__0001_B", k07_SchoolName,
                         /*"k18_CheckTime_a"*/   "k__0066_BO_a", k18_CheckTime_a,
                         /*"k18_CheckTime_b"*/   "k__0066_BO_b", k18_CheckTime_b,
                         /*"k10_Grade"*/         "k__0011_L", k10_Grade,
                         /*"k01_StudentID"*/     "k__0004_E", k01_StudentID,
                         /*"k16_Step"*/          "k__0068_BQ", k16_Step);
    tcpw.tsend(SearchJosn);
    WT.JNIModel.ShowSoftKeyboard(0);
}

void MainWindow::setSymbol(QString modeName)
{
    if(modeName == "正常视标")
    {
        totalsymbol = 4;
    }
    if(modeName == "儿童视标")
    {
        totalsymbol = 7;
    }
    if(modeName == "单显")
    {
        view = "单显";
    }
    if(modeName == "排显")
    {
        view = "排显";
    }
    if(modeName == "快速模式")
    {
//        programMode = "快速模式";
//        if(DataJsonArray.size() >= 2)
//        {
//            leftLevel  = DataJsonArray.last().toObject()["k__0016_Q"].toString();
//            rightLevel = DataJsonArray.last().toObject()["k__0017_R"].toString();
//        }
//        else {
//             leftLevel  = "4.8";
//             rightLevel = "4.8";
//        }
        leftLevel   = "4.8";
        rightLevel  = "4.8";
        programMode = "快速模式";
    }
    if(modeName == "标准模式")
    {
        leftLevel   = "4.0";
        rightLevel  = "4.0";
        programMode = "标准模式";
    }
    sendCheckMode();
    SaveUserData();
    qDebug().noquote() << __FUNCTION__ << leftLevel << rightLevel << programMode;
}

void MainWindow::sendCheckStudent()
{
    creatTempdata();
    QByteArray checkStudentJson = mkjson("studentname", getStudentName(),
                                         "birthday", getStudentBirthday(),
                                         "class", getStudentClass(),
                                         "gender", getGender(),
                                         "id", getStudentId());
    tcpw.tsend(checkStudentJson);

    emit buttonChecked(totalsymbol == 4,
                       view == "单显",
                       programMode == "快速模式",
                       distance == "5米");
}

void MainWindow::sendCheckMode()
{
    tcpw.tsend(mkjson("keypress", "检查方式",
                      "totalsymbol", totalsymbol,
                      "view", view,
                      "programMode", programMode,
                      "distance", distance,
                      "leftLevel", leftLevel,
                      "rightLevel", rightLevel));
}

void MainWindow::setRow(int row)
{
    qDebug().noquote() << __FUNCTION__;
    CurrentRow = row;
    tcpw.tsend(mkjson("keypress", "设置当前行", "行号", QString::number(row)));
}

void MainWindow::selectedRow(int row)
{
    qDebug().noquote() << __FUNCTION__ << row;
    if(!SelectedRows.size())
    {
        fm05_ab1_onClicked();
        return;
    }
    qDebug().noquote() << __FUNCTION__ << SelectedRows.size();
    if(SelectedRows.size() > row)
    {
        SelectedRows[row] = SelectedRows[row] == 1 ? 0 : 1;
    }
    emit databaseready_StudentInfo();
}

void MainWindow::selectedAll()
{
    for(int i = 0; i < SelectedRows.size(); ++i)
    {
        SelectedRows[i] = 1;
    }
    emit databaseready_StudentInfo();
}

void MainWindow::importcsv(QString filename, QString importForm)                                   //读取csv或xlsx文件
{
    ImportForm = importForm;
    filename = filename.mid(7);                                                                    //去掉file://
    dbg(filename);
    QJsonObject tableJson;
    if(filename.right(5).toLower() == ".xlsx")
    {
        Csv.table = xlsx.read(filename);
    }
    else
    {
        Csv.init(filename);
        Csv.readcsv();
    }

    Csv.Keys = QStringList();
    if(Csv.table.size())Csv.table.removeFirst();                                                   //第1行为表标题
    if(Csv.table.size())Csv.Keys = Csv.table[0];                                                   //第2行为表头
    if(Csv.table.size())Csv.table.removeFirst();

    tableJson = Csv.getJson(Csv.autoKeys(Csv.Keys.size()));

    tableJson.insert("keypress", "导入检测记录");

    tcpw.tsend(JsonObject2ByteArray(tableJson));
}


void MainWindow::exportcsv(QString filename, QString importForm)
{
    ImportForm = importForm;
    filename = filename.mid(7);
    if(filename.right(4).toLower() != ".csv" &&
            filename.right(5).toLower() != ".xlsx")
        filename += ".csv";
    if(importForm == "Form06")
    {
        Csv.init(filename);
        Csv.putJson(DataJson, 0);                                                                 //丢掉第0列
        if(filename.right(5).toLower() == ".xlsx")
        {
            Csv.table.insert(0, tblvisionrecord_table_model_horHeader);
            QStringList row;
            row.push_back("学生视力检查记录表");
            for(int i = 0; i < 22; i++)
            {
                row.push_back("");
            }
            Csv.table.insert(0, row);
            xlsx.write(filename, Csv.table/*Gbk()*/);
        }
        if(filename.right(4).toLower() == ".csv")
        {
            Csv.writecsv("学生视力检查记录表", tblvisionrecord_table_model_horHeader);
        }
    }
}

void MainWindow::SaveUserData()
{
    QFile *file = new QFile(rootPath + dataPath + "/userdata.csv");
    file->open(QIODevice::WriteOnly);
    UserData = (UserName + "," + TextIP + "," + QString::number(totalsymbol) + "," +
                view + "," + programMode + "," + distance + "," +
                QString::number(rememberPW) + "," + (rememberPW ?
                QString(PassWord.toUtf8().toBase64(QByteArray::Base64UrlEncoding |
                QByteArray::OmitTrailingEquals).toBase64(QByteArray::OmitTrailingEquals))
                : "")).toUtf8();
    file->write(UserData);
    file->close();
    qDebug().noquote() << __FUNCTION__ << UserData;
}

void MainWindow::creatTempdata()
{
    tmpclassList = QJsonArray();
    tmpstudentTable = QJsonArray();

    tmpclassList.push_back(currentClass);

    QJsonObject student;
    student.insert("id", getStudentId());
    student.insert("studentName", getStudentName());
    student.insert("uid", getStudentUId());
    student.insert("gender", getGender());
    student.insert("birthday", getStudentBirthday());

    QJsonArray students;
    students.push_back(student);

    tmpstudentTable.push_back(students);
    qDebug() << __FUNCTION__;
}

QString MainWindow::downloaddata()
{
    Csv.maketable(Database.schoolName, QString::number(Database.schoolid),
                  Database.schooluid, tmpclassList, tmpstudentTable);
    QJsonObject tableJson;
    tableJson = Csv.getJson(Csv.autoKeys(tblvisionrecord_table_model_horHeader.size()));
    tableJson.insert("keypress", "导入检测记录");
    tcpw.tsend(JsonObject2ByteArray(tableJson));
    return "";
}

void MainWindow::changeGrade(int currentIndex)
{
    if(Database.classNameTable.size())
        emit showWorkTable(Database.schoolNameList, Database.gradeListset,
                           Database.classNameTable[currentIndex], QString::number(Database.BatchId));
}

void MainWindow::initWork(QString currentText2, QString currentText3)
{
    foreach(QJsonValue Class, Database.classList)
    {
        QJsonObject Objclass = Class.toObject();
        if(currentText2 == Objclass["grade"].toString() && currentText3 == Objclass["className"].toString())                     //遍历查找班级
        {
            currentClass = Objclass;
            Database.getData("https://height.haizitong.com/api/getStudentList?classId=" +
                             QString::number(Objclass["id"].toInt()), "getStudentList");
            QJsonArray students;
            /**
            "k01_studentid",
            "k02_studentName",
            "k03_grade",
            "k04_className",
            "k05_schoolName",

            "k06_checkstate",
            "k07_classid",
            "k08_classuid",
            "k09_schoolid",
            "k10_schooluid",
            "k11_studentuid"
            */

            foreach(QJsonValue studentl, Database.studentList) {
                QJsonObject studentJson = studentl.toObject();
                QJsonArray student;

                student.push_back(QString::number(studentJson["id"].toInt()));
                student.push_back(studentJson["studentName"].toString());
                student.push_back(currentText2);
                student.push_back(currentText3);
                student.push_back(Database.schoolName);

                student.push_back("");
                student.push_back(QString::number(Objclass["id"].toInt()));
                student.push_back(Objclass["uid"].toString());
                student.push_back(QString::number(Database.schoolid));
                student.push_back(Database.schooluid);
                student.push_back(studentJson["uid"].toString());

                qint64 birthdaySec = studentJson["birthday"].toDouble();
                QDateTime birthday = QDateTime::fromMSecsSinceEpoch(birthdaySec);
                student.push_back(birthday.toString("yyyy年MM月dd日"));
                student.push_back(studentJson["gender"].toString());
                student.push_back("");
                student.push_back("");
                student.push_back("");
                student.push_back("");
                student.push_back("");

                students.push_back(student);
            }
            tcpw.tsend(mkjson("keypress", "更新学生列表", "students", students));
        }
    }
}

void MainWindow::changeClass(int currentIndex)
{
    currentIndex = 0;
    //do something
}

void MainWindow::newBatch()
{
    Database.getData("https://height.haizitong.com/api/finishBatchId",
                     "finishBatchId");
    Database.getData("https://height.haizitong.com/api/addBatchId",
                     "addBatchId");
    Database.getData("https://height.haizitong.com/api/getBatchId?schoolId=" +
                     QString::number(Database.schoolid), "getBatchId");
    emit showWorkTable(Database.schoolNameList, Database.gradeListset,
                       Database.classNameTable[0], QString::number(Database.BatchId));
}

int MainWindow::login(QString username, QString password, bool checked)
{
    UserName = username;
    PassWord = password;
    rememberPW = checked;

    QString loginmsg = Database.login("https://height.haizitong.com/api/getToken", username, password);
    if(loginmsg == "OK")
    {
        Database.clear();
        Database.getData("https://height.haizitong.com/api/getSchool", "getSchool");
        Database.getData("https://height.haizitong.com/api/getBatchId?schoolId=" +
                         QString::number(Database.schoolid), "getBatchId");
        if(Database.BatchId == 0)
        {
            Database.getData("https://height.haizitong.com/api/addBatchId", "addBatchId");
        }
        Database.getData("https://height.haizitong.com/api/getClassList?schoolId=" +
                         QString::number(Database.schoolid), "getClassList");

        if (Database.classNameTable.length() > 0) {
            emit showWorkTable(Database.schoolNameList, Database.gradeListset,
                               Database.classNameTable[0], QString::number(Database.BatchId));
        }

        qDebug().noquote() << __FUNCTION__ << "Login OK!";
    }
    else
    {
        qDebug().noquote() << __FUNCTION__ << "Login " << loginmsg;
        return 0;
    }

    tcpw.tsend(mkjson("keypress", "用户登录",
                      "UserName", username,
                      "PassWord", password));
    SaveUserData();

    return 1;
}

void MainWindow::actStart(){
    WT.load(Database.Token, QString::number(Database.schoolid), Database.schooluid, Database.schoolName, UserName);
    qDebug() << "WT开始";
    WT.start();
    qDebug() << "WT结束";
}

QString MainWindow::get_step_str()    { return StepStr;}
QString MainWindow::get_eye_chart()   { return EyeChart;}
QString MainWindow::get_type()        { return Type;}
QString MainWindow::get_number()      { return Number;}
QString MainWindow::image1()          { return eimg;}
QString MainWindow::image3()          { return image3s;}
QString MainWindow::image4()          { return image4s;}
QString MainWindow::image5()          { return image5s;}
QString MainWindow::image6()          { return image6s;}
QString MainWindow::image7()          { return image7s;}
QString MainWindow::image8()          { return image8s;}
QString MainWindow::image9()          { return image9s;}
QString MainWindow::image10()         { return image10s;}
QString MainWindow::eleme1()          { return el01;}
QString MainWindow::eleme0()          { return el02;}
QString MainWindow::eleme2()          { return DirectionName;}
QString MainWindow::testend()         { return tstend;}
QString MainWindow::element9()        { return lr;}
QString MainWindow::addip()           { return serverip;}
QString MainWindow::myip()            { return QString::fromStdString(MyIp);}
QStringList MainWindow::horHeader()   { return Header;}
QStringList MainWindow::get_tblvisionrecord_table_model_horHeader(int fm)
{
    if(fm == 5)
    {
        return tblstudent_table_model_horHeader;
    }
    return tblvisionrecord_table_model_horHeader;
}
//QVariant MainWindow::get_tblvisionrecord_columnWidthArr()          {   return tblvisionrecord_columnWidthArr;}

QJsonArray MainWindow::jsonDatabase()    {return DataJsonArray;}
QString MainWindow::getStudentName()     {return DataJsonArray[CurrentRow].toObject()["k02_studentName"].toString();}
QString MainWindow::getStudentBirthday() {return DataJsonArray[CurrentRow].toObject()["k12_f1"].toString();}
QString MainWindow::getStudentUId()      {return DataJsonArray[CurrentRow].toObject()["k11_studentuid"].toString();}

QString MainWindow::getStudentId()       {return DataJsonArray[CurrentRow].toObject()["k01_studentid"].toString();}
QString MainWindow::getStudentClass()    {return DataJsonArray[CurrentRow].toObject()["k03_grade"].toString() + "年级" +
                                                 DataJsonArray[CurrentRow].toObject()["k04_className"].toString()+"班";}
QString MainWindow::getStudentClass2()   {return DataJsonArray[CurrentRow].toObject()["k04_className"].toString();}
QString MainWindow::getGender()          {return DataJsonArray[CurrentRow].toObject()["k13_f2"].toString();}
QString MainWindow::getStep(int row)     {return DataJsonArray[row].toObject()["k__0068_BQ"].toString();}
QString MainWindow::username()           {return UserName;}
QString MainWindow::password()           {return PassWord;}

bool MainWindow::checked()               {return rememberPW;}
QString MainWindow::textip()             {return TextIP;}

QString MainWindow::rowIsSelected(int tablenumber, int model_row)
{
    if(SelectedRows.size() != 0 && model_row > SelectedRows.size() - 1) model_row = SelectedRows.size() - 1;
    if(tablenumber == 5){
    }
    if(SelectedRows.size() && SelectedRows.size() > model_row)
    {
        return QString::number(SelectedRows[model_row]);
    }
    return "";
}

void  MainWindow::soundArrive(cv::Mat soundsdata)
{
    cv::Mat soundMatRGBA;
    cv::cvtColor(soundsdata, soundMatRGBA, cv::COLOR_GRAY2RGB);
    emit soundImageArrive(Fcv.cvMat2dataimage(soundMatRGBA));
}

void MainWindow::test()
{
    //Done = 0;
    newBatch();
    //queryMessage();
    /*
    start = !start;
    if(start)
    {
        connect(&recorder, &AudioRecorder::soundArrive, this, [this](cv::Mat &soundsdata)
        {
            frame++;
            if(frame > 6)
            {
                soundArrive(soundsdata);
                frame = 0;
            }
        });
        recorder.start();
    }
    else
    {
        recorder.stop();
    }
    */
}

/*"k00_PrimaryKey", "k__0000_A", "k__0001_B", "k__0002_C", "k__0003_D", "k__0004_E", "k__0005_F",
 *  "k__0006_G", "k__0007_H", "k__0008_I", "k__0009_J", "k__0010_K", "k__0011_L", "k__0012_M",
 *  "k__0013_N", "k__0014_O", "k__0015_P", "k__0016_Q", "k__0017_R", "k__0018_S", "k__0019_T",
 *  "k__0020_U", "k__0021_V", "k__0022_W", "k__0023_X", "k__0024_Y", "k__0025_Z", "k__0026_AA",
 *  "k__0027_AB", "k__0028_AC", "k__0029_AD", "k__0030_AE", "k__0031_AF", "k__0032_AG", "k__0033_AH",
 *  "k__0034_AI", "k__0035_AJ", "k__0036_AK", "k__0037_AL", "k__0038_AM", "k__0039_AN", "k__0040_AO",
 *  "k__0041_AP", "k__0042_AQ", "k__0043_AR", "k__0044_AS", "k__0045_AT", "k__0046_AU", "k__0047_AV",
 * "k__0048_AW", "k__0049_AX", "k__0050_AY", "k__0051_AZ", "k__0052_BA", "k__0053_BB", "k__0054_BC",
 * "k__0055_BD", "k__0056_BE", "k__0057_BF", "k__0058_BG", "k__0059_BH", "k__0060_BI", "k__0061_BJ",
 * "k__0062_BK", "k__0063_BL", "k__0064_BM", "k__0065_BN", "k__0066_BO", "k__0067_BP", "k__0068_BQ",
 * "k__0069_BR", "k__0070_BS", "k__0071_BT"
*/
