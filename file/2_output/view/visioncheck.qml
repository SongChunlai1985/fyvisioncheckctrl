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
                onClicked: {
                    rootstackview.pop();
                    rootstackview.pop();
                }
            }
            Button {
                text: qsTr("Today Checklist")
                onClicked: rootstackview.pop()
            }
            Button {
                text: qsTr("Vision Check")
                enabled: false
            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10

            Rectangle {
                Layout.preferredWidth: rectangle.width * 0.4
                Layout.fillHeight: true

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 10
                    border.color: "black"

                    GridLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        columns: 4
                        rows: 3

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.right: parent.right
                                text: qsTr("Name")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.left: parent.left
                                text: qsTr("Lei Jiamin")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.right: parent.right
                                text: qsTr("Gender")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.left: parent.left
                                text: qsTr("Male")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.right: parent.right
                                text: qsTr("Student No")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.left: parent.left
                                text: qsTr("123456")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.right: parent.right
                                text: qsTr("Class")
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: parent.width / 5
                            Layout.preferredHeight: parent.height * 0.05

                            Text {
                                anchors.left: parent.left
                                text: qsTr("123")
                            }
                        }

                        Rectangle {
                            Layout.columnSpan: 4
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Label {
                                color: "#880888"
                                text: "TableView Here"

                            }
/*
                            TableView {
                                anchors.fill: parent
                                columnSpacing: 1
                                rowSpacing: 1
                                clip: true

                                model: TableModel {
                                    TableModelColumn { display: qsTr("Left Eye") }
                                    TableModelColumn { display: qsTr("Right Eye") }
                                    TableModelColumn { display: qsTr("Check Time") }

                                    rows: [
                                        {
                                            "Left Eye": "leijiamin",
                                            "Right Eye": "123456",
                                            "Check Time": "12:00AM 7/2/2020"
                                        },
                                        {
                                            "Left Eye": "leijiamin",
                                            "Right Eye": "123456",
                                            "Check Time": "12:00AM 7/2/2020"
                                        },
                                        {
                                            "Left Eye": "leijiamin",
                                            "Right Eye": "123456",
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

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout {
                    anchors.fill: parent

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.1

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("Left Eye")
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.05

                        RowLayout {
                            width: parent.width * 0.2
                            height: parent.height
                            anchors.centerIn: parent

                            Text {
                                text: qsTr("G")
                            }
                            Text {
                                text: qsTr("G")
                            }
                            Text {
                                text: qsTr("G")
                            }
                            Text {
                                text: qsTr("G")
                            }
                            Text {
                                text: qsTr("G")
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height * 0.45

                        RowLayout {
                            anchors.fill: parent

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.2
                                Layout.fillHeight: true

                                ColumnLayout {
                                    anchors.fill: parent

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: parent.height * 0.3

                                        Text {
                                            anchors.centerIn: parent
                                            text: qsTr("Log")
                                        }
                                    }

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true

                                        Text {
                                            anchors.centerIn: parent
                                            text: qsTr("5.0")
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                Text {
                                    anchors.centerIn: parent
                                    text: qsTr("E")
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.2
                                Layout.fillHeight: true

                                ColumnLayout {
                                    anchors.fill: parent

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: parent.height * 0.3

                                        Text {
                                            anchors.centerIn: parent
                                            text: qsTr("Decimal")
                                        }
                                    }

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true

                                        Text {
                                            anchors.centerIn: parent
                                            text: qsTr("1.2")
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        GridLayout {
                            anchors.fill: parent
                            columns: 2
                            rows: 4
                            columnSpacing: 0
                            rowSpacing: 0

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.preferredHeight: parent.height * 0.25

                                Rectangle {
                                    width: parent.width * 0.7
                                    height: parent.height * 0.9
                                    anchors.centerIn: parent
                                    border.color: "black"

                                    Button {
                                        anchors.centerIn: parent
                                        text: qsTr("Correct")
                                    }
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.preferredHeight: parent.height * 0.25

                                Rectangle {
                                    width: parent.width * 0.7
                                    height: parent.height * 0.9
                                    anchors.centerIn: parent
                                    border.color: "black"

                                    Button {
                                        anchors.centerIn: parent
                                        text: qsTr("Up Line")
                                    }
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.preferredHeight: parent.height * 0.25

                                Rectangle {
                                    width: parent.width * 0.7
                                    height: parent.height * 0.9
                                    anchors.centerIn: parent
                                    border.color: "black"

                                    Button {
                                        anchors.centerIn: parent
                                        text: qsTr("Wrong")
                                    }
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.preferredHeight: parent.height * 0.25

                                Rectangle {
                                    width: parent.width * 0.7
                                    height: parent.height * 0.9
                                    anchors.centerIn: parent
                                    border.color: "black"

                                    Button {
                                        anchors.centerIn: parent
                                        text: qsTr("Down Line")
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: parent.height * 0.25
                                Layout.columnSpan: 2

                                Rectangle {
                                    width: parent.width * 0.85
                                    height: parent.height * 0.9
                                    anchors.centerIn: parent
                                    border.color: "black"

                                    Button {
                                        anchors.centerIn: parent
                                        text: qsTr("Start Check")
                                    }
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.preferredHeight: parent.height * 0.25
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.preferredHeight: parent.height * 0.25

                                Rectangle {
                                    width: parent.width * 0.7
                                    height: parent.height * 0.9
                                    anchors.centerIn: parent
                                    border.color: "black"

                                    Button {
                                        anchors.centerIn: parent
                                        text: qsTr("Back")
                                    }
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.5
                                Layout.fillHeight: true
                                Layout.columnSpan: 2
                            }
                        }
                    }
                }
            }
        }
    }
}
