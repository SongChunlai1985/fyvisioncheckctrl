import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {

    header: ToolBar {
        RowLayout {
            Button {
                text: qsTr("Home")
                enabled: false
            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        GridLayout {
            id: gridlayout
            anchors.fill: parent
            columns: 3
            rows: 3
            columnSpacing: 0
            rowSpacing: 0

            property int innerMargin: 5

            function calcPreferredWidth(numcols)
            {
                return (width / columns) * numcols;
            }

            function calcPreferredHeight(numrows)
            {
                return (height / rows) * numrows;
            }

            Rectangle {
                Layout.rowSpan: 2
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                    border.color: "black"

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter

                        text: qsTr("Announcement")
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                    border.color: "black"

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter

                        text: qsTr("Connect TV");
                        onClicked: rootstackview.push("connecttvview.qml")
                    }
                }
            }

            Rectangle {
                Layout.rowSpan: 3
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                    border.color: "black"

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter

                        //text: qsTr("Search Student")
                        text: qsTr("查找学生")
                        onClicked: rootstackview.push("searchstudent.qml")
                    }
                }
            }

            Rectangle {
                Layout.rowSpan: 2
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                    border.color: "black"

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter

                        text: qsTr("Today Checklist")
                        onClicked: rootstackview.push("todaychecklist.qml")
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                    border.color: "black"

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter

                        text: qsTr("Settings")
                        onClicked: rootstackview.push("settingsview.qml")
                    }
                }
            }
        }
    }
}
