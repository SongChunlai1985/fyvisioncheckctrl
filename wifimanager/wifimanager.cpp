#include <QDebug>

#include <math.h>

#include "wifimanager.h"
#include "jni.h"

WifiManager::WifiManager(){
}

WifiManager::~WifiManager(){
}

void WifiManager::refreshWifiList(){   //user functionds
    wifiList.clear();
    scanWifi();
    int count = getWifiListCount();
    for(int a = 0; a < count; a++){
        WifiInfo info;
        info.SSID = getWifiSSID(a);
        info.BSSID = getWifiBSSID(a);
        info.level = getWifiLevel(a);
        info.keytype = getKeyType(a);
        wifiList.append(info);
    }
}

int  WifiManager::wifiCount(){
    return wifiList.count();
}

int  WifiManager::wifiLevel(int i){
    return wifiList.at(i).level;
}

QString WifiManager::wifiSSID(int i){
    return wifiList.at(i).SSID;
}

QString WifiManager::wifiBSSID(int i){
    return wifiList.at(i).BSSID;
}

QString WifiManager::wifiKeyType(int i){
    return wifiList.at(i).keytype;
}

bool WifiManager::isWifiEnable(){         //wifi cability
    jint state = QAndroidJniObject::callStaticMethod<jint>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "networkState");
    return state == 1 ? true : false;
}

void WifiManager::openWifi(){
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "openWifi");
}

void WifiManager::closeWifi(){
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "closeWifi");
}

void WifiManager::scanWifi(){
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "scanWifi");
}

void WifiManager::getwifi(QString id, QString passwd){
    QAndroidJniObject sid = QAndroidJniObject::fromString(id);
    QAndroidJniObject str = QAndroidJniObject::fromString(passwd);
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "getwifi",
                                              "(Ljava/lang/String;Ljava/lang/String;)V", sid.object<jstring>(), str.object<jstring>());
}

void WifiManager::startActivity(QString token, QString schoolId, QString schoolUid, QString schoolName, QString userId){
    QAndroidJniObject token_      = QAndroidJniObject::fromString(token);
    QAndroidJniObject schoolId_   = QAndroidJniObject::fromString(schoolId);
    QAndroidJniObject schoolUid_  = QAndroidJniObject::fromString(schoolUid);
    QAndroidJniObject schoolName_ = QAndroidJniObject::fromString(schoolName);
    QAndroidJniObject userId_     = QAndroidJniObject::fromString(userId);
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "startActivity",
                                              "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
                                              token_.object<jstring>(),
                                              schoolId_.object<jstring>(),
                                              schoolUid_.object<jstring>(),
                                              schoolName_.object<jstring>(),
                                              userId_.object<jstring>()
                                              );
}

QString WifiManager::queryMessage(){
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "queryMessage",
                                                                    "()Ljava/lang/String;");
    return str.toString();
}

void WifiManager::returnhzt(){
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "returnhzt");
}

int WifiManager::getWifiListCount(){
    jint count = QAndroidJniObject::callStaticMethod<jint>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "getWifiCount");
    return count;
}

void WifiManager::opencamera()
{
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "openCamera");
}

QString WifiManager::getWifiSSID(int index)
{
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "getWifiSSID",
                                                                    "(I)Ljava/lang/String;", index);
    return str.toString();
}

QString WifiManager::getWifiBSSID(int index){
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "getWifiBSSID",
                                                                    "(I)Ljava/lang/String;", index);
    return str.toString();
}

QString WifiManager::getwifiip(){
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "getwifiip",
                                                                    "()Ljava/lang/String;");
    return str.toString();
}

int WifiManager::getWifiLevel(int index){
    int a = QAndroidJniObject::callStaticMethod<int>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "getWifiLevel", "(I)I", index);
    qDebug() << "wifi level: " << a;
    if(abs(a) > 80){
        return 1;
    }
    else if(abs(a) > 50 && abs(a) <= 80){
        return 2;
    }
    else if(abs(a) <= 50){
        return 3;
    }
    return 3;
}

QString WifiManager::getKeyType(int index){
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "getWifiKeyType",
                                                                    "(I)Ljava/lang/String;", index);
    return str.toString();
}

QString WifiManager::getConntectedWifiSSID(){        //获取当前连接的wifi信息
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "getCurrentWifiSSID",
                                                                    "()Ljava/lang/String;");
    return str.toString();

}

QString WifiManager::getConnectedWifiAddress(){
    QAndroidJniObject str = QAndroidJniObject::callStaticObjectMethod("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                                    "getHostIPAddress",
                                                                    "()Ljava/lang/String;");
    return str.toString();

}

void WifiManager::connectToWifi(int id, QString passwd){    //连接到wifi
    QAndroidJniObject str = QAndroidJniObject::fromString(passwd);
    jint a = QAndroidJniObject::callStaticMethod<jint>("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                     "connectToWifi",
                                                     "(ILjava/lang/String;)I", id, str.object<jstring>());
    qDebug() << "connect to wifi :" << a;
}

void WifiManager::connectToWifiWithoutPasswd(int id){
    jint a = QAndroidJniObject::callStaticMethod<jint>("com/fyairo/VisionCheckControler/ExtendsQtWithJava",
                                                     "connectToWifiWithoutPasswd",
                                                     "(I)I", id);
    qDebug() << "connect to wifi :" << a;
}

void WifiManager::ShowSoftKeyboard(int isShow)
{
    JniObject.callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "showKeyboard", "(I)V", isShow);
}

int WifiManager::getMaxVolumnStream(){  //多媒体音量控制
    return QAndroidJniObject::callStaticMethod<int>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "getMaxVolumnStream", "()I");
}

int WifiManager::getCurrentVolumnStream(){
    return QAndroidJniObject::callStaticMethod<int>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "getCurrentVolumnStream", "()I");
}

void WifiManager::setVolumnStream(int a){
    QAndroidJniObject::callStaticMethod<void>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "setVolumnStream", "(I)V", a);
}

double WifiManager::getDentisy(){   //获取屏幕像素密度
    return QAndroidJniObject::callStaticMethod<double>("com/fyairo/VisionCheckControler/ExtendsQtWithJava", "getDentisy", "()D");
}
