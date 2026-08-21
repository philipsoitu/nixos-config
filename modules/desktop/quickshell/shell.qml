import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30
  color: "#1d2021"

  HyprlandWorkspaces {
    anchors {
      left: parent.left
      leftMargin: 4
      verticalCenter: parent.verticalCenter
    }
  }

  Text {
    id: clock
    anchors.centerIn: parent
    color: "#d4be98"
    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: 12
    font.weight: Font.Medium

    Process {
      // give the process object an id so we can talk
      // about it from the timer
      id: dateProc

      command: ["date"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: clock.text = this.text
      }
    }

    // use a timer to rerun the process at an interval
    Timer {
      // 1000 milliseconds is 1 second
      interval: 1000

      // start the timer immediately
      running: true

      // run the timer again when it ends
      repeat: true

      // when the timer is triggered, set the running property of the
      // process to true, which reruns it if stopped.
      onTriggered: dateProc.running = true
    }
  }
}
