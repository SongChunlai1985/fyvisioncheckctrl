package com.fyairo.VisionCheckControler;

import android.app.PendingIntent;
import android.content.Intent;
import android.widget.Toast;
import android.os.Handler;
import android.os.Message;
import android.os.Looper;
import android.util.Log;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.location.LocationManager;
import android.location.Criteria;
import android.provider.Settings;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationProvider;
import java.lang.ClassLoader;
import dalvik.system.DexClassLoader;
import java.lang.reflect.Field;
import android.os.Bundle;
import android.os.Environment;
import java.io.File;

import java.util.List;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.net.wifi.WifiManager.WifiLock;
import java.io.IOException;
import java.lang.Exception;
import java.lang.Throwable;
import android.net.DhcpInfo;
import android.content.Context;

import android.util.DisplayMetrics;                                                         //屏幕像素密度
/*
import android.hardware.Camera;
*/
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;

import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattService;

import android.view.inputmethod.InputMethodManager;

import com.hzt.checkmain.activity.physicalExamMachines.PhysicalCheckHelper;
import com.hzt.checkmain.activity.physicalExamMachines.ActPhysicalCheckMain;
import com.hzt.checkmain.activity.bases.BaseActivity;

import com.hzt.checkmain.activity.physicalExamMachines.ActPhysicalMultiCheck;
import com.hzt.checkmain.activity.physicalExamMachines.ActPhysicalObserveCheck;
import com.hzt.checkmain.activity.physicalExamMachines.MainCheckOverViewActivity;
import com.hzt.checkmain.activity.physicalExamMachines.MainCheckOverViewDetails;
import com.hzt.checkmain.activity.physicalExamMachines.machine.PCMachineService;

public class ExtendsQtWithJava extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static ExtendsQtWithJava m_instance;
    public static WifiInfo currentWifiInfo;                                                 //当前所连接的wifi
    public static List<ScanResult> wifiList;                                                // wifi列表
    public static List<WifiConfiguration> wifiConList;                                      // wifi 已成功连接过的配置列表
    public static int wifiIndex;                                                            //从scanResult 得到的wifi列表进行记录位置
    public static  String[] str;
    public static  WifiManager conMan;
    public static DhcpInfo hostDhcpInfo;                                                    //手机连接wifi 后得到的动态ip
                                                                                            //private BluetoothLeService mBluetoothLeService;
    public static Context context;
    public static Intent intent;
                                                                                            //public static Camera mCamera;

    public ExtendsQtWithJava(){
        m_instance = this;
    }

    public static void startActivity(String token,
                                     String schoolid,
                                     String schoolUid,
                                     String schoolName,
                                     String userId){
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                context = m_instance.getApplicationContext();
                PhysicalCheckHelper.instance().init(context);
                PhysicalCheckHelper.setToken(token);
                PhysicalCheckHelper.setSchoolId(Integer.parseInt(schoolid), schoolUid);
                PhysicalCheckHelper.setSchoolName(schoolName);
                PhysicalCheckHelper.setUserId(userId);
                Intent intent = new Intent(context, ActPhysicalCheckMain.class);
                m_instance.startActivity(intent);
            }
        });
    }

    public static String queryMessage(){
        /*
        return "{                                                       "
            +"\"code\": 200,                                            "
            +"\"data\":                                                "
            +    "{                                                     "
            +        "\"className\": \"Zz一班\",                         "
            +        "\"classgrade\": \"小班\",                          "
            +        "\"classid\": 28132,                               "
            +        "\"classuid\": \"5ed9b9a17fe819590600c3e1\",       "
            +        "\"schoolName\": \"牛肉煎包测试幼儿园\",              "
            +        "\"schoolid\": 2456,                               "
            +        "\"schooluid\": \"5ed9b9987fe819590600c3d8\",      "
            +        "\"studentName\": \"小班小二毛\",                    "
            +        "\"studentbirthday\": 1613958854795,               "
            +        "\"studentgender\": \"女\",                        "
            +        "\"studentid\": 3868964,                           "
            +        "\"studentuid\": \"60190f0d8d6e13423ccf8d3a\"      "
            +    "}                                                     "
            +",                                                        "
            +"\"msg\": \"success\"                                      "
        +"}";
        */
        return PhysicalCheckHelper.sendMessage();
    }

