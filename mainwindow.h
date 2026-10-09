#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QTimer>
#include <QDebug>
#include <QThread>

#include <fjson/fjson.h>
#include <base64/base64.h>
#include <fcv/fcv.h>
#include <network/udpwork.h>
#include <network/tcpwork.h>
#include <bluetooth/bluedevice.h>

#include <unistd.h>
#include <workthread.h>

#include "csvfile.h"
#include "msxlsx/msxlsx.h"
#include "audiorecorder/audiorecorder.h"
#include "database.h"

class MainWindow: public QObject{
    Q_OBJECT

signals:
    void sigarv();
    void databaseready_TodayPlan();
    void databaseready_StudentInfo();
    void databaseready_CheckRecord();
    void tcpConnected();
    void tcpDisConnected();
    void softInfoArrive(QString tvInfo, QString padInfo);
    void buttonChecked(bool p11, bool p21, bool p31, bool p41);
    void checkReady();
    void soundImageArrive(QString soundImage);
    void showWorkTable(QStringList schoolNameList, QStringList gradeListset, QStringList gradeClass, QString batchId);
    void quickSelectrow(int row);
    void tofm07();

public:
    explicit MainWindow();

    double vs[15][5];
    int w=400, h=400, n=0, np=0, Right=0, wrong=0, lv=1;
    double Esize=10.0, dis=5000, dpmm=2.7500000;
    //ushort UdpServerFd,UdpPort;

    QTimer *timer;
    std::string MyIp;
    QString serverip;
    QString eimg;
    QString edir;
    QString image3s;
    QString image4s;
    QString image5s;
    QString image6s;
    QString image7s;
    QString image8s;
    QString image9s;
    QString image10s;
    QString tstend;
    QString el02;
    QString el01;
    QString lr;
    QString mxs;
    QString mrs;
    QString mns;
    QString devname;
    QString EyeChart;
    QString Type;
    QString StepStr;
    QString STEP;
    QString Number;
    QString DirectionName;

    // u_short tcpport=10588;
    u_short tcpport=1032;
    udpwork udpw;
    tcpwork tcpw;

    fcv Fcv;
    csvfile Csv;
    msxlsx xlsx;

    WorkThread WT;
    QTimer *timer1;
    int Done = 1;

    QByteArray NextMsg;
    QJsonObject DataJson;
    QJsonArray DataJsonArray;
    QByteArray DataArray;
    QStringList Header;
    QByteArray SearchJosn;

    QVariant tblvisionrecord_columnWidthArr;
    QStringList tblvisionrecord_table_model_horHeader;
    QStringList tblstudent_table_model_horHeader;

    int CurrentRow;
    int totalsymbol = 4;
    QString view = "单显";
    QString programMode = "快速模式";
    QString distance = "5米";
    QString leftLevel = "4.0";
    QString rightLevel = "4.0";

    QVector<int> SelectedRows;
    QString UserName;
    QString TextIP;
    QString PassWord;
    QString ImportForm;

    QString rootPath = "/storage/self/primary/FYAIRO/VisionCheck";                                 //软链接"/sdcard/FYAIRO/VisionCheck"
    QString dataPath = "/userdata";
    QByteArray UserData;

    int dataFromhzt = 0;

    void drawE();
    void SetLight(int dg3=2, int dg4=2, int dg5=2, int dg6=2, int dg7=2,
                  int dg8=2, int dg9=2, int dg10=2);

    void TcpConnected();
    void TcpDisConnected();
    void TcpMsgReady();
    void UdpMsgReady();

    Q_INVOKABLE void dbg(QString msg);
    Q_INVOKABLE void init();
    Q_INVOKABLE void setuip(QString IP);

