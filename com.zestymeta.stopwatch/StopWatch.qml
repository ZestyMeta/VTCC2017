import QtQuick 2.4

StopWatchForm {
  property var startDate
  property int mseconds: 0

  Timer {
    id: timer
    interval: 1
    repeat: true
    onTriggered: {
      mseconds++
      var d_mseconds = mseconds%100
      d_mseconds = (d_mseconds < 10 ? "0" : "") + d_mseconds
      var d_seconds = Math.floor(mseconds/100)
      d_seconds = (d_seconds < 10 ? "0" : "") + d_seconds
      var d_minutes = Math.floor(mseconds/6000)
      d_minutes = (d_minutes < 10 ? "0" : "") + d_minutes
      display = d_minutes + ":" + d_seconds + ":" + d_mseconds
    }
  }

  Connections {
    target: startButton
    onClicked: {
      startDate = new Date()
      timer.start()
    }
  }

  Connections {
    target: stopButton
    onClicked: timer.stop()
  }
}
