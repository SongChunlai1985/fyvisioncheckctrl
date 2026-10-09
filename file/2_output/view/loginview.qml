import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {

    Connections {
        target: LoginHandler

        function onSignalLoginSucceeded() {
            rootstackview.push("homeview.qml");
        }
    }

    Rectangle {
        id: rectangle
        width: parent.width * 0.3
        height: parent.height * 0.7

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Label {
                text: qsTr("Username")
            }

            TextField {
                id: username
                text: qsTr("")
                placeholderText: qsTr("Please input your username")
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Password")
            }

            TextField {
                id: password
                text: qsTr("")
                placeholderText: qsTr("Please input your password")
                echoMode: TextInput.Password
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("")
            }

            Button {
                text: qsTr("Login")
                onClicked: {
                    rootstackview.push("homeview.qml");
                    //LoginHandler.slotLogin(username.text, password.text)
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
