
import QtQuick 2.12                                                                                //TableWidget.qml
import QtQuick.Controls 2.5
import EasyModel 1.0                                                                               //自定义QtQuick 2中的TableView

Item {

    property int verHeaderHeight: 60                                                               //行表头-竖向的
    property int verHeaderWidth: 60

    property int horHeaderHeight: 60                                                               //列表头-横向的
    //property int horHeaderWidth: 30

    property color scrollBarColor: "#9000ffff"                                                     //滚动条   #AARRGGBB
    property int scrollBarWidth: 20
    property int crfocus: -1
    property int tablenumber: 0

    property variant columnWidthArr:[
        120, 152, 363, 306, 212, 456, 511, 384, 154, 260, 183, 153, 156,
        236, 200, 215, 264, 396, 391, 308, 365, 385, 332, 311, 450, 209,
        436, 277, 450, 256, 292, 1130, 328, 906, 333, 711, 266, 1291, 351,
        934, 369, 499, 334, 1460, 375, 1267, 343, 311, 497, 265, 859, 525,
        332, 481, 233, 431, 238, 419, 463, 274, 531, 244, 660, 643, 200,
        200, 260, 520, 260, 200, 260, 520, 260, 200, 450, 200, 450, 200, 450, 1200, 300,
        400, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
        100, 100, 100]                                                                              //列宽
    property alias table_model: table_model
    property alias header_horizontal: header_horizontal
    property alias table_view: table_view

    Connections{
        target: mw
        onQuickSelectrow:{
            selectrow(row)
            fm07.hzt = true
        }
    }

    function selectrow(row)
    {
        mw.setRow(row)
        crfocus = row
        mw.selectedRow(row)

        mw.sendCheckStudent()
        mw.sendCheckMode()
        fm07.image1.visible = false

        fm07.element5.text = mw.getStudentName()
        fm07.element6.text = mw.getGender()
        fm07.element7.text = mw.getStudentBirthday()
        fm07.element8.text = mw.getStudentClass()

        fm07.state = ""
        fm07.eleme0.text = "4.8"
        fm07.eleme1.text = "0.6"

        fm07.visible = true
        fm05.visible = false

        mw.fm07_getTable("", "", "")
    }

    EasyTableModel{
        id: table_model
    }

    TableView{                                                                                     //表格内容（不包含表头）
        id: table_view
        anchors.rightMargin: -3
        anchors.bottomMargin: 0
        anchors.leftMargin: verHeaderWidth
        anchors.topMargin: verHeaderHeight
        anchors{
            fill: parent
        }

        clip: true
        boundsBehavior: Flickable.StopAtBounds
        columnSpacing: 1
        rowSpacing: 1
        rowHeightProvider: function (row) {
            return verHeaderHeight;
        }
        columnWidthProvider: function (column) {
            return columnWidthArr[column];
        }
        ScrollBar.vertical: ScrollBar {
            id: scroll_vertical
            anchors.right: parent.right
            anchors.rightMargin: 2
            contentItem: Rectangle{
                visible: (scroll_vertical.size<1.0)
                implicitWidth: scrollBarWidth
                color: scrollBarColor
            }
        }

        ScrollBar.horizontal: ScrollBar {
            id: scroll_horizontal
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            contentItem: Rectangle{
                visible: (scroll_horizontal.size<1.0)
                implicitHeight: scrollBarWidth
                color: scrollBarColor
            }
        }
        model: table_model
        delegate:
            Rectangle{
            color: mw.rowIsSelected(tablenumber,model.row) === "1" ? "#f39999ff" : crfocus === model.row ? ("#f35566cc") : ((model.row % 2) ? "#f3e6f3fe" : "#f3dde7f0")

            TextInput {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                //elide: Text.ElideRight
                selectByMouse: true
                selectedTextColor: "black"
                selectionColor: "#ff006f00"
                text: model.value
                color: mw.getStep(model.row) === "检测完成" ? "#ff00f000" : (mw.getStep(model.row) === "计划检查" ? "#ff0000f0" : "#ff000000")
                font.pixelSize : verHeaderHeight/1.8
                onEditingFinished: {
                    model.edit=text;
                    console.log("edit",model.value)
                }
            }

            MouseArea {
                anchors.fill: parent

                onPressed: {
                    if (tablenumber == 7) {
                        return
                    }
                    if (tablenumber == 5) {
                        if(fm05.busyIndicator.visible)return
                    }
                    mw.setRow( model.row )
                    crfocus = model.row
                }

                onClicked:  {
                    if (tablenumber == 7) {
                        return
                    }

                    if (tablenumber == 5) {
                        if(fm05.busyIndicator.visible)return

                        selectrow(model.row)
                        return
                    }

                    if (tablenumber == 6) {
                        mw.setRow( model.row )
                        crfocus = model.row
                        mw.selectedRow( model.row )
                    }
                }
            }
        }
    }

    Item{
        id: header_horizontal
        anchors{
            left: parent.left
            right: parent.right
            leftMargin: verHeaderWidth
        }
        height: horHeaderHeight
        z: 2
        property int posXTemp: 0
        MouseArea{
            anchors.fill: parent
            onPressed: header_horizontal.posXTemp=mouseX;
            onPositionChanged: {
                if(table_view.contentX+(header_horizontal.posXTemp-mouseX)>0){
                    table_view.contentX+=(header_horizontal.posXTemp-mouseX);
                }else{
                    table_view.contentX=0;
                }
                header_horizontal.posXTemp=mouseX;
            }
        }
        Row {
            id: header_horizontal_row
            anchors.fill: parent
            leftPadding: -table_view.contentX
            clip: true
            spacing: 0

            Repeater {
                model: table_view.columns > 0 ? table_view.columns : 0

                Rectangle {
                    id: header_horizontal_item
                    width: table_view.columnWidthProvider(index)+table_view.columnSpacing
                    height: horHeaderHeight
                    color: "#f3009cd5"

                    Text {
                        anchors.centerIn: parent
                        color: "#f3ffffff"
                        font.pixelSize : verHeaderHeight/1.8
                        text: table_model.headerData(index, Qt.Horizontal)
                    }
                    Rectangle{
                        width: 1
                        height: parent.height
                        anchors.right: parent.right
                        color: "#f3ffffff"
                        opacity: 0.5
                    }
                    MouseArea{
                        width: 65
                        height: parent.height
                        anchors.right: parent.right
                        cursorShape: Qt.SplitHCursor
                        onPressed: header_horizontal.posXTemp=mouseX;
                        onPositionChanged: {
                            if((header_horizontal_item.width-(header_horizontal.posXTemp-mouseX))>10){
                                header_horizontal_item.width-=(header_horizontal.posXTemp-mouseX);
                            }else{
                                header_horizontal_item.width=10;
                            }
                            header_horizontal.posXTemp=mouseX;
                            columnWidthArr[index] = (header_horizontal_item.width - table_view.columnSpacing);         //刷新布局，这样宽度才会改变
                            //console.log("columnWidthArr",columnWidthArr)                         //调整列宽
                            table_view.forceLayout();
                        }
                    }
                }
            }
        }
    }

    Column {                                                                                       //竖向表头
        id: header_verical
        anchors{
            top: parent.top
            bottom: parent.bottom
            topMargin: horHeaderHeight
        }
        topPadding: -table_view.contentY
        z: 2
        clip: true
        spacing: 1
        Repeater {
            model: table_view.rows > 0 ? table_view.rows : 0
            Rectangle {
                width: verHeaderWidth
                height: table_view.rowHeightProvider(index)
                color: "#f3009cd5"
                Text {
                    anchors.centerIn: parent
                    color: "#f3ffffff"
                    text: Number(table_model.headerData(index, Qt.Vertical)) + 1
                    font.pixelSize : verHeaderHeight/1.8
                }
            }
        }
    }
}


























/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
