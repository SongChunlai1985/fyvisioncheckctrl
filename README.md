VisionCheck 视力检查系统
基于 Qt/QML 的 Android 学生视力筛查系统，由 TV 端（大屏显示视力表）和 Pad 端（手持控制器）组成。两端通过局域网 TCP/UDP 通信，配合蓝牙眼镜完成遮眼控制、视标显示、左右眼检查、结果存储与云端上传。

系统包含两个 Qt 工程：

fyvisioncheck.pro → VisionCheckTV（TV 端）

fyvisioncheckctrl.pro → VisionCheck（Pad 端）

系统组成
TV 端 VisionCheckTV
运行在 Android TV / 大屏设备上，负责：

显示视力表视标

接收 Pad 控制指令

控制蓝牙眼镜左右眼遮眼

生成二维码供 Pad 扫描连接

本地 SQLite 存储检查记录

HTTP 服务查询记录

上传数据到云端

Pad 端 VisionCheck
运行在 Android 平板/手机上，负责：

登录、选择学校/年级/班级

查询当日检查计划、学生信息

控制 TV 端检查流程

显示检查状态、结果、视力灯

二维码扫描连接 TV

导入/导出 Excel/CSV

上传视力数据到健康平台

功能特性
左右眼分别检查

支持 5 米 / 4 米检查距离

支持 4 方向 E 字视标

支持 7 种儿童图形视标：苹果、花朵、鸭子、雨伞、杯子、鱼、剪刀

单显 / 排显模式

快速模式 / 标准模式

自动判定正确/错误，逐行升降级

输出五分记录、小数记录、结束行

蓝牙眼镜控制右眼、左眼、双眼

SQLite 本地数据库

Excel / CSV 导入导出

FySVC / 健康平台登录与数据上传

二维码扫描连接

HTTP 记录查询页面

技术栈
Qt 5.12.3

C++11

QML / Qt Quick / Quick Controls 2

Android armeabi-v7a

Android NDK r14b

OpenCV 4.1.0 Android SDK（TV 端）

ZBar（Pad 端二维码扫描）

SQLite

Qt Network / Bluetooth / SQL / Multimedia / AndroidExtras / Widgets

项目结构
text
.
├── fyvisioncheck.pro          # TV 端工程
├── fyvisioncheckctrl.pro      # Pad 端工程
├── main.cpp                   # 程序入口
├── mainwindow.cpp / .h        # 主控制逻辑
├── mainwindow.ui              # 传统 Widget UI
├── checkprocess.cpp / .h      # TV 端视力检查状态机
├── mydatabase.cpp / .h        # TV 端 SQLite 封装
├── database.cpp / .h          # Pad 端网络 API 封装
├── workthread.cpp / .h        # Pad 端后台线程，启动 Android Activity
├── wifimanager/               # Wi-Fi / JNI 管理
├── qml/                       # QML 界面与资源
│   ├── Mfm.qml                # Pad 端主窗口
│   ├── MfmForm.ui.qml         # 登录页
│   ├── Form00.ui.qml          # 首页 / 学校班级选择
│   ├── Form01.ui.qml          # 功能菜单
│   ├── Form02.ui.qml          # 系统信息
│   ├── Form03.ui.qml          # 连接电子视力表
│   ├── Form04.ui.qml          # 手动输入 IP
│   ├── Form05.ui.qml          # 当日检查计划
│   ├── Form06.ui.qml          # 学生信息检索
│   ├── Form07.ui.qml          # 检查界面
│   ├── Form08.ui.qml          # 二维码扫描
│   ├── BasicComboBox2.qml     # 自定义下拉框
│   ├── BigButton.qml          # 自定义大按钮
│   ├── TableWidget.qml        # 自定义表格
│   └── img/
└── android/                   # Android 工程配置
依赖库位于 $$ANDROID_ROOT/libfy 下，包括：

base

base64

sqlite

fcv

fjson

network

bluetooth

msxlsx

csvfile

camerafilter

audiorecorder

核心模块
TV 端：CheckProcess
CheckProcess 是视力检查流程的核心控制类，内部包含：

Test：管理多张视力表

Chart：管理左右眼视力表

VisionChart：管理某个眼睛的视力表行

VisionLevel：管理某一行视标

Question：管理单个视标问题

主要接口：

cpp
QString CheckStart(QString leftLevel, QString rightLevel, int totalsymbol);
QString ChooseChart(ChartDistanceType &chartType);
QString Right();
QString Wrong();
QList<int> GetLight();
QList<Question> ShowQuestion(int &CurrentQuestion);
void GetTestReport(...);
视标尺寸计算公式：

cpp
SymbolWidth = 5 * ChartDistance * VisualAngle * 2.90888e-4;
其中 dpmm 为设备真实分辨率：

cpp
double dpmm = 2.7572121521577263;
TV 端：MainWindow
MainWindow 负责：

网络初始化

TCP / UDP / HTTP 服务

