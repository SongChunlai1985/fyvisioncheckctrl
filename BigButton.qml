
import QtQuick 2.12                                                            //TableWidget.qml
import QtQuick.Controls 2.5

Item {
    property alias clickArea: clickArea
    property string buttonText: ""
    property bool checked: true
    property bool pressed: false
    property bool checkable: true
    width: 266
    height: 265
    Image {
        id: button0
        source: "img/ui/7b.png"
        visible: !pressed || checked
    }
    Image {
        visible: pressed || !checked
        source: "img/ui/7bp.png"
    }

    Text {
        color: checked ? "#ffffffff" : "#80ffffff"
        text: buttonText
        font.pixelSize: 38
        anchors.horizontalCenter: button0.horizontalCenter
        anchors.verticalCenter: button0.verticalCenter
    }

    MouseArea {
        id:clickArea
        anchors.fill: parent
        Connections {
            onPressedChanged: {
                if(!checkable){
                    pressed = pressed ? false : true
                }
            }
        }
    }

}










/*##^## Designer {
    D{i:0;height:265;width:266}
}
 ##^##*/
