import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {
    header: ToolBar {
        RowLayout {
            spacing: 0

            Button {
                text: qsTr("Home")
                onClicked: rootstackview.pop()
            }
            Button {
                text: qsTr("Connect TV")
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
            columns: 4
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
                Layout.columnSpan: 4
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                }
            }

            Rectangle {
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
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

                        text: qsTr("Scan QR-Code")
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

                        text: qsTr("Manual Connect")
                        onClicked: rootstackview.push("manualconnectview.qml")
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                }
            }

            Rectangle {
                Layout.columnSpan: 4
                Layout.preferredWidth: gridlayout.calcPreferredWidth(Layout.columnSpan)
                Layout.preferredHeight: gridlayout.calcPreferredHeight(Layout.rowSpan)

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: gridlayout.innerMargin
                }
            }
        }
    }
}
