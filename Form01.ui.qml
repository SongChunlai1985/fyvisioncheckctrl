import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: w01
    width: 1920
    height: 1200
    property alias img1l: img1l
    property alias i04: i04
    property alias i05: i05
    property alias i03: i03
    property alias i02: i02
    property alias i01: i01

    Image {
        id: image
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
    }

    MouseArea {
        id: mat01
        anchors.fill: t01
        Connections {
            onClicked: {
                fm01.visible = false
                fm00.visible = true
            }
            onPressedChanged: {
                t01p.visible = !t01p.visible
            }
        }
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
        id: i01
        x: 90
        y: 160
        source: "img/ui/01.png"
    }
    MouseArea {
        id: ma01
        x: 90
        y: 139
        anchors.fill: i01
    }

    Image {
        id: i03
        x: 1238
        y: 160
        source: "img/ui/03.png"
    }

    MouseArea {
        id: ma03
        anchors.fill: i03
    }

    Image {
        id: i05
        x: 759
        y: 160
        source: "img/ui/05.png"
    }

    MouseArea {
        id: ma05
        anchors.fill: i05
    }

    Image {
        id: i04
        x: 1238
        y: 562
        source: "img/ui/04.png"
    }

    MouseArea {
        id: ma04
        anchors.fill: i04
    }

    Image {
        id: i02
        x: 90
        y: 850
        source: "img/ui/02.png"
    }

    Image {
        id: img1l
        x: 1746
        y: 201
        source: "img/ui/1l.png"
        visible: false
    }

    MouseArea {
        id: ma02
        anchors.fill: i02
    }

    Image {
        id: image1
        x: -352
        y: 549
        width: 800
        height: 60
        visible: false
        rotation: -90
        fillMode: Image.PreserveAspectFit
        source: ""
    }

    Connections {
        target: mw
        onSoundImageArrive: {
            image1.source = soundImage
        }
    }

    Connections {
        target: ma01
        onClicked: {
            print("clicked")
        }
        onPressedChanged: {
            i01.opacity = (i01.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ma02
        onClicked: {
            fm01.visible = false
            fm02.visible = true
        }
        onPressedChanged: {
            i02.opacity = (i02.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ma03
        onClicked: {
            fm01.visible = false
            fm03.visible = true
        }
        onPressedChanged: {
            i03.opacity = (i03.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ma04
        onClicked: {
            fm01.visible = false
            fm05.visible = true

            fm05.busyIndicator.visible = true
            mw.fm05_ab1_onClicked()
        }
        onPressedChanged: {
            i04.opacity = (i04.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ma05
        onClicked: {
            fm01.visible = false
            fm06.visible = true
            fm06.textField.enabled = true
            fm06.textField1.enabled = true
            fm06.textField2.enabled = true

            fm06.textField.focus = false
            fm06.textField1.focus = false
            fm06.textField2.focus = false

            fm06.busyIndicator.visible = true
            mw.fm06_ab1_onClicked("", "", "", "", "", "", "", "空")
        }
        onPressedChanged: {
            i05.opacity = (i05.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: mat02
        onClicked: {
            mw.dbg("debug ok")
        }
        onPressedChanged: {
            t02p.visible = t02p.visible ? false : true
            t01p.visible = t01p.visible ? false : true
        }
    }

    Connections {
        target: mw
        onTcpConnected: {
            img1l.visible = true
        }
    }

    Connections {
        target: mw
        onTcpDisConnected: {
            img1l.visible = false
        }
    }
}




/*##^## Designer {
    D{i:0;autoSize:true;height:1200;width:1920}
}
 ##^##*/
