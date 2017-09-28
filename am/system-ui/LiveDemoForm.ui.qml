import QtQuick 2.6
import QtQuick.Layouts 1.1

Rectangle {
  width: 500
  height: 800
  color: "linen"

  property alias windows: windows
  property alias menuItemDelegate: menuItems.delegate
  property alias menuItemModel: menuItems.model
  property alias stopAppBtn: stopApplicationButton
  property alias headerColor: header.color
  property alias footerColor: footer.color
  property alias headerText: dateTimeText.text

  ColumnLayout {
    anchors.fill: parent

    Rectangle {
      id: header
      height: 70
      width: 400
      color: "black"

      Text {
        id: dateTimeText
        font.pointSize: 17
        anchors.centerIn: parent
      }
      Layout.fillWidth: true
    }

    Grid {
      id: launcher
      spacing: 10
      padding: 10
      visible: !windows.visible
      Layout.fillWidth: true
      Layout.fillHeight: true

      Repeater {
        id: menuItems
      }
    }

    Repeater {
      id: windows
      model: menuItems.model
      visible: false

      Item {
        visible: false
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
    }

    Rectangle {
      id: footer
      height: 150
      color: "black"
      Layout.fillWidth: true

      Rectangle {
        id: button
        width: 100
        height: 100
        radius: 45
        color: stopApplicationButton.pressed ? "darkred" : "red"
        anchors.centerIn: parent

        MouseArea {
          id: stopApplicationButton
          anchors.fill: parent
        }
      }
    }
  }
}
