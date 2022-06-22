import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 1020
    height: 840
    visible: true
    title: qsTr("Square in circle")
    color: "green"

    Rectangle
    {
        id: mySquare
        width: 510
        height: 510
        anchors.centerIn: parent

        MouseArea
        {
            anchors.fill: parent
            onClicked: (mouse) => {
                           if(mouse.button === Qt.LeftButton)
                            mySquare.color = "yellow"
                       }
            onDoubleClicked: (mouse) => {
                                 if(mouse.button === Qt.LeftButton)
                                    inCircle.start()
                             }
        }
    }

    SequentialAnimation
    {
        id: inCircle
        PropertyAnimation
        {
            target: mySquare
            property: "radius"
            to: 250
            duration: 600
        }
    }
}