public static void returnhzt(){    
    Log.e("ExtendsQtWithJava", "返回");
    new Handler(Looper.getMainLooper()).post(new Runnable() {
        @Override
        public void run() {
            Log.e("ExtendsQtWithJava", "返回孩子通");
            PhysicalCheckHelper.backToPhysicalCheck(m_instance.getApplicationContext());
        }
    });
}

    public static void openCamera(){
        //mCamera=Camera.open(0);
        /*
        String mDeviceAddress;
        mBluetoothLeService.connect(mDeviceAddress);
        String msg = "1";
        byte[] WriteBytes = hex2byte(msg.getBytes());

        ArrayList<ArrayList<BluetoothGattCharacteristic>> mGattCharacteristics =
                    new ArrayList<ArrayList<BluetoothGattCharacteristic>>();
        int groupPosition = 0;
        int childPosition = 0;
        BluetoothGattCharacteristic characteristic =
                mGattCharacteristics.get(groupPosition).get(childPosition);
        characteristic.setValue(WriteBytes);
        mBluetoothLeService.writeCharacteristic(characteristic);
        */
    }

    public void showKeyboard(int isShow) {
         InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
         if (null == imm) return;

         if (isShow == 1) {
             if (getCurrentFocus() != null) {
                 imm.showSoftInput(getCurrentFocus(), 0);                                   //有焦点打开
             } else {
                 imm.toggleSoftInput(InputMethodManager.SHOW_FORCED, 0);                    //无焦点打开
             }
         } else {
             if (getCurrentFocus() != null) {
                 imm.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);             //有焦点关闭
             } else {
                 imm.toggleSoftInput(InputMethodManager.HIDE_IMPLICIT_ONLY, 0);             //无焦点关闭
             }
         }
     }

                                                                                            //实例化单例对象

    public static void openWifi(){
        conMan = (WifiManager) m_instance.getSystemService(Context.WIFI_SERVICE);
        if(!conMan.isWifiEnabled()){
            conMan.setWifiEnabled(true);
        }
    }

    public static void closeWifi(){
        conMan = (WifiManager) m_instance.getSystemService(Context.WIFI_SERVICE);
        if(conMan.isWifiEnabled()){
            conMan.setWifiEnabled(false);
        }
    }

    public static void scanWifi(){
        conMan.startScan();
    }

    public static int getWifiCount(){                                                       //get wifi info
        wifiList = conMan.getScanResults();
        return wifiList.size();
    }
    public static String getWifiSSID(int index){
        if(index>=0&&index<wifiList.size()){
            return wifiList.get(index).SSID;
        }
        else{
            return "";
        }
    }

    public static int getWifiLevel(int index){
        if(index>=0&&index<wifiList.size()){
            return wifiList.get(index).level;
        }
        else{
            return 0;
        }
    }

    public static int getWifiFrequency(int index){
        if(index>=0&&index<wifiList.size()){
            return wifiList.get(index).frequency;
        }
        else{
            return 0;
        }
    }

    public static String getWifiBSSID(int index){
        if(index>=0&&index<wifiList.size()){
            return wifiList.get(index).BSSID;
        }
        else{
            return "";
        }
    }

    public static String getWifiKeyType(int index){                                         //加密方式判断
        if (wifiList.get(index).capabilities.contains("WEP")) {
            return "WEP";
        } else if (wifiList.get(index).capabilities.contains("PSK")) {
            return "PSK";
        } else if (wifiList.get(index).capabilities.contains("EAP")) {
            return "EAP";
        }
        return "无";
    }

    public static String getCurrentWifiSSID(){                                              //get current connected wifi info
        currentWifiInfo = conMan.getConnectionInfo();
        return currentWifiInfo.getSSID();
    }

    //get current ip address
    public static String getCurrentWifiIPAddress(){
        currentWifiInfo = conMan.getConnectionInfo();
        return "";        // WifiUtil.intToIp(currentWifiInfo.getIpAddress());
    }

    public static String getHostIPAddress(){                                                //路由派来的IP
        hostDhcpInfo = conMan.getDhcpInfo();
        return "";//WifiUtil.intToIp(hostDhcpInfo.serverAddress);
    }

    public static int getCurrentNetworkId(){                                                //get current network id
        currentWifiInfo = conMan.getConnectionInfo();
        return currentWifiInfo.getNetworkId();
    }

    public static int networkState(){                                                       //get wifi connect state
        return conMan.isWifiEnabled()? 1 : 0;
    }

    public static void connectDevice(String ssid,String passwd){                            //连接到新设备
//        WifiConfiguration wc = new WifiConfiguration();
//        wc.SSID = "\""+ssid+"\"";
//        wc.preSharedKey = "\""+passwd+"\"";

//        wc.hiddenSSID = true;
//        wc.status = WifiConfiguration.Status.ENABLED;
//        wc.allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN);
//        wc.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.TKIP);
//        wc.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.CCMP);
//        wc.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK);
//        wc.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.TKIP);
//        wc.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.CCMP);
//        wc.allowedProtocols.set(WifiConfiguration.Protocol.WPA);
    }



    public WifiConfiguration CreateWifiInfo(ScanResult scanresult,String Password)          //生成一个网络配置
    {
       WifiConfiguration wc = new WifiConfiguration();
       wc.SSID = "\""+scanresult.SSID+"\"";                                                 //<span style="color: rgb(255, 0, 0); ">这个地方一定要注意了。旁边的“是不能够省略的。密码的地方也一样。</span>
       wc.preSharedKey = "\""+Password+"\"";                                                //该热点的密码
       wc.hiddenSSID = true;
       wc.status = WifiConfiguration.Status.ENABLED;
       wc.allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN);
       wc.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.TKIP);
       wc.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.CCMP);
       wc.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK);
       wc.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.TKIP);
       wc.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.CCMP);
       wc.allowedProtocols.set(WifiConfiguration.Protocol.WPA);
       return wc;
    }

    public WifiConfiguration CreateWifiInfoWithoutPasswd(ScanResult scanresult)             //无密码
    {
        WifiConfiguration wc = new WifiConfiguration();
        wc.SSID = "\""+scanresult.SSID+"\"";                                                //<span style="color: rgb(255, 0, 0); ">这个地方一定要注意了。旁边的“是不能够省略的。密码的地方也一样。</span>
                   //        wc.preSharedKey = "\""+Password+"\"";                          //该热点的密码
        wc.hiddenSSID = true;
        wc.status = WifiConfiguration.Status.ENABLED;
        wc.allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN);
        wc.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.TKIP);
        wc.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.CCMP);
        wc.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK);
        wc.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.TKIP);
        wc.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.CCMP);
        wc.allowedProtocols.set(WifiConfiguration.Protocol.WPA);
        return wc;
     }

    public static int connectToWifi(int scanresultId,String Password){                      //根据网络配置连接wifi
        int networkId = conMan.addNetwork(m_instance.CreateWifiInfo(wifiList.get(scanresultId),Password));
        if(networkId != -1){
            conMan.enableNetwork(networkId, false);
            conMan.saveConfiguration();
            return 1;//success
        }
        return 0;//falure
    }

    public static int connectToWifiWithoutPasswd(int scanresultId){                         //无密码
        int networkId = conMan.addNetwork(m_instance.CreateWifiInfoWithoutPasswd(wifiList.get(scanresultId)));
        if(networkId != -1){
            conMan.enableNetwork(networkId, false);
            conMan.saveConfiguration();
            return 1;//success
        }
        return 0;//falure
    }

    public static double getDentisy(){                                                      //获取屏幕像素密度
        DisplayMetrics metrics=new DisplayMetrics();
        m_instance.getWindowManager().getDefaultDisplay().getMetrics(metrics);
        return metrics.density;
    }

    public static void getwifi(String sid,String Password){
          conMan = (WifiManager) m_instance.getSystemService(Context.WIFI_SERVICE);
          WifiConfiguration config = new WifiConfiguration();
          config.allowedAuthAlgorithms.clear();
          config.allowedGroupCiphers.clear();
          config.allowedKeyManagement.clear();
          config.allowedPairwiseCiphers.clear();
          config.allowedProtocols.clear();                                                  // 指定对应的SSID

          config.SSID = "\"" + sid + "\"";

          config.preSharedKey = "\"" + Password + "\"";
          config.hiddenSSID = true;
          config.allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN);
          config.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.TKIP);
          config.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK);
          config.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.TKIP);
          config.allowedGroupCiphers.set(WifiConfiguration.GroupCipher.CCMP);
          config.allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.CCMP);
          config.status = WifiConfiguration.Status.ENABLED;

          int netId = conMan.addNetwork(config);
          Log.e("TAG", netId + "   ");
                                                                                            // 这个方法的第一个参数是需要连接wifi网络的networkId，第二个参数是指连接当前wifi网络是否需要断开其他网络
                                                                                            // 无论是否连接上，都返回true。。。。
          conMan.enableNetwork(netId, true);
    }

    public static  String intToIp(int paramInt) {
        return (paramInt & 0xFF) + "." + (0xFF & paramInt >> 8) + "." + (0xFF & paramInt >> 16) + "."
                        + (0xFF & paramInt >> 24);
    }

    public static String getwifiip() {
                                                                                            //conMan.getDhcpInfo().ipAddress;
                                                                                            //conMan.getConnectionInfo().getIpAddress()
        return intToIp(conMan.getDhcpInfo().gateway);
    }
}