    bool Ready = false;
    Q_INVOKABLE void cstart();
    Q_INVOKABLE void on_pushButton_clicked();
    Q_INVOKABLE void on_pushButton_5_clicked();
    Q_INVOKABLE void sendCheckStudent();
    Q_INVOKABLE void on_pushButton_9_clicked();
    Q_INVOKABLE void on_pushButton_6_clicked();
    Q_INVOKABLE void continu();
    Q_INVOKABLE void setRow(int row);
    Q_INVOKABLE int login(QString username, QString password, bool checked);
    Q_INVOKABLE void setStep(QString Step);
    Q_INVOKABLE void importcsv(QString filename, QString importForm);
    Q_INVOKABLE void exportcsv(QString filename, QString importForm);
    Q_INVOKABLE void fm06_ab1_onClicked(QString k02_Name = "",
                                        QString k11_Class = "",
                                        QString k07_SchoolName = "",
                                        QString k18_CheckTime_a = "",
                                        QString k18_CheckTime_b = "",
                                        QString k10_Grade = "",
                                        QString k01_StudentID = "",
                                        QString k16_Step = ""
            );
    Q_INVOKABLE void fm05_ab1_onClicked();
    Q_INVOKABLE void fm07_getTable();

    Q_INVOKABLE QString get_step_str();
    Q_INVOKABLE QString get_eye_chart();
    Q_INVOKABLE QString get_type();
    Q_INVOKABLE QString get_number();
    Q_INVOKABLE QString image1();
    Q_INVOKABLE QString image3();
    Q_INVOKABLE QString image4();
    Q_INVOKABLE QString image5();
    Q_INVOKABLE QString image6();
    Q_INVOKABLE QString image7();
    Q_INVOKABLE QString image8();
    Q_INVOKABLE QString image9();
    Q_INVOKABLE QString image10();
    Q_INVOKABLE QString eleme1();
    Q_INVOKABLE QString eleme0();
    Q_INVOKABLE QString eleme2();
    Q_INVOKABLE QString element9();
    Q_INVOKABLE QString testend();
    Q_INVOKABLE QString addip();
    Q_INVOKABLE QString myip();
    Q_INVOKABLE QJsonArray jsonDatabase();
    Q_INVOKABLE QStringList horHeader();
    Q_INVOKABLE QString getStudentName();
    Q_INVOKABLE QString getGender();
    Q_INVOKABLE QString getStudentBirthday();                                                      //Q_INVOKABLE函数的首字母要小写
    QString getStudentUId();
    QString getStudentId();
    Q_INVOKABLE QString getStudentClass();
    QString getStudentClass2();

    //Q_INVOKABLE QVariant get_tblvisionrecord_columnWidthArr();
    Q_INVOKABLE QStringList get_tblvisionrecord_table_model_horHeader(int fm = 6);
    Q_INVOKABLE QString getStep(int row);
    Q_INVOKABLE QString rowIsSelected(int tablenumber, int model_row);
    Q_INVOKABLE void selectedRow(int row);
    Q_INVOKABLE void selectedAll();
    Q_INVOKABLE QString setIp(QString ScanMessage);
    Q_INVOKABLE QString username();
    Q_INVOKABLE QString password();
    Q_INVOKABLE bool checked();

    Q_INVOKABLE QString textip();

    void SaveUserData();
    Q_INVOKABLE void setSymbol(QString modeName);
    Q_INVOKABLE void sendCheckMode();

    AudioRecorder recorder;
    bool start = false;
    int frame = 0;
    Q_INVOKABLE void test();
    void soundArrive(cv::Mat soundsdata);

    database Database;
    Q_INVOKABLE QString downloaddata();
    Q_INVOKABLE void changeGrade(int currentIndex);
    Q_INVOKABLE void changeClass(int currentIndex);
    Q_INVOKABLE void initWork(QString currentText2, QString currentText3);

    QJsonObject currentClass;
    QJsonArray tmpclassList;
    QJsonArray tmpstudentTable;
    Q_INVOKABLE void creatTempdata();
    Q_INVOKABLE void actStart();

    BlueDevice ble;

    void ValueArrive(QByteArray value);
    void queryMessage();

    Q_INVOKABLE void returnhzt();
    QJsonObject data0;
    void queryMessage2();

    bool rememberPW = false;
    void returnhzt2();
    Q_INVOKABLE void newBatch();
};

#endif // MAINWINDOW_H
