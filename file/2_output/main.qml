import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "view"
import "logic"

ApplicationWindow {

    readonly property alias rootstackview: stackview

    id: rootwindow

    visible: true
    visibility: "AutomaticVisibility"
    width: 640
    height: 480
    title: qsTr("vision check controller")

    FontLoader {
        id: notosanssc_regular
        //source: "qrc:/font/NotoSansSC-Regular.otf"
        source: "qrc:/font/wrzht.ttf"
    }

    font: notosanssc_regular.name

    StackView {
        id: stackview
        anchors.fill: parent

        Component.onCompleted: {
            stackview.push("view/loginview.qml")
        }
    }
}
