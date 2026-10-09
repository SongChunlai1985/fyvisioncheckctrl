import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    width: 1920
    height: 1200
    property alias checkBox: checkBox
    property alias textField1: textField1
    property alias textField: textField

    Image {
        id: image
        anchors.fill: parent
        source: "img/ui/bg.png"
        fillMode: Image.PreserveAspectFit
    }

    CheckBox {
        id: checkBox
        x: 1150
        y: 650
        width: 258
        height: 62
        text: qsTr("记住密码")
        font.letterSpacing: 0
        font.wordSpacing: 0
        topPadding: 6
        font.bold: false
        font.pointSize: 20
        checked: true
    }

    Image {
        id: buttonim
        x: 516
        y: 798
        source: "img/ui/login.png"
    }

    Image {
        id: buttonimp
        anchors.fill: buttonim
        source: "img/ui/login_p.png"
        visible: false
    }

    MouseArea {
        id: button1
        anchors.fill: buttonim
    }

    Image {
        id: userpng
        x: 516
        y: 290
        source: "img/ui/user.png"
    }

    TextField {
        id: textField
        x: 675
        y: 332
        width: 670
        height: 90
        placeholderText: qsTr("请输入用户名")
        color: "#FFFFFF"
        font.pixelSize: 40
        background: Rectangle {
            color: "transparent"
        }
    }

    Image {
        id: pwpng
        x: 516
        y: 464
        source: "img/ui/passwd.png"
    }

    TextField {
        id: textField1
        x: 675
        y: 504
        width: 670
        height: 90
        placeholderText: qsTr("请输入密码")
        color: "#FFFFFF"
        font.pixelSize: 40
        echoMode: TextField.Password
        background: Rectangle {
            color: "transparent"
        }
    }

    Connections {
        target: button1
        onClicked: {
            if (mw.login(textField.text, textField1.text, checkBox.checked)) {
                fm.visible = false
                fm00.visible = true
                print("clicked")
                textField.enabled = false
                textField1.enabled = false
            }
        }
        onPressedChanged: {
            buttonimp.visible = buttonimp.visible ? false : true
        }
    }
}




/*##^## Designer {
    D{i:0;height:1200;width:1920}
}
 ##^##*/