平板控制指令解析

QML 数据刷新

蓝牙眼镜控制

数据库读写

云平台上传

二维码生成

主要端口：

类型	端口
TCP 控制端口	1032
HTTP 服务端口	8080
UDP 配对/调试端口	1031
TV 端：MyDatabase
MyDatabase 封装 SQLite 数据库访问，主要数据库：

users.db

tbluser

tblstudentmaster

student.db

tblstudent

tblvisionrecord

tblvisionrecord 用于存储体检记录，包括学生信息、左右眼视力、完成状态、检测时间、导入时间、SHA256、SN 等字段。

Pad 端：MainWindow
MainWindow 负责：

UDP 广播发现 TV

TCP 连接 TV 并发送控制指令

接收 TV 返回的检查数据

登录健康平台

获取学校、年级、班级、学生列表

新建批次、完成批次

导入/导出 Excel/CSV

二维码扫描结果处理

启动 Android 物理检查 Activity

主要方法：

cpp
void init();
void setuip(QString IP);
void on_pushButton_clicked();   // 发送 W（正确）
void on_pushButton_5_clicked(); // 发送 S（错误）
void on_pushButton_9_clicked(); // 发送 Q（5 米）
void on_pushButton_6_clicked(); // 发送 E（4 米）
void cstart();                  // 发送 F（开始）
void continu();                 // 发送 continue
void sendCheckStudent();
void sendCheckMode();
Pad 端：Database
database 封装与 https://height.haizitong.com 的 HTTP 交互：

登录：/api/getToken

获取学校：/api/getSchool

获取批次：/api/getBatchId?schoolId=

新建批次：/api/addBatchId

完成批次：/api/finishBatchId

获取班级：/api/getClassList?schoolId=

获取学生：/api/getStudentList?classId=

上传视力：/api/addVisionData

Pad 端：WorkThread
WorkThread 在后台线程中通过 JNI 启动 Android 原生 Activity：

cpp
JNIModel.startActivity(Database_Token,
                       Database_id,
                       Database_uid,
                       schoolName,
                       UserName);
通信协议
UDP 广播发现
TV 端定期发送 UDP 广播：

text
__FYVISIONCHECK__PAIRING__BROADCAST__
Pad 端监听 UDP 端口 1031，收到广播后记录 TV IP，并建立 TCP 连接。

TCP 控制指令
Pad 端作为 TCP 客户端连接 TV 的 1032 端口，发送 JSON 指令。核心字段为 keypress。

常用按键：

keypress	含义
W	正确
S	错误
Q	切换到 5 米视力表
E	切换到 4 米视力表
F	开始 / 重新显示当前问题
continue	继续检查
检查方式	设置视标类型、显示模式、检查模式、距离、起始级别
学生信息检索	查询学生信息
查询学生检查记录	查询检查记录
查询当日检查计划	查询当日计划
用户登录	登录 FySVC
更新学生列表	批量更新学生列表
导入检测记录	导入 Excel/CSV 记录
设置当前行	设置数据库当前行
更改完成状态	修改检查完成状态
示例：

json
{
  "keypress": "检查方式",
  "totalsymbol": 4,
  "view": "单显",
  "programMode": "快速模式",
  "distance": "5米",
  "leftLevel": "4.8",
  "rightLevel": "4.8"
}
TV 返回数据
TV 端通过 TCP 返回 JSON，keypress 为 M 时表示测量数据：

json
{
  "keypress": "M",
  "currentdirection": "0",
  "light03": "2",
  "light04": "2",
  "light05": "2",
  "light06": "2",
  "light07": "2",
  "light08": "2",
  "light09": "2",
  "light10": "2",
  "testend": "0",
  "testresultl": "5.0/1.0",
  "testresultr": "5.0/1.0",
  "swch": "0",
  "FiveMarkRecord": "5.0",
  "DecimalRecord": "1.0",
  "Type": "不移动",
  "StepStr": "检查右眼中",
  "EyeChart": "右眼",
  "Number": "0",
  "DirectionName": "左"
}
数据存储与云 API
本地文件
Pad 端保存用户配置：

text
/storage/self/primary/FYAIRO/VisionCheck/userdata/userdata.csv
内容包括：

用户名

上次连接 IP

totalsymbol

view

programMode

distance

是否记住密码

Base64 加密密码

云平台接口
健康平台基础地址：

text
https://height.haizitong.com
主要接口：

接口	说明
/api/getToken	登录获取 Token
/api/getSchool	获取学校信息
/api/getBatchId?schoolId=	获取当前批次
/api/addBatchId	新建批次
/api/finishBatchId	完成批次
/api/getClassList?schoolId=	获取班级列表
/api/getStudentList?classId=	获取学生列表
/api/addVisionData	上传视力检查数据
数据库表
TV 端 tblvisionrecord 字段较多，主要包含：

学生基本信息

左眼/右眼裸眼视力

检查医师

