import QtQuick 2.12
import QtQuick.Controls 2.5
import QtMultimedia 5.12

Item {
    id: w08
    width: 1920
    height: 1200
    property alias img8k: img8k
    property alias label: label
    property alias camr: camr
    visible: true

    Image {
        id: imagebg
        visible: true
        anchors.fill: parent
        source: "img/ui/bg.png"
    }

    VideoOutput {
        id: vout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 1920 * 0.8
        height: 1080 * 0.8
        source: camr
        objectName: "VidelOutputObject"
        focus: visible // to receive focus and capture key events when visible
        filters: [Camerafilter]
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

    Image {
        id: t4
        x: 620
        y: 73
        source: "img/ui/ct.png"
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

    Image {
        id: img8k
        x: 680
        y: 507
        source: "img/ui/8k.png"
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
            camr.stop()
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

    Label {
        id: label
        x: 173
        y: 500
        width: 1537
        height: 100
        color: "#88ffffff"
        text: qsTr("扫描二维码连接视力表")
        styleColor: "#88ffffff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 32
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Camera {
        objectName: "CameraObject"
        id: camr
    }

    Connections {
        target: mat1
        onClicked: {
            fm05.visible = true
            visible = false
            camr.stop()
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
            visible = false
            camr.stop()
        }
        onPressedChanged: {
            t1p.visible = t1p.visible ? false : true
            t3p.visible = t3p.visible ? false : true
        }
    }

    Connections {
        target: Camerafilter
        onQrcode: {
            wroot.qrcode(qr, cvm4)
            //capimg.source = Camerafilter.getcvm()
        }
    }
}
