import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Item {
    width: 600
    height: 600

    property alias display: timerText.text
    property alias startButton: button
    property alias stopButton: button1

    ColumnLayout {
        id: column
        anchors.fill: parent

        Text {
            id: timerText
            text: qsTr("00:00:00")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pointSize: 70
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        RowLayout {
            id: row
            width: 200
            height: 200

            Button {
                id: button
                text: qsTr("Start")
                Layout.fillWidth: true
            }

            Button {
                id: button1
                text: qsTr("Stop")

                Layout.fillWidth: true
            }
            Layout.fillWidth: true
        }
    }
}
