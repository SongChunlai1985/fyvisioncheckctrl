import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.qmlmodels 1.0

Page {
    header: ToolBar {
        RowLayout {
            spacing: 0

            Button {
                text: qsTr("Home")
                onClicked: rootstackview.pop()
            }
            Button {
                text: qsTr("Search Student")
                enabled: false
            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: rectangle.height * 0.2

                RowLayout {
                    anchors.fill: parent

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: parent.width / 4

                        RowLayout {
                            anchors.fill: parent

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.3
                                Layout.fillHeight: true

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    text: qsTr("Name")
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                TextField {
                                    id: searchname
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width * 0.95
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: parent.width / 4

                        RowLayout {
                            anchors.fill: parent

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.3
                                Layout.fillHeight: true

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    text: qsTr("Class")
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                TextField {
                                    id: searchclass
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width * 0.95
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: parent.width / 4

                        RowLayout {
                            anchors.fill: parent

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.3
                                Layout.fillHeight: true

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    text: qsTr("School")
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                TextField {
                                    id: searchschool
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width * 0.95
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: parent.width / 4

                        Button {
                            anchors.centerIn: parent
                            text: qsTr("Search")
                        }
                    }

                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Label{
                    anchors.fill: parent
                    color: "#888888"
                    text :"TableView"
                }
/*
                TableView {
                    anchors.fill: parent
                    columnSpacing: 1
                    rowSpacing: 1
                    clip: true

                    model: TableModel {
                        TableModelColumn { display: qsTr("Name") }
                        TableModelColumn { display: qsTr("Student No") }
                        TableModelColumn { display: qsTr("Class") }
                        TableModelColumn { display: qsTr("Vision") }
                        TableModelColumn { display: qsTr("Check Time") }

                        rows: [
                            {
                                "Name": "leijiamin",
                                "Student No": "123456",
                                "Class": "1",
                                "Vision": "1.2/1.5",
                                "Check Time": "12:00AM 7/2/2020"
                            },
                            {
                                "Name": "leijiamin",
                                "Student No": "123456",
                                "Class": "1",
                                "Vision": "1.2/1.5",
                                "Check Time": "12:00AM 7/2/2020"
                            },
                            {
                                "Name": "leijiamin",
                                "Student No": "123456",
                                "Class": "1",
                                "Vision": "1.2/1.5",
                                "Check Time": "12:00AM 7/2/2020"
                            }
                        ]
                    }

                    delegate: Rectangle {
                        border.width: 1

                        Text {
                            text: display
                            anchors.centerIn: parent
                        }
                    }
                }
                */
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
