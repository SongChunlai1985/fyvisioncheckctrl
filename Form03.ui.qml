import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: w03
    width: 1920
    height: 1200

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
        anchors.fill: t3
        source: "img/ui/ljdzslbp.png"
    }

    Image {
        id: i01
        x: 329
        y: 400
        source: "img/ui/3smlj.png"
    }

    Image {
        id: i03
        x: 982
        y: 400
        source: "img/ui/3sdlj.png"
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
        id: mat01
        anchors.fill: t01
    }

    MouseArea {
        id: ma01
        anchors.fill: i01
    }

    MouseArea {
        id: ma03
        anchors.fill: i03
    }

    Connections {
        target: mat01
        onClicked: {
            fm01.visible = true
            fm03.visible = false
        }
        onPressedChanged: {
            t3p.visible = t3p.visible ? false : true
            t01p.visible = t01p.visible ? false : true
        }
    }

    Connections {
        target: ma03
        onClicked: {
            fm04.visible = true
            fm04.textField.enabled = true
            fm03.visible = false
            fm04.label11.text = mw.addip()
            fm04.textField.text = mw.textip()
        }
        onPressedChanged: {
            i03.opacity = (i03.opacity == 0.3) ? 1.0 : 0.3
        }
    }

    Connections {
        target: ma01
        onClicked: {
            fm08.visible = true
            fm08.camr.start()
            fm03.visible = false
        }
        onPressedChanged: {
            i01.opacity = (i01.opacity == 0.3) ? 1.0 : 0.3
        }
    }
}




/*##^## Designer {
    D{i:0;height:1200;width:1920}
}
 ##^##*/
