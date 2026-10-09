import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: w02
    width: 1920
    height: 1200
    property string tvSoftinfo: ""
    property string padSoftinfo: ""

    Connections {
        target: mw
        onSoftInfoArrive: {
            tvSoftinfo = tvInfo
            padSoftinfo = padInfo
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
        source: "img/ui/syp.png"
        visible: false
    }

    Image {
        id: t03
        x: 241
        y: 73
        source: "img/ui/ct.png"
    }

    Image {
        id: t3
        x: 268
        y: 50
        source: "img/ui/sz.png"
    }

    Image {
        id: t3p
        anchors.fill: t3
        source: "img/ui/szp.png"
    }

    MouseArea {
        id: mat01
        anchors.fill: t01
    }

    Image {
        id: b01
        x: 104
        y: 195
        source: "img/ui/xtxx.png"
    }

    Image {
        id: b01p
        x: 104
        y: 195
        source: "img/ui/xtxxp.png"
    }

    Image {
        id: b02
        x: 104
        y: 309
        source: "img/ui/dzslb.png"
    }

    Image {
        id: b02p
        x: 104
        y: 309
        source: "img/ui/dzslbp.png"
        visible: false
    }

    Image {
        id: l01
        x: 322
        y: 209
        source: "img/ui/rjxx.png"
    }

    Image {
        id: l02
        x: 322
        y: 321
        source: "img/ui/fwqxx.png"
    }

    Image {
        id: l11
        x: 322
        y: 208
        source: "img/ui/slbmc.png"
        visible: false
    }

    Image {
        id: l12
        x: 322
        y: 321
        source: "img/ui/jcjl.png"
        visible: false
    }

    Image {
        id: k01
        x: 594
        y: 195
        source: "img/ui/p3t.png"
    }

    Image {
        id: k02
        x: 594
        y: 309
        source: "img/ui/p3t.png"
    }

    Label {
        id: lb1
        x: 610
        y: 218
        width: 895
        height: 33
        text: padSoftinfo
        font.pixelSize: 26
    }

    Label {
        id: lb2
        x: 610
        y: 332
        width: 895
        height: 33
        text: "192.168.6.111"
        font.pixelSize: 26
    }

    MouseArea {
        id: mousearea3
        x: 104
        y: 195
        width: 248
        height: 78
    }

    MouseArea {
        id: mousearea4
        x: 104
        y: 309
        width: 248
        height: 80
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
            fm01.visible = true
            visible = false
        }
        onPressedChanged: {
            btfh.visible = btfh.visible ? false : true
            btfhp.visible = btfhp.visible ? false : true
        }
    }

    Connections {
        target: mat01
        onClicked: {
            fm01.visible = true
            visible = false
        }
        onPressedChanged: {
            t3p.visible = t3p.visible ? false : true
            t01p.visible = t01p.visible ? false : true
        }
    }

    Connections {
        target: mousearea3
        onClicked: {
            l01.visible = true
            l02.visible = true
            l11.visible = false
            l12.visible = false
            b01p.visible = true
            b02p.visible = false

            lb1.text = padSoftinfo
            lb2.text = mw.addip()
        }
        onPressedChanged: {
            b01p.visible = b01p.visible ? false : true
            b02p.visible = b02p.visible ? false : true
        }
    }

    Connections {
        target: mousearea4
        onClicked: {
            l01.visible = false
            l02.visible = false
            l11.visible = true
            l12.visible = true
            b02p.visible = true
            b01p.visible = false

            lb1.text = tvSoftinfo
            lb2.text = qsTr("5米") //mw.myip()
        }
        onPressedChanged: {
            b02p.visible = b02p.visible ? false : true
            b01p.visible = b01p.visible ? false : true
        }
    }
}




/*##^## Designer {
    D{i:0;height:1200;width:1920}D{i:6;anchors_y:0}
}
 ##^##*/
