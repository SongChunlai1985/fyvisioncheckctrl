import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

Item {
    id: w05
    width: 1920
    height: 1200
    property alias busyIndicator: busyIndicator
    property alias tblvisionrecord: tblvisionrecord

    Image {
        id: imagebg
        anchors.fill: parent
        source: "img/ui/bg.png"
    }

    Image {
        id: t01
        x: 90
        y: 50
        source: "img/ui/sy.png"
    }

    Image {
        id: t01p
        anchors.fill: t01
        visible: false
        source: "img/ui/syp.png"
    }

    Image {
        id: t03
        x: 241
        y: 73
        source: "img/ui/ct.png"
    }

    Image {
        id: t3
        x: 266
        y: 50
        source: "img/ui/drjcjh.png"
    }

    Image {
        id: t3p
        anchors.fill: t3
        source: "img/ui/drjcjhp.png"
    }

    Image {
        id: btfh
        x: 1676
        y: 1051
        source: "img/ui/fh.png"
    }

    Image {
        id: btfhp
        anchors.fill: btfh
        source: "img/ui/fhp.png"
        visible: false
    }

    MouseArea {
        id: btfha
        anchors.fill: btfh
    }

    Connections {
        target: btfha
        onClicked: {
            fm00 /*fm01*/.visible = true
            visible = false
        }
        onPressedChanged: {
            btfh.visible = btfh.visible ? false : true
            btfhp.visible = btfhp.visible ? false : true
        }
    }

    Image {
        id: btdr
        x: 1266
        y: 1051
        source: "img/ui/dr.png"
    }

    Image {
        id: btdrp
        anchors.fill: btdr
        source: "img/ui/drp.png"
        visible: false
    }

    MouseArea {
        id: btdra
        anchors.fill: btdr
    }

    Text {
        id: i03
        x: 112
        y: 1057
        font.pointSize: 20
        color: "white"
        text: "连接电子视力表"
    }

    MouseArea {
        id: ma03
        anchors.fill: i03
    }

    FileDialog {
        id: fd
        nameFilters: ["xlsx文件 (*.xlsx)", "csv文件 (*.csv)", "所有文件 (*.*)"]
        folder: "file:///sdcard/Download/"
    }

    Connections {
        target: ma03
        onClicked: {
            fm05.visible = false
            fm03.visible = true
        }
    }

    Connections {
        target: fd
        onAccepted: {
            mw.dbg(fd.fileUrl)
            mw.importcsv(fd.fileUrl, "Form05")
            busyIndicator.visible = true
        }
    }

    Connections {
        target: btdra
        onClicked: {
            fd.open()
        }
        onPressedChanged: {
            btdr.visible = btdr.visible ? false : true
            btdrp.visible = btdrp.visible ? false : true
        }
    }

    Rectangle {
        id: rectangle
        x: 112
        y: 164
        width: 1700
        height: 857
        color: "#4fffffff"
        border.color: "#00000000"
        border.width: 1
    }

    TableWidget {
        id: tblvisionrecord
        anchors.fill: rectangle
        tablenumber: 5
        columnWidthArr: [200, 200, 200, 200, 500, 200, 200, 500, 200, 500, 500, 400, 100, 100, 100, 100, 100, 100]
    }

    BusyIndicator {
        id: busyIndicator
        x: 932
        y: 563
    }

    MouseArea {
        id: mat1
        anchors.fill: t01
    }

    Connections {
        target: mw
        onDatabaseready_TodayPlan: {
            tblvisionrecord.table_model.horHeader = mw.get_tblvisionrecord_table_model_horHeader(
                        5)
            tblvisionrecord.table_model.initData = mw.jsonDatabase()
            busyIndicator.visible = false
        }
    }

    Connections {
        target: mat1
        onClicked: {
            fm00.visible = true
            fm05.visible = false
        }
        onPressedChanged: {
            t01p.visible = t01p.visible ? false : true
            t3p.visible = t3p.visible ? false : true
        }
    }
}
