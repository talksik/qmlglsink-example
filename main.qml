import QtQuick 2.4
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtMultimedia 5.0

// import org.freedesktop.gstreamer.GLVideoItem 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    x: 30
    y: 30
    color: "black"

    Item {
        anchors.fill: parent

        // GstGLVideoItem {
        //     id: video
        //     objectName: "videoItem"
        //     anchors.centerIn: parent
        //     width: parent.width
        //     height: parent.height
        // }

        MediaPlayer {
            id: player
            autoPlay: true
            source: "gst-pipeline: videotestsrc ! videoconvert ! qtvideosink"
        }

        VideoOutput {
            id: output
            anchors.fill: parent
            source: player
        }

        Rectangle {
            color: "red"
            border.width: 1
            border.color: "white"
            anchors.bottomMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            width : parent.width - 100
            height: parent.height - 100
            radius: 8

            Button {
                id: button
                anchors.centerIn: parent
                text: "Play"
                onClicked: {
                  text = "Done"
                  console.log("clicked")

                    // if (video.playing) {
                    //     video.pause()
                    //     text = "Play"
                    // } else {
                    //     video.play()
                    //     text = "Pause"
                    // }
                }
            }
        }
    }
}
