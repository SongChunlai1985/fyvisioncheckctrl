#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>

#include <sqlite/easytablemodel.h>

#include "mainwindow.h"
#include "camerafilter/camerafilter.h"

int main(int argc, char *argv[]){
    QApplication a(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    CameraFilter Camerafilter;
    MainWindow mw;
    qmlRegisterType<EasyTableModel>("EasyModel", 1, 0, "EasyTableModel");
    context->setContextProperty("mw", &mw);
    context->setContextProperty("Camerafilter", &Camerafilter);

    a.setOrganizationName("FYAIRO");                                     //for FileDialog
    a.setOrganizationDomain("FYAIRO");                                   //for FileDialog
    engine.load(QUrl(QStringLiteral("qrc:/Mfm.qml")));

    return a.exec();
}