完成状态

计划检测时间

检测时间

导入时间

学校/班级/学生 ID 与 UID

SHA256、SN

预留字段

构建环境
必要环境
Qt 5.12.3，包含以下模块：

core

gui

network

quick

sql

bluetooth

quickcontrols2

androidextras

multimedia

widgets

Android SDK

Android NDK r14b

Android OpenSSL

OpenCV Android SDK 4.1.0（TV 端）

ZBar（Pad 端）

libqrencode

libexpat

libmediandk

环境路径
工程中默认路径：

qmake
ANDROID_ROOT = /home/song/android
请根据实际环境修改 .pro 文件中的路径，包括：

qmake
ANDROID_ROOT
ANDROID_OPENCV
ANDROID_EXTRA_LIBS
INCLUDEPATH
LIBS
编译与运行
使用 Qt Creator 打开 fyvisioncheck.pro 或 fyvisioncheckctrl.pro

选择 Android armeabi-v7a 构建套件

确认 Android NDK、SDK、OpenSSL 路径正确

修改 ANDROID_ROOT 等硬编码路径

执行 qmake

构建并部署到 Android 设备

TV 端目标名：

text
TARGET = VisionCheckTV
Pad 端目标名：

text
TARGET = VisionCheck
Android 版本信息：

qmake
# TV 端
ANDROID_VERSION_CODE = "21"
ANDROID_VERSION_NAME = "FY-SVC-TV-010.20210408"

# Pad 端
ANDROID_VERSION_CODE = "21"
ANDROID_VERSION_NAME = "FY-SVC-PD-010.20210415"
使用流程
启动 TV 端应用，自动获取 IP 并显示二维码

启动 Pad 端应用，登录健康平台账号

Pad 端选择学校、年级、班级，新建或选择批次

Pad 端通过 UDP 广播发现 TV，或扫描 TV 二维码连接

Pad 端选择学生，设置检查方式：

视标类型：正常视标 / 儿童视标

显示模式：单显 / 排显

检查模式：快速模式 / 标准模式

检查距离：5 米 / 4 米

开始检查

TV 显示视标

Pad 按“正确”或“错误”

蓝牙眼镜控制左右眼遮眼

右眼检查完成后提示换左眼

左眼检查完成后生成结果

结果保存到本地数据库，并上传到健康平台

Pad 端可查看当日检查计划、学生信息、历史记录，支持导入导出

配置说明
检查流程
checkprocess.h 中通过宏控制成人/儿童流程：

cpp
//#define defaultcheck
未定义 defaultcheck：儿童流程，默认截止到第 21 行

定义 defaultcheck：成人流程，默认截止到第 24 行

检查模式
Pad 端 setSymbol 中设置：

cpp
if(modeName == "正常视标") totalsymbol = 4;
if(modeName == "儿童视标") totalsymbol = 7;
if(modeName == "单显") view = "单显";
if(modeName == "排显") view = "排显";
if(modeName == "快速模式") {
    leftLevel = "4.8";
    rightLevel = "4.8";
    programMode = "快速模式";
}
if(modeName == "标准模式") {
    leftLevel = "4.0";
    rightLevel = "4.0";
    programMode = "标准模式";
}
端口配置
类型	端口
TCP 控制端口	1032
UDP 配对端口	1031
HTTP 服务端口（TV）	8080
如果路由器屏蔽端口，可能需要修改。

云平台地址
代码中存在云平台地址，例如：

cpp
https://height.haizitong.com/api/getToken
https://height.haizitong.com/api/getSchool
https://height.haizitong.com/api/addVisionData
http://113.31.119.15:5000/api/persons
https://iot.fyairo.com/FySVC/api/login
http://106.75.253.237/FySVC/api/senddata
实际部署时请根据环境替换。

注意事项
.pro 文件中存在较多硬编码路径，迁移环境时需修改。

Android 权限需要包含网络、蓝牙、存储、相机等权限。

OpenCV 静态库链接顺序较敏感，修改 LIBS 时需注意。

云平台 URL、IP、端口、账号信息可能为测试配置，生产环境请替换。

数据库表结构较大，tblvisionrecord 字段较多，升级时需注意兼容。

如果路由器屏蔽端口，可能需要修改 TCP/UDP 端口。

二维码生成依赖 Fcv.makeqr。

视标显示依赖 Fcv.drawE2 和设备 dpmm 参数。

Pad 端二维码扫描依赖 ZBar 和 CameraFilter。

Pad 端导出 Excel 依赖 msxlsx，导入支持 .xlsx 和 .csv。

第一次收取数据时间可能较长，TCP 消息可能阻塞在路由器中。

许可证
本项目未在源码中声明许可证。
如需开源发布，请根据实际情况补充 LICENSE 文件，例如 MIT、Apache-2.0 或 GPL 等。

致谢
Qt

OpenCV

ZBar

Android NDK

健康平台 / FySVC 相关组件
