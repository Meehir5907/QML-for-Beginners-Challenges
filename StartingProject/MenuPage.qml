import QtQuick
import QtQuick.Controls.Basic

Page {

    FontLoader {
        id: trebucBold
        source: Qt.resolvedUrl("./assets/fonts/Trebucbd.ttf")
    }

    header: Label {
        text: qsTr("El PAnio")

        horizontalAlignment: Text.AlignHCenter

        font {
            pointSize: 24
            family: trebucBold.name
        }

        background: Rectangle {
            color: "#55FFFFFF"
        }
    }
}
