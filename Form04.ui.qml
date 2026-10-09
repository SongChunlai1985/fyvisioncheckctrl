import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: w04
    width: 1920
    height: 1200
    property alias textField: textField
    property alias label11: label11

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
        x: 272
        y: 50
        source: "img/ui/ljdzslb.png"
    }

    Image {
        id: t3p
        visible: false
        anchors.fill: t3
        source: "img/ui/ljdzslbp.png"
    }

    TextField {
        id: textField
        x: 369
        y: 312
        width: 1012
        height: 49
        text: "192.168.6.2"
        font.pixelSize: 30
        background: Rectangle {
            color: "transparent"
            Image {
                id: userpng
                x: -38
                y: -17
                source: "img/ui/4k.png"
            }
        }
    }

    Image {
        id: bt
        x: 1404
        y: 297
        source: "img/ui/4b.png"
    }

    Image {
        id: t1
        x: 648
        y: 50
        source: "img/ui/4sdlj.png"
    }

    Image {
        id: t1p
        anchors.fill: t1
        source: "img/ui/4sdljp.png"
    }

    Image {
        id: lb1
        x: 351
        y: 241
        source: "img/ui/4ipdz.png"
    }

    Image {
        id: lb2
        x: 346
        y: 458
        source: "img/ui/4qtslb.png"
    }

    Image {
        id: k2
        x: 331
        y: 521
        source: "img/ui/4k2.png"
    }

    Image {
        id: k21
        x: 330
        y: 522
        source: "img/ui/4k21.png"
    }

    Label {
        id: label11
        x: 388
        y: 558
        width: 1004
        height: 37
        text: qsTr("条目一")
        verticalAlignment: Text.AlignVCenter
        z: 1
        font.pixelSize: 32
    }

    Label {
        id: label12
        x: 388
        y: 640
        width: 1004
        height: 37
        text: qsTr("条目二")
        verticalAlignment: Text.AlignVCenter
        z: 2
        font.pixelSize: 32
    }

    Label {
        id: label13
        x: 388
        y: 722
        width: 1004
        height: 37
        text: qsTr("条目三")
        verticalAlignment: Text.AlignVCenter
        z: 3
        font.pixelSize: 32
    }

    Label {
        id: label14
        x: 388
        y: 804
        width: 1004
        height: 37
        text: qsTr("条目四")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        z: 4
        font.pixelSize: 32
    }

    Label {
        id: label15
        x: 388
        y: 885
        width: 1004
        height: 37
        text: qsTr("条目五")
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 32
        horizontalAlignment: Text.AlignLeft
        z: 4
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
            fm05.visible = true
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
        id: mat2
        x: 3
        y: 16
        anchors.fill: t3p
    }

    MouseArea {
        id: mat3
        x: 582
        y: 50
        anchors.fill: t1p
    }

    MouseArea {
        id: mousearea3
        x: 1425
        y: 307
        width: 142
        height: 61
    }

    MouseArea {
        id: mousearea11
        x: 358
        y: 536
        width: 1209
        height: 78
    }

    MouseArea {
        id: mousearea12
        x: 358
        y: 620
        width: 1209
        height: 80
    }

    MouseArea {
        id: mousearea13
        x: 358
        y: 700
        width: 1209
        height: 82
    }

    MouseArea {
        id: mousearea14
        x: 358
        y: 779
        width: 1209
        height: 83
    }

    MouseArea {
        id: mousearea15
        x: 358
        y: 862
        width: 1209
        height: 83
    }

    Connections {
        target: mat1
        onClicked: {
            fm01.visible = true
            fm04.visible = false
            textField.enabled = false
        }
        onPressedChanged: {
            t1p.visible = t1p.visible ? false : true
            t01p.visible = t01p.visible ? false : true
        }
    }

    Connections {
        target: mat2
        onClicked: {
            fm03.visible = true
            fm04.visible = false
            textField.enabled = false
        }
        onPressedChanged: {
            t1p.visible = t1p.visible ? false : true
            t3p.visible = t3p.visible ? false : true
        }
    }

    Connections {
        target: mousearea3
        onClicked: {
            mw.setuip(textField.text)
            fm05.visible = true
            fm04.visible = false
            textField.enabled = false
        }
        onPressedChanged: {
            bt.opacity = (bt.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: mousearea11
        onClicked: {
            k21.y = 522
            textField.text = label11.text
        }
    }

    Connections {
        target: mousearea12
        onClicked: {
            k21.y = 604
            textField.text = label12.text
        }
    }

    Connections {
        target: mousearea13
        onClicked: {
            k21.y = 686
            textField.text = label13.text
        }
    }

    Connections {
        target: mousearea14
        onClicked: {
            k21.y = 768
            textField.text = label14.text
        }
    }

    Connections {
        target: mousearea15
        onClicked: {
            k21.y = 850
            textField.text = label15.text
        }
    }

    Image {
        id: t4
        x: 620
        y: 73
        source: "img/ui/ct.png"
    }
}




/*##^## Designer {
    D{i:4;anchors_x:346}
}
 ##^##*/
