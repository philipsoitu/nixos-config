import Quickshell
import Quickshell.Hyprland
import QtQuick

Row {
  spacing: 2

  Repeater {
    model: ScriptModel {
      values: Hyprland.workspaces.values.filter(
        workspace => workspace.active || workspace.toplevels.values.length > 0
      )
    }

    delegate: Rectangle {
      required property var modelData

      implicitWidth: workspaceLabel.implicitWidth + 16
      implicitHeight: 22
      radius: 4
      color: modelData.active ? "#ddc7a1" : "#303536"
      border.color: modelData.active ? "#c7ab7a" : "#434a4c"
      border.width: 2

      Text {
        id: workspaceLabel

        anchors.centerIn: parent
        text: modelData.name
        color: modelData.active ? "#1d2021" : "#c7ab7a"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 12
        font.weight: Font.Medium
      }

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: modelData.activate()
      }
    }
  }
}
