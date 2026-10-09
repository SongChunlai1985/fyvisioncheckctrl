#-------------------------------------------------
#
# Project created by QtCreator 2020-05-29T20:04:37
#
#-------------------------------------------------

QT += core network quick multimedia quickcontrols2 androidextras bluetooth
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = VisionCheck
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
ANDROID_VERSION_CODE = "21"                                           #安装高版本会覆盖低版本
ANDROID_VERSION_NAME = "FY-SVC-PD-010.20210415"                       #版本号

DEFINES += ANDROID_VERSION_CODE=\\\"$$ANDROID_VERSION_CODE\\\"
DEFINES += ANDROID_VERSION_NAME=\\\"$$ANDROID_VERSION_NAME\\\"

DEFINES += QT_DEPRECATED_WARNINGS
#DEFINES += QT_NO_DEBUG_OUTPUT

#DEFINES += FyUdpDebug FyUdpDebugGBK


QMAKE_CXXFLAGS_RELEASE += -O3

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


ANDROID_ROOT = /home/song/android

CONFIG += c++11 console

SOURCES += \
        main.cpp \
        mainwindow.cpp \
    $$ANDROID_ROOT/libfy/base64/base64.cpp \
    $$ANDROID_ROOT/libfy/camerafilter/camerafilter.cpp \
    $$ANDROID_ROOT/libfy/fjson/fjson.cpp \
    $$ANDROID_ROOT/libfy/fcv/fcv.cpp \
    $$ANDROID_ROOT/libfy/base/base.cpp \
    $$ANDROID_ROOT/libfy/network/udpwork.cpp \
    $$ANDROID_ROOT/libfy/network/tcpwork.cpp \
    $$ANDROID_ROOT/libfy/network/httpwork.cpp \
#    ../../android/libfy/sqlite/easytablemodel.cpp \
#    ../../android/libfy/csvfile.cpp \
    $$ANDROID_ROOT/libfy/sqlite/easytablemodel.cpp \
    $$ANDROID_ROOT/libfy/csvfile.cpp \
    wifimanager/wifimanager.cpp \
#    ../../android/libfy/msxlsx/msxlsx.cpp \
#    ../../android/libfy/msxlsx/xlsxio_read.c \
#    ../../android/libfy/msxlsx/xlsxio_read_sharedstrings.c \
#    ../../android/libfy/msxlsx/xlsxio_write.c \
#    ../../android/libfy/msxlsx/minizip/ioapi.c \
#    ../../android/libfy/msxlsx/minizip/unzip.c \
#    ../../android/libfy/msxlsx/minizip/zip.c \
#    ../../android/libfy/audiorecorder/audiorecorder.cpp \
    $$ANDROID_ROOT/libfy/msxlsx/msxlsx.cpp \
    $$ANDROID_ROOT/libfy/msxlsx/xlsxio_read.c \
    $$ANDROID_ROOT/libfy/msxlsx/xlsxio_read_sharedstrings.c \
    $$ANDROID_ROOT/libfy/msxlsx/xlsxio_write.c \
    $$ANDROID_ROOT/libfy/msxlsx/minizip/ioapi.c \
    $$ANDROID_ROOT/libfy/msxlsx/minizip/unzip.c \
    $$ANDROID_ROOT/libfy/msxlsx/minizip/zip.c \
    $$ANDROID_ROOT/libfy/audiorecorder/audiorecorder.cpp \
    database.cpp \
    ../../android/libfy/bluetooth/bluedevice.cpp \
    workthread.cpp

