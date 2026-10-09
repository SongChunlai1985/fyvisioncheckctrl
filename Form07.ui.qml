import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: w07
    width: 1920
    height: 1200
    property alias table_record: table_record
    property alias element12: element12
    property alias image10: image10
    property alias image9: image9
    property alias image8: image8
    property alias image7: image7
    property alias i8bp2: i8bp2
    property alias i8bp1: i8bp1
    property alias element9: element9
    property alias eleme1: eleme1
    property alias eleme0: eleme0
    property alias image6: image6
    property alias image5: image5
    property alias image4: image4
    property alias image3: image3
    property alias image1: image1

    property alias element8: element8
    property alias element7: element7
    property alias element6: element6
    property alias element5: element5

    property bool b11: true
    property bool b12: false
    property bool b21: true
    property bool b22: false
    property bool b31: true
    property bool b32: false
    property bool b41: true
    property bool b42: false

    property bool hzt: false

    Connections {
        target: mw
        onButtonChecked: {
            b11 = p11
            b12 = !p11
            b21 = p21
            b22 = !p21
            b31 = p31
            b32 = !p31
            b41 = p41
            b42 = !p41
        }

        onTofm07: {
            fm00.visible = false
            fm07.visible = true
        }
    }

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
        visible: false
        anchors.fill: t3
        source: "img/ui/drjcjhp.png"
    }

    MouseArea {
        id: mousearea
        anchors.fill: t01
    }

    Image {
        id: i8b
        x: 601
        y: 50

        source: "img/ui/xsxx.png"
    }

    Image {
        id: i8bp
        anchors.fill: i8b
        source: "img/ui/xsxxp.png"
        visible: true
    }

    MouseArea {
        id: mousearea1
        anchors.fill: t3
    }

    Connections {
        target: mousearea
        onPressed: {
            //fm01.visible = true
            fm00.visible = true
            visible = false
        }
        onPressedChanged: {
            t01p.visible = t01p.visible ? false : true
            i8bp.visible = i8bp.visible ? false : true
        }
    }

    Connections {
        target: mousearea1
        onPressed: {
            fm05.busyIndicator.visible = true
            mw.fm05_ab1_onClicked()
            fm05.visible = true
            visible = false
        }
        onPressedChanged: {
            t3p.visible = t3p.visible ? false : true
            i8bp.visible = i8bp.visible ? false : true
        }
    }

    Image {
        id: image1
        width: 150
        height: 150

        source: ""
        anchors.horizontalCenter: imagee.horizontalCenter
        anchors.verticalCenter: imagee.verticalCenter
    }

    Image {
        id: imagee
        x: 805
        y: -445

        source: "img/ui/8e.png"
    }

    Image {
        id: i8b1
        x: 1547
        y: -624

        source: "img/ui/7zq.png"
    }

    Image {
        id: i8bp1
        x: i8b1.x
        y: i8b1.y
        visible: false

        source: "img/ui/7zqp.png"
    }

    Image {
        id: i8b2
        x: 1547
        y: -878

        source: "img/ui/7cw.png"
    }

    Image {
        id: i8bp2
        x: i8b2.x
        y: i8b2.y
        visible: false

        source: "img/ui/7cwp.png"
    }

    Image {
        id: i8b3
        x: 1551
        y: 882
        source: "img/ui/7ksjc.png"
    }

    Image {
        id: i8bp3
        x: i8b3.x
        y: i8b3.y - 10
        visible: false

        source: "img/ui/7ksjcp.png"
    }

    BigButton {
        id: btn4
        x: 722
        y: 410
        checkable: true
        checked: b11
        buttonText: qsTr("正常视标")
        Connections {
            target: btn4.clickArea
            onPressed: {
                mw.setSymbol("正常视标")
                btn3.checked = false
                btn4.checked = true
            }
        }
    }

    BigButton {
        id: btn3
        x: 939
        y: 410
        checkable: true
        checked: b12
        buttonText: qsTr("儿童视标")
        Connections {
            target: btn3.clickArea
            onPressed: {
                mw.setSymbol("儿童视标")
                btn3.checked = true
                btn4.checked = false
            }
        }
    }

    BigButton {
        id: btn5
        x: 722
        y: 640
        checkable: true
        checked: b21
        buttonText: qsTr("单  显")
        Connections {
            target: btn5.clickArea
            onPressed: {
                mw.setSymbol("单显")
                btn5.checked = true
                btn6.checked = false
            }
        }
    }

    BigButton {
        id: btn6
        x: 939
        y: 640
        checkable: true
        checked: b22
        buttonText: qsTr("排  显")
        Connections {
            target: btn6.clickArea
            onPressed: {
                mw.setSymbol("排显")
                btn5.checked = false
                btn6.checked = true
            }
        }
    }

    BigButton {
        id: btn2
        x: 1327
        y: 640
        checkable: true
        checked: b31
        buttonText: qsTr("快速模式")
        Connections {
            target: btn2.clickArea
            onPressed: {
                mw.setSymbol("快速模式")
                btn1.checked = false
                btn2.checked = true
            }
        }
    }

    BigButton {
        id: btn1
        x: 1544
        y: 640
        checkable: true
        checked: b32
        buttonText: qsTr("标准模式")
        Connections {
            target: btn1.clickArea
            onPressed: {
                mw.setSymbol("标准模式")
                btn1.checked = true
                btn2.checked = false
            }
        }
    }

    BigButton {
        id: i8b4
        x: 722
        y: 870
        checkable: true
        checked: b41
        buttonText: qsTr("5米")
        Connections {
            target: i8b4.clickArea
            onPressed: {
                mw.on_pushButton_9_clicked()
                i8b4.checked = true
                i8b5.checked = false
            }
        }
    }

    BigButton {
        id: i8b5
        x: 939
        y: 870
        checkable: true
        checked: b42
        buttonText: qsTr("4米")
        Connections {
            target: i8b5.clickArea
            onPressed: {
                mw.on_pushButton_6_clicked()
                i8b4.checked = false
                i8b5.checked = true
            }
        }
    }

    Image {
        id: i8b6
        x: 1547
        y: 196
        source: "img/ui/7fh.png"
    }

    Image {
        id: i8bp6
        x: i8b6.x
        y: i8b6.y
        visible: false

        source: "img/ui/7fhp.png"
    }

    Image {
        id: i8b7
        x: 1552
        y: -1280

        source: "img/ui/7jx.png"
    }

    Image {
        id: i8bp7
        x: i8b7.x
        y: i8b7.y
        visible: false

        source: "img/ui/7jxp.png"
    }

    Text {
        id: element9
        x: 905
        y: 176
        color: "#ffffff"
        text: qsTr("检查未开始")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.letterSpacing: 2
        font.bold: true
        font.pixelSize: 80
    }

    Image {
        id: gbg
        x: 107
        y: 177
        fillMode: Image.PreserveAspectFit
        source: "img/ui/7xsxx.png"
    }

    Rectangle {
        id: rectangle
        x: 173
        y: 409
        width: 482
        height: 654
        color: "#00000000"
    }

    TableWidget {
        id: table_record
        anchors.fill: rectangle
        tablenumber: 7
        verHeaderHeight: 50
        verHeaderWidth: 50
        horHeaderHeight: 50
        columnWidthArr: [135, 135, 400]
        table_model.horHeader: ["左眼视力", "右眼视力", "检查时间...                                  "]
    }

    Connections {
        target: mw
        onDatabaseready_CheckRecord: {
            table_record.table_model.initData = mw.jsonDatabase()
        }
    }

    Text {
        id: element5
        x: 263
        y: 243
        color: "#ffffff"
        text: qsTr("雷家敏")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 32
        font.family: "Arial"
    }

    Text {
        id: element6
        x: 579
        y: 241
        height: 49
        color: "#ffffff"
        text: qsTr("男")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
        font.pixelSize: 32
    }

    Text {
        id: element7
        x: 264
        y: 297
        color: "#ffffff"
        text: qsTr("1234567")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
        font.pixelSize: 32
    }

    Text {
        id: element8
        x: 266
        y: 341
        color: "#ffffff"
        text: qsTr("123")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 32
        font.family: "Arial"
    }

    Text {
        id: element10
        x: 807
        y: -802
        color: "#ffffff"
        text: qsTr("对数读数：")

        font.pixelSize: 42
        font.family: "Arial"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: element11
        x: 807
        y: -900
        color: "#ffffff"
        text: qsTr("小数读数：")

        font.family: "Arial"
        font.pixelSize: 42
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: eleme0
        x: 1033
        y: -810
        color: "#ffffff"
        text: qsTr("4.0")

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 42
        font.bold: false
    }

    Text {
        id: eleme1
        x: 1033
        y: -906
        color: "#ffffff"
        text: qsTr("0.1")

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 42
        font.bold: false
    }

    MouseArea {
        anchors.fill: i8b1
        Connections {
            onPressed: {
                mw.on_pushButton_clicked()
            }
            onPressedChanged: {
                i8bp1.visible = i8bp1.visible ? false : true
            }
        }
    }

    MouseArea {
        anchors.fill: i8b2
        Connections {
            onPressed: {
                mw.on_pushButton_5_clicked()
            }
            onPressedChanged: {
                i8bp2.visible = i8bp2.visible ? false : true
            }
        }
    }

    MouseArea {
        anchors.fill: i8b3
        Connections {
            onPressed: {
                print("pressed")
                mw.cstart()
                state = "State1"
                image1.visible = true
                testing = true
                print("pressend")
            }
            onPressedChanged: {

                //i8bp3.visible = i8bp3.visible ? false : true
            }
        }
    }

    MouseArea {
        anchors.fill: i8b6
        Connections {
            onPressed: {
                fm05.visible = true
                visible = false
                testing = false
                tmr3.stop()

                fm05.busyIndicator.visible = true
                mw.fm05_ab1_onClicked()
                if (fm07.hzt) {
                    fm07.hzt = false
                    fm00.visible = true
                    fm05.visible = false
                    mw.returnhzt()
                }
            }
            onPressedChanged: {

                //i8bp6.visible = i8bp6.visible ? false : true
            }
        }
    }

    MouseArea {
        anchors.fill: i8b7
        Connections {
            onPressed: {
                if (mw.get_eye_chart() === "左眼") {
                    state = "State3"
                }
                if (mw.get_eye_chart() === "右眼") {
                    state = "State1"
                }
                mw.continu()
                testing = true
                element12.text = ""
                tmr3.start()
            }
            onPressedChanged: {
                i8bp7.visible = i8bp7.visible ? false : true
            }
        }
    }

    Image {
        id: image3
        x: 840
        y: -641
        width: 50
        height: 50

        fillMode: Image.PreserveAspectFit
        source: "img/n.png"
    }

    Image {
        id: image4
        x: image3.x + 70
        y: image3.y
        width: 50
        height: 50

        source: "img/n.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image5
        x: image4.x + 70
        y: image3.y
        width: 50
        height: 50

        fillMode: Image.PreserveAspectFit
        source: "img/n.png"
    }

    Image {
        id: image6
        x: image5.x + 70
        y: image3.y
        width: 50
        height: 50

        fillMode: Image.PreserveAspectFit
        source: "img/n.png"
    }

    Image {
        id: image7
        x: image6.x + 70
        y: image3.y
        width: 50
        height: 50

        fillMode: Image.PreserveAspectFit
        source: "img/n.png"
    }

    Image {
        id: image8
        x: image7.x + 70
        y: image3.y
        width: 50
        height: 50

        source: "img/n.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image9
        x: image8.x + 70
        y: image3.y
        width: 50
        height: 50

        fillMode: Image.PreserveAspectFit
        source: "img/n.png"
    }

    Image {
        id: image10
        x: image9.x + 70
        y: image3.y
        width: 50
        height: 50

        fillMode: Image.PreserveAspectFit
        source: "img/n.png"
    }

    property bool testing: false

    Connections {
        target: mw
        onSigarv: {
            image1.source = mw.image1()
            image3.source = mw.image3()
            image4.source = mw.image4()
            image5.source = mw.image5()
            image6.source = mw.image6()
            image7.source = mw.image7()
            image8.source = mw.image8()
            image9.source = mw.image9()
            image10.source = mw.image10()

            eleme1.text = mw.eleme1() //qsTr("el12")
            eleme0.text = mw.eleme0() //qsTr("el13")

            if (mw.element9() === "1") {
                state = "State2"
                testing = false
                tmr3.stop()
            }

            if (mw.get_type() === "走近" && mw.get_number() === "0") {
                state = "State5"
                element9.text = mw.get_step_str()
                element12.text = ""
                testing = false
                tmr3.stop()
            }

            if (mw.get_type() === "后退" && mw.get_number() === "0") {
                state = "State5"
                element9.text = mw.get_step_str()
                element12.text = ""
                testing = false
                tmr3.stop()
            }

            if (mw.testend() === "10") {
                mw.dbg("fm07 测试完成")
                state = "State4"
                testing = false
                tmr3.stop()
            }

            eleme2.text = mw.eleme2()
            tmr3.stop()

            if (testing) {
                element12.text = ""
                tmr3.start()
            }
        }
    }

    Image {
        id: imagee1
        x: 1120
        y: -445

        source: "img/ui/8e.png"
    }

    Text {
        id: eleme2
        x: 1141
        y: 482
        color: "#ffffff"
        text: qsTr("左")
        font.pixelSize: 90

        font.bold: false
        anchors.horizontalCenter: imagee1.horizontalCenter
        anchors.verticalCenter: imagee1.verticalCenter
    }

    Text {
        id: element12
        x: 807
        y: -995
        color: "#ffffff"

        font.bold: false
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Image {
        id: t4
        x: 568
        y: 73
        source: "img/ui/ct.png"
    }

    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: i8b1
                y: 624
            }

            PropertyChanges {
                target: i8b2
                y: 878
            }

            PropertyChanges {
                target: i8b4
                y: -870
            }

            PropertyChanges {
                target: i8b5
                y: -870
            }

            PropertyChanges {
                target: i8b3
                y: -882
            }

            PropertyChanges {
                target: imagebg
                source: "img/ui/bg.png"
            }

            PropertyChanges {
                target: element9
                text: qsTr("检查右眼中")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            PropertyChanges {
                target: image3
                y: 341
            }

            PropertyChanges {
                target: imagee
                y: 445
            }

            PropertyChanges {
                target: imagee1
                y: 445
            }

            PropertyChanges {
                target: eleme2
                font.pixelSize: 120
                font.bold: true
            }

            PropertyChanges {
                target: element10
                y: 802
                font.bold: true
            }

            PropertyChanges {
                target: element11
                y: 900
                font.bold: true
            }

            PropertyChanges {
                target: eleme0
                y: 810
            }

            PropertyChanges {
                target: eleme1
                y: 906
            }

            PropertyChanges {
                target: element12
                y: 995
            }

            PropertyChanges {
                target: btn4
                y: 1410
            }

            PropertyChanges {
                target: btn3
                y: 1410
            }

            PropertyChanges {
                target: btn5
                y: 1640
            }

            PropertyChanges {
                target: btn6
                y: 1640
            }

            PropertyChanges {
                target: btn2
                y: 1640
            }

            PropertyChanges {
                target: btn1
                y: 1640
            }
        },
        State {
            name: "State2"

            PropertyChanges {
                target: imagebg
                source: "img/ui/bg.png"
            }

            PropertyChanges {
                target: element9
                text: qsTr("请换左眼")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            PropertyChanges {
                target: i8b7
                x: 1554
                y: 882
            }

            PropertyChanges {
                target: i8b3
                y: -1482
                visible: true
            }

            PropertyChanges {
                target: btn4
                y: 1410
            }

            PropertyChanges {
                target: btn3
                y: 1410
            }

            PropertyChanges {
                target: btn5
                y: 1640
            }

            PropertyChanges {
                target: btn6
                y: 1640
            }

            PropertyChanges {
                target: btn2
                y: 1640
            }

            PropertyChanges {
                target: btn1
                y: 1640
            }
        },
        State {
            name: "State3"
            PropertyChanges {
                target: i8b1
                y: 624
            }

            PropertyChanges {
                target: i8b2
                y: 878
            }

            PropertyChanges {
                target: i8b4
                y: -870
            }

            PropertyChanges {
                target: i8b5
                y: -870
            }

            PropertyChanges {
                target: i8b3
                y: -882
            }

            PropertyChanges {
                target: imagebg
                source: "img/ui/bg.png"
            }

            PropertyChanges {
                target: element9
                text: qsTr("检查左眼中")
            }

            PropertyChanges {
                target: image3
                y: 341
            }

            PropertyChanges {
                target: image1
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
            }

            PropertyChanges {
                target: imagee
                y: 445
            }

            PropertyChanges {
                target: imagee1
                y: 445
            }

            PropertyChanges {
                target: element10
                y: 802
            }

            PropertyChanges {
                target: element11
                y: 900
            }

            PropertyChanges {
                target: eleme0
                y: 810
            }

            PropertyChanges {
                target: eleme1
                y: 906
            }

            PropertyChanges {
                target: element12
                y: 995
            }

            PropertyChanges {
                target: btn1
                y: 1640
            }

            PropertyChanges {
                target: btn2
                y: 1640
            }

            PropertyChanges {
                target: btn6
                y: 1640
            }

            PropertyChanges {
                target: btn5
                y: 1640
            }

            PropertyChanges {
                target: btn4
                y: 1410
            }

            PropertyChanges {
                target: btn3
                y: 1410
            }
        },
        State {
            name: "State4"

            PropertyChanges {
                target: i8b4
                y: -870
            }

            PropertyChanges {
                target: i8b5
                y: -870
            }

            PropertyChanges {
                target: i8b3
                y: -1682
            }

            PropertyChanges {
                target: imagebg
                source: "img/ui/bg.png"
            }

            PropertyChanges {
                target: element9
                text: qsTr("检查完成")
            }

            PropertyChanges {
                target: element10
                x: 791
                y: 414
                text: qsTr("左眼视力：")
                font.pixelSize: 32
            }

            PropertyChanges {
                target: element11
                x: 791
                y: 673
                text: qsTr("右眼视力：")
                font.pixelSize: 32
            }

            PropertyChanges {
                target: eleme0
                x: 819
                y: 479
                font.bold: true
                font.pixelSize: 58
            }

            PropertyChanges {
                target: eleme1
                x: 819
                y: 740
                font.bold: true
                font.pixelSize: 58
            }

            PropertyChanges {
                target: btn3
                y: 1410
            }

            PropertyChanges {
                target: btn1
                y: 1640
            }

            PropertyChanges {
                target: btn2
                y: 1640
            }

            PropertyChanges {
                target: btn6
                y: 1640
            }

            PropertyChanges {
                target: btn5
                y: 1640
            }

            PropertyChanges {
                target: btn4
                y: 1410
            }
        },
        State {
            name: "State5"

            PropertyChanges {
                target: i8b4
                y: -1270
            }

            PropertyChanges {
                target: i8b5
                y: -1270
            }

            PropertyChanges {
                target: i8b3
                y: -1282
            }

            PropertyChanges {
                target: imagebg
                source: "img/ui/bg.png"
            }

            PropertyChanges {
                target: element9
                x: 781
                y: 176
                text: qsTr("请向前走到4米处")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            PropertyChanges {
                target: i8b7
                x: 1554
                y: 882
            }

            PropertyChanges {
                target: btn4
                y: 1410
            }

            PropertyChanges {
                target: btn3
                y: 1410
            }

            PropertyChanges {
                target: btn6
                y: 1640
            }

            PropertyChanges {
                target: btn5
                y: 1640
            }

            PropertyChanges {
                target: btn2
                y: 1640
            }

            PropertyChanges {
                target: btn1
                y: 1640
            }
        }
    ]
}
