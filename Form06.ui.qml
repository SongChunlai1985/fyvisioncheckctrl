import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

Item {
    id: w06
    width: 1920
    height: 1200
    property alias textField5: textField5
    property alias busyIndicator: busyIndicator
    property alias table: table
    property alias textField2: textField2
    property alias textField1: textField1
    property alias textField: textField

    Image {
        id: imagebg
        anchors.fill: parent
        source: "img/ui/bg.png"
    }

    Text {
        id: element
        x: 118
        y: 160
        color: "#ffffff"
        text: qsTr("检查日期")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element1
        x: 515
        y: 160
        color: "#ffffff"
        text: qsTr("至")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element2
        x: 842
        y: 160
        color: "#ffffff"
        text: qsTr("学校")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element3
        x: 1455
        y: 160
        color: "#ffffff"
        text: qsTr("年级")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element4
        x: 1772
        y: 160
        color: "#ffffff"
        text: qsTr("班")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element5
        x: 117
        y: 259
        color: "#ffffff"
        text: qsTr("学号")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element6
        x: 587
        y: 259
        color: "#ffffff"
        text: qsTr("姓名")
        font.bold: true
        font.pixelSize: 45
    }

    Text {
        id: element7
        x: 1048
        y: 259
        color: "#ffffff"
        text: qsTr("检查状态")
        font.bold: true
        font.pixelSize: 45
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
        x: 276
        y: 50
        source: "img/ui/xsxxjs.png"
    }

    Image {
        id: t3p
        anchors.fill: t3
        source: "img/ui/xsxxjsp.png"
    }

    Image {
        id: r1
        x: 301
        y: 147
        source: "img/ui/6r1.png"
    }

    Image {
        id: b1
        x: 1681
        y: 254
        source: "img/ui/6b1.png"
    }

    Image {
        id: b2
        x: 95
        y: 1031
        source: "img/ui/6b2.png"
    }

    Image {
        id: b3
        x: 382
        y: 1031
        source: "img/ui/6b3.png"
    }

    Rectangle {
        id: rectangle2
        x: 95
        y: 368
        width: 1726
        height: 656
        color: "#4cffffff"
    }

    TableWidget {
        id: table
        anchors.fill: rectangle2
        tablenumber: 6
    }

    BusyIndicator {
        id: busyIndicator
        x: 928
        y: 666
    }

    Connections {
        target: mw
        onDatabaseready_StudentInfo: {
            table.table_model.horHeader = mw.get_tblvisionrecord_table_model_horHeader()
            table.table_model.initData = mw.jsonDatabase()
            busyIndicator.visible = false
        }
    }

    TextField {
        id: textField
        x: 703
        y: 269
        width: 251
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "transparent"
        }
    }

    TextField {
        id: textField1
        x: 1619
        y: 171
        width: 127
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "transparent"
        }
    }

    TextField {
        id: textField2
        x: 961
        y: 171
        width: 247
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "transparent"
        }
    }

    FileDialog {
        id: fd
        property string fdtype: "import"
        nameFilters: ["xlsx文件 (*.xlsx)", "csv文件 (*.csv)", "所有文件 (*.*)"]
        folder: "file:///sdcard/Download/"
    }

    Connections {
        target: fd
        onAccepted: {
            mw.dbg(fd.fileUrl)
            if (fd.fdtype === "import") {
                busyIndicator.visible = true
                mw.importcsv(fd.fileUrl, "Form06")
            }
            if (fd.fdtype === "export")
                mw.exportcsv(fd.fileUrl, "Form06")
        }
    }

    Image {
        id: btdr
        x: 1076
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

    Connections {
        target: btdra
        onClicked: {
            fd.selectExisting = true
            fd.fdtype = "import"
            fd.open()
        }
        onPressedChanged: {
            btdr.visible = btdr.visible ? false : true
            btdrp.visible = btdrp.visible ? false : true
        }
    }

    Image {
        id: btdr1
        x: 776
        y: -1051
        source: "img/ui/dr.png"
    }

    Image {
        id: btdrp1
        anchors.fill: btdr1
        source: "img/ui/drp.png"
        visible: false
    }

    MouseArea {
        id: btdra1
        anchors.fill: btdr1
    }

    Connections {
        target: btdra1
        onClicked: {
            mw.downloaddata()
        }
        onPressedChanged: {
            btdr1.visible = btdr1.visible ? false : true
            btdrp1.visible = btdrp1.visible ? false : true
        }
    }

    Image {
        id: btdc
        x: 1376
        y: 1051
        source: "img/ui/dc.png"
    }

    Image {
        id: btdcp
        anchors.fill: btdc
        source: "img/ui/dcp.png"
        visible: false
    }

    MouseArea {
        id: btdca
        anchors.fill: btdc
    }

    Connections {
        target: btdca
        onClicked: {
            fd.selectExisting = false
            fd.fdtype = "export"
            fd.open()
        }
        onPressedChanged: {
            btdc.visible = btdc.visible ? false : true
            btdcp.visible = btdcp.visible ? false : true
        }
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

    BasicComboBox2 {
        id: comboBox2
        x: 1256
        y: 269
        width: 253
        height: 51
        font.pixelSize: 30
        model: ["全部状态", "检测完成", "计划检查", ""]
        textColor: "white"
        radius: 3
        focusPolicy: Qt.NoFocus
        backgroundTheme: "#00000000"
        itemNormalColor: "skyblue"
        itemHighlightColor: "darkCyan"
        indicatorSource: "img/ui/ct1.png"
    }

    MouseArea {
        id: btfha
        anchors.fill: btfh
    }

    Connections {
        target: btfha
        onClicked: {
            fm01.visible = true
            visible = false
        }
        onPressedChanged: {
            btfh.visible = btfh.visible ? false : true
            btfhp.visible = btfhp.visible ? false : true
        }
    }

    MouseArea {
        id: mat1
        x: 0
        y: 8
        anchors.fill: t01
    }

    MouseArea {
        id: ab1
        anchors.fill: b1
    }

    MouseArea {
        id: ab2
        anchors.fill: b2
    }

    MouseArea {
        id: ab3
        anchors.fill: b3
    }

    Connections {
        target: mat1
        onClicked: {
            fm01.visible = true
            fm06.visible = false
            textField.enabled = false
            textField1.enabled = false
            textField2.enabled = false
        }
        onPressedChanged: {
            t01p.visible = t01p.visible ? false : true
            t3p.visible = t3p.visible ? false : true
        }
    }

    Connections {
        target: ab1
        onClicked: {
            mw.fm06_ab1_onClicked(textField.text, textField1.text,
                                  textField2.text, textField3.text,
                                  textField4.text, textField5.text,
                                  textField6.text, comboBox2.currentText)
            busyIndicator.visible = true
            table.table_view.contentY = 0
        }
        onPressedChanged: {
            b1.opacity = (b1.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ab2
        onClicked: {
            mw.selectedAll()
        }
        onPressedChanged: {
            b2.opacity = (b2.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ab3
        onClicked: {
            busyIndicator.visible = true
            mw.setStep("计划检查")
        }
        onPressedChanged: {
            b3.opacity = (b3.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Image {
        id: r2
        x: 571
        y: 147
        source: "img/ui/6r1.png"
    }

    Image {
        id: r3
        x: 937
        y: 147
        source: "img/ui/6r2.png"
    }

    Image {
        id: r4
        x: 1281
        y: 147
        source: "img/ui/6r3.png"
    }

    Image {
        id: r5
        x: 1596
        y: 147
        source: "img/ui/6r3.png"
    }

    Image {
        id: r6
        x: 208
        y: 244
        source: "img/ui/6r4.png"
    }

    Image {
        id: r7
        x: 679
        y: 244
        source: "img/ui/6r4.png"
    }

    Image {
        id: r8
        x: 1232
        y: 244
        source: "img/ui/6r4.png"
    }

    TextField {
        id: textField3
        x: 324
        y: 171
        width: 160
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "#00000000"
        }
    }

    TextField {
        id: textField4
        x: 594
        y: 171
        width: 160
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "#00000000"
        }
    }

    TextField {
        id: textField5
        x: 1300
        y: 171
        width: 136
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "#00000000"
        }
    }

    TextField {
        id: textField6
        x: 227
        y: 269
        width: 262
        height: 50
        color: "#FFFFFF"
        font.pixelSize: 30
        background: Rectangle {
            color: "#00000000"
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:1200;width:1920}
}
 ##^##*/