HEADERS += \
        mainwindow.h \
    $$ANDROID_ROOT/libfy/base64/base64.h \
    $$ANDROID_ROOT/libfy/camerafilter/camerafilter.h \
    $$ANDROID_ROOT/libfy/fjson/fjson.h \
    $$ANDROID_ROOT/libfy/fcv/fcv.h \
    $$ANDROID_ROOT/libfy/base/base.h \
    $$ANDROID_ROOT/libfy/network/udpwork.h \
    $$ANDROID_ROOT/libfy/network/tcpwork.h \
    $$ANDROID_ROOT/libfy/network/httpwork.h \
    $$ANDROID_ROOT/libfy/sqlite/easytablemodel.h \
    $$ANDROID_ROOT/libfy/csvfile.h \
    wifimanager/wifimanager.h \
    $$ANDROID_ROOT/libfy/msxlsx/msxlsx.h \
    $$ANDROID_ROOT/libfy/msxlsx/xlsxio_read.h \
    $$ANDROID_ROOT/libfy/msxlsx/xlsxio_read_sharedstrings.h \
    $$ANDROID_ROOT/libfy/msxlsx/xlsxio_write.h \
    $$ANDROID_ROOT/libfy/audiorecorder/audiorecorder.h \
    database.h \
    ../../android/libfy/bluetooth/bluedevice.h \
    workthread.h

FORMS +=

CONFIG += mobility
MOBILITY =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

