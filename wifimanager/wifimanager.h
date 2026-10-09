#ifndef WIFIMANAGER_H
#define WIFIMANAGER_H

#include <QObject>
#include <QtAndroidExtras/QAndroidJniObject>
#include <QList>
#include <QString>

struct WifiInfo{
    int level;
    QString SSID;
    QString BSSID;
    QString keytype;
};

class WifiManager{

public:
      WifiManager();
     ~WifiManager();

     QAndroidJniObject JniObject;

     //wifi process
     void ShowSoftKeyboard(int isShow = 1);
     bool isWifiEnable();
     void openWifi();
     void closeWifi();
     void scanWifi();
     void getwifi(QString id, QString passwd);
     void startActivity(QString token, QString schoolId, QString schoolUid, QString schoolName, QString userId);
     int getWifiListCount();

     void opencamera();

     QString getWifiSSID(int index);
     QString getWifiBSSID(int index);
     QString getwifiip();
     int getWifiLevel(int index);
     QString getKeyType(int index);

     //获取当前连接的wifi信息
     QString getConntectedWifiSSID();
     QString getConnectedWifiAddress();

     //连接到wifi
     void connectToWifi(int id, QString passwd);
     void connectToWifiWithoutPasswd(int id);

     //多媒体音量控制
     int getMaxVolumnStream();
     int getCurrentVolumnStream();
     void setVolumnStream(int a);

     //获取屏幕像素密度
     double getDentisy();

     //user process
     void refreshWifiList();

     int  wifiCount();
     int  wifiLevel(int i);
     QString wifiSSID(int i);
     QString wifiBSSID(int i);
     QString wifiKeyType(int i);

     QString queryMessage();
     void returnhzt();
signals:

public slots:

private:
    QList<WifiInfo> wifiList;
    QString jpath_="";
};

#endif // WIFIMANAGER_H
