import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.Layouts 1.12

ApplicationWindow {
    id: wroot
    visible: true
    property alias wroot: wroot

    Component.onCompleted: {

        fm08.camr.stop()
        mw.init()
        fm.textField.text = mw.username()
        fm.textField1.text = mw.password()
        fm.checkBox.checked = mw.checked()
    }

    Timer {
        id: tmr_qr
        interval: 2000
        repeat: false
        onTriggered: {
            fm05.visible = true
            fm08.visible = false
            fm08.camr.stop()
            fm08.label.text = "";
            fm08.label.color = "#88ffffff"
            fm08.img8k.visible = false
            fm08.label.font.pixelSize = 32
        }
    }

    function qrcode(qr,cvm4){
        fm08.label.text = "识别到内容:" + qsTr(qr)
        mw.dbg(qr)
        if(mw.setIp(qr) === "已连接"){
            fm08.label.color = "#ffffffff"
            fm08.label.font.pixelSize = 35
            fm08.label.text = "扫玛连接成功:" + mw.textip()
            fm08.img8k.visible = true
            tmr_qr.start()
        }
    }

    Timer {
        id: tmr3
        interval: 3000
        repeat: false
        onTriggered: {
            //mw.on_pushButton_4_clicked();
            fm07.element12.text = "检查超时"
        }
    }

    FontLoader {
        id: wrzht
        source: "qrc:/img/ui/wrzht.ttf"
    }

    font: wrzht.name

    property double windowScale : /* 1.0 */  /* 0.5766 */ 0.6666

    MfmForm {
        id: fm
        rotation: 0
        transformOrigin: Item.TopLeft
        scale: windowScale
        visible: true
    }

    Form00 {
        id: fm00
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form01 {
        id: fm01
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form02 {
        id: fm02
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form03 {
        id: fm03
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form04 {
        id: fm04
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form05 {
        id: fm05
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form06 {
        id: fm06
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form07 {
        id: fm07
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

    Form08 {
        id: fm08
        scale: windowScale
        transformOrigin: Item.TopLeft
        visible: false
    }

}
































/*##^## Designer {
    D{i:0;autoSize:true;height:768;width:1280}
}
 ##^##*/
