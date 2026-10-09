import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id: control

    property string buttontext: qsTr("Button")

    contentItem: Text {
        text: control.buttontext
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        border.color: control.down ? "#17a81a" : "#21be2b"
        border.width: 0
        radius: 30
    }
}
