import QtQuick 2.4
import QtApplicationManager 1.0

LiveDemoForm {
  property var currentApplicationId

  menuItemModel: ApplicationManager
  headerText: new Date().toLocaleString(Qt.locale("en_ES"), Locale.ShortFormat)
  headerColor: Qt.darker(color, 2)
  footerColor: Qt.darker(color, 3)
  menuItemDelegate: Image {
    source: icon
    MouseArea {
      anchors.fill: parent
      onClicked: ApplicationManager.startApplication(applicationId, "documentUrl");
    }
  }
  stopAppBtn.onClicked: {
    console.log("stopApplication(" + currentApplicationId + ", false)")
    ApplicationManager.stopApplication(currentApplicationId, false);
  }

  Connections {
    target: WindowManager
    onWindowReady: {
      var appIndex = ApplicationManager.indexOfApplication(WindowManager.get(index).applicationId)
      var type = WindowManager.windowProperty(window, "type")
      console.log("SystemUI: onWindowReady [" + window + "] - index: " + index + ", appIndex: " + appIndex + ", type: " + type)

      var appContainer = windows.itemAt(appIndex)
      appContainer.visible = true
      window.parent = appContainer
      window.anchors.fill = appContainer
      WindowManager.setWindowProperty(window, "propA", 42)
      currentApplicationId = ApplicationManager.application(appIndex).id
      console.log("ApplicationManager.applicationId(" + appIndex + ") " + currentApplicationId)
      windows.visible = true
    }

    onWindowPropertyChanged: {
      console.log("SystemUI: OnWindowPropertyChanged [" + window + "] - " + name + ": " + value)
    }

    onWindowClosing: {
      console.log("SystemUI: onWindowClosing [" + window + "] - index: " + index)
      var appIndex = ApplicationManager.indexOfApplication(WindowManager.get(index).applicationId)
      if (appIndex === -1)
        appIndex = 0
      var appContainer = windows.itemAt(appIndex)
      appContainer.visible = false
      windows.visible = false
    }

    onWindowLost: {
      console.log("SystemUI: onWindowLost [" + window + "] - index: " + index)
      WindowManager.releaseWindow(window)
    }
  }
}
