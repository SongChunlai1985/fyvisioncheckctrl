import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: w00
    width: 1920
    height: 1200
    property alias img1l: img1l

    Image {
        id: image
        anchors.fill: parent
        source: "img/ui/bg.png"
    }

    MouseArea {
        id: mouseArea
        x: 723
        y: 260
        width: 234
        height: 89
        Connections {
            onClicked: {
                mw.newBatch()
            }
        }
    }

    Image {
        id: image1
        x: 202
        y: 380
        source: "img/ui/00a.png"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            Connections {
                onClicked: {
                    fm00.visible = false
                    fm05.visible = true

                    fm06.textField1.text = comboBox3.currentText
                    fm06.textField5.text = comboBox2.currentText
                    fm06.textField2.text = comboBox1.currentText

                    mw.initWork(comboBox2.currentText, comboBox3.currentText)

                    fm05.busyIndicator.visible = true
                    mw.fm05_ab1_onClicked()
                }
                onPressedChanged: {
                    image1.opacity = (image1.opacity == 0.3) ? 1.0 : 0.3
                }
            }
        }
    }

    Image {
        id: image2
        x: 1056
        y: 380
        source: "img/ui/00b.png"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            Connections {
                onClicked: {
                    mw.actStart()
                }
                onPressedChanged: {
                    image2.opacity = (image2.opacity == 0.3) ? 1.0 : 0.3
                }
            }
        }
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
        source: "img/ui/syp.png"
    }

    MouseArea {
        id: mat01
        anchors.fill: t01
    }

    Image {
        id: t02
        x: 1516
        y: 50
        source: "img/ui/dqyhxx.png"
    }

    Image {
        id: t02p
        anchors.fill: t02
        source: "img/ui/dqyhxxp.png"
        visible: false
    }

    MouseArea {
        id: mat02
        anchors.fill: t02
    }

    Image {
        id: img1l
        x: 1746
        y: 139
        source: "img/ui/1l.png"
        visible: false
    }

    Connections {
        target: mat02
        onClicked: {
            mw.dbg("debug ok")
            fm00.visible = false
            fm.visible = true
            fm.textField.enabled = true
            fm.textField1.enabled = true
        }
        onPressedChanged: {
            t02p.visible = !t02p.visible
            t01p.visible = !t01p.visible
        }
    }

    Image {
        id: r1
        x: 1412
        y: 154
        source: "img/ui/6r4.png"
    }

    Image {
        id: r2
        x: 870
        y: 154
        source: "img/ui/6r4.png"
    }

    Image {
        id: r3
        x: 338
        y: 154
        source: "img/ui/6r4.png"
    }

    BasicComboBox2 {
        id: comboBox1
        x: 362
        y: 179
        width: 253
        height: 51
        font.pixelSize: 30
        model: ["学校一学校一学校一学校一", "学校二学校二学校二学校二", "学校三学校三学校三学校三", ""]
        textColor: "white"
        radius: 3
        focusPolicy: Qt.NoFocus
        backgroundTheme: "#00000000"
        itemNormalColor: "skyblue"
        itemHighlightColor: "darkCyan"
        indicatorSource: "img/ui/ct1.png"
        Connections {
            onCurrentIndexChanged: {

            }
        }
    }

    BasicComboBox2 {
        id: comboBox2
        x: 894
        y: 179
        width: 253
        height: 51
        font.pixelSize: 30
        model: ["年级一", "年级二", "年级三", ""]
        textColor: "white"
        radius: 3
        focusPolicy: Qt.NoFocus
        backgroundTheme: "#00000000"
        itemNormalColor: "skyblue"
        itemHighlightColor: "darkCyan"
        indicatorSource: "img/ui/ct1.png"
        Connections {
            onCurrentIndexChanged: {
                mw.changeGrade(comboBox2.currentIndex)
            }
        }
    }

    BasicComboBox2 {
        id: comboBox3
        x: 1436
        y: 179
        width: 253
        height: 51
        font.pixelSize: 30
        model: ["班级一", "班级二", "班级三", ""]
        textColor: "white"
        radius: 3
        focusPolicy: Qt.NoFocus
        backgroundTheme: "#00000000"
        itemNormalColor: "skyblue"
        itemHighlightColor: "darkCyan"
        indicatorSource: "img/ui/ct1.png"
        Connections {
            onCurrentIndexChanged: {
                mw.changeClass(comboBox3.currentIndex)
            }
        }
    }

    Connections {
        target: mw
        onShowWorkTable: {
            comboBox1.model = schoolNameList
            comboBox2.model = gradeListset
            comboBox3.model = gradeClass
            element.text = batchId
        }
    }

    Text {
        id: element1
        x: 221
        y: 170
        color: "#ffffff"
        text: qsTr("学校：")
        font.pixelSize: 45
        font.bold: true
    }

    Text {
        id: element2
        x: 751
        y: 170
        color: "#ffffff"
        text: qsTr("年级：")
        font.pixelSize: 45
        font.bold: true
    }

    Text {
        id: element3
        x: 1292
        y: 170
        color: "#ffffff"
        text: qsTr("班级：")
        font.pixelSize: 45
        font.bold: true
    }

    Text {
        id: element4
        x: 221
        y: 265
        color: "#ffffff"
        text: qsTr("批次：")
        font.bold: true
        font.pixelSize: 45
    }

    Image {
        id: r4
        x: 338
        y: 249
        source: "img/ui/6r4.png"

        Text {
            id: element
            x: 42
            y: 22
            width: 214
            height: 58
            color: "#ffffff"
            text: qsTr("0")
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }
    }

    Text {
        id: element5
        x: 751
        y: 266
        color: "#ffffff"
        text: qsTr("新建批次")
        font.bold: true
        font.pixelSize: 45
    }
}




/*##^## Designer {
    D{i:4;anchors_y:361}D{i:7;anchors_x:90;anchors_y:50}
}
 ##^##*/