contains(ANDROID_TARGET_ARCH, armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        /home/song/android/OpenCV-android-sdk-4.1.0/sdk/native/libs/armeabi-v7a/libopencv_java4.so \
        /home/song/android/android-ndk-r14b/platforms/android-21/arch-arm/usr/lib/libmediandk.so \
        /home/song/android/android-zbar-sdk/zbar/src/main/jniLibs/armeabi-v7a/libzbar.so \
        /home/song/android/android-zbar-sdk/zbar/src/main/jniLibs/armeabi-v7a/libiconv.so \
        #/home/cc/Applications/qt/5.12.2/android_armv7/lib/libQt5QuickParticles.so \
        /home/song/android/android-ndk-r14b/platforms/android-19/arch-arm/usr/lib/libqrencode.so \
        /home/song/android/StandaloneTool/sysroot/usr/lib/libexpat.so \
        /home/song/android/android_openssl/Qt-5.12.3/arm/libcrypto.so \
        /home/song/android/android_openssl/Qt-5.12.3/arm/libssl.so

    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
contains(ANDROID_TARGET_ARCH, armeabi-v8a) {
    ANDROID_EXTRA_LIBS = \
        /home/song/android/OpenCV-android-sdk-4.1.0/sdk/native/libs/armeabi-v8a/libopencv_java4.so \
        /home/song/android/android-ndk-r14b/platforms/android-21/arch-arm/usr/lib/libmediandk.so \
        /home/song/android/android-zbar-sdk/zbar/src/main/jniLibs/armeabi-v8a/libzbar.so \
        /home/song/android/android-zbar-sdk/zbar/src/main/jniLibs/armeabi-v8a/libiconv.so \
        /home/song/Code/fyvisioncheckctrl/../../Qt5.12.2/5.12.2/android_armv8/lib/libQt5QuickParticles.so \
        /home/song/android/android-ndk-r14b/platforms/android-19/arch-arm/usr/lib/libqrencode.so \
        /home/song/android/StandaloneTool/sysroot/usr/lib/libexpat.so \
        /home/song/android/android_openssl/Qt-5.12.3/arm/libcrypto.so \
        /home/song/android/android_openssl/Qt-5.12.3/arm/libssl.so

    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/src/com/fyairo/VisionCheckControler/ExtendsQtWithJava.java \
    android/src/com/fyairo/VisionCheckControler/WifiUtil.java \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/layout/aa_empty_normal.xml \
    android/res/layout/act_check_record_overview.xml \
    android/res/layout/act_check_record_overview_details.xml \
    android/res/layout/act_check_record_overview_details_filter.xml \
    android/res/layout/act_check_record_overview_details_filter_item.xml \
    android/res/layout/act_check_record_overview_details_item.xml \
    android/res/layout/act_check_record_overview_item.xml \
    android/res/layout/act_check_record_overview_pager.xml \
    android/res/layout/act_check_record_overview_select_batch_id.xml \
    android/res/layout/act_check_record_overview_select_batch_id_item.xml \
    android/res/layout/act_check_record_overview_title.xml \
    android/res/layout/act_physical_check_main_view.xml \
    android/res/layout/act_physical_multi_check_view.xml \
    android/res/layout/activity_main.xml \
    android/res/layout/alert_dialog_layout.xml \
    android/res/layout/alert_dialog_menu_layout.xml \
    android/res/layout/alert_dialog_menu_list_layout_cancel.xml \
    android/res/layout/alert_dialog_menu_list_single_item_layout.xml \
    android/res/layout/app_dialog_layout_ui.xml \
    android/res/layout/app_dialog_progress_view.xml \
    android/res/layout/cell_pie_chart.xml \
    android/res/layout/cell_switch_btn.xml \
    android/res/layout/commom_popupwindow_list.xml \
    android/res/layout/common_popup_list_item.xml \
    android/res/layout/kt_cell_check_record_header.xml \
    android/res/layout/kt_common_tab_item_view.xml \
    android/res/layout/kt_toolbar.xml \
    android/res/layout/pcm_check_class_view.xml \
    android/res/layout/pcm_check_student_view.xml \
    android/res/layout/pcm_class_item_view.xml \
    android/res/layout/pcm_student_item_view.xml \
    android/res/layout/share_item.xml \
    android/res/layout/toast_layout.xml \
    android/res/values/libs.xml \
    android/libs/physical-check-library-1.0.17.aar \
    android/assets/0.png \
    android/assets/1.png \
    android/assets/2.png \
    android/assets/3.png \
    android/assets/4.png \
    android/assets/5.png \
    android/assets/6.png \
    android/assets/n.png \
    android/assets/r.png \
    android/assets/w.png \
    android/res/drawable/logo.png \
    android/res/drawable-hdpi/icon.png \
    android/res/drawable-ldpi/icon.png \
    android/res/drawable-mdpi/icon.png \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/build.gradle \
    android/gradlew.bat \
    android/proguard.txt \
    android/src/com/fyairo/VisionCheckControler/ExtendsQtWithJava.java \
    android/src/com/fyairo/VisionCheckControler/WifiUtil.java

ANDROID_OPENCV = /home/song/android/OpenCV-android-sdk-4.1.0/sdk/native

INCLUDEPATH += \
#$$ANDROID_OPENCV/jni/include/opencv \
$$ANDROID_OPENCV/jni/include/opencv2 \
$$ANDROID_OPENCV/jni/include \
/home/song/android/android-zbar-sdk/zbar/src/main/jni/include \
$$ANDROID_ROOT/libfy

LIBS += \
$$ANDROID_OPENCV/libs/armeabi-v7a/libopencv_java4.so \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_contrib.a \             ##静态库有顺序
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_legacy.a \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_ml.a \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_objdetect.a \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_calib3d.a \
$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_video.a \
$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_videoio.a \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_features2d.a \
$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_highgui.a \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_androidcamera.a \
#$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_flann.a \
$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_imgproc.a \
$$ANDROID_OPENCV/staticlibs/armeabi-v7a/libopencv_core.a \
$$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibjpeg-turbo.a \
#$$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibpng.a \
#$$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibtiff.a \
#$$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/liblibjasper.a \
#$$ANDROID_OPENCV/3rdparty/libs/armeabi-v7a/libtbb.a
/home/song/android/android-zbar-sdk/zbar/src/main/jniLibs/armeabi-v7a/libzbar.so \
/home/song/android/android-zbar-sdk/zbar/src/main/jniLibs/armeabi-v7a/libiconv.so \
/home/song/android/android-ndk-r14b/platforms/android-19/arch-arm/usr/lib/libqrencode.so \
/home/song/android/StandaloneTool/sysroot/usr/lib/libexpat.so.1.6.11

RESOURCES += \
    mfm.qrc
