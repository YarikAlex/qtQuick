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
                            mySquare.color = getRandomHexValue()
                       }

            onDoubleClicked: (mouse) => {
                                 if(mouse.button === Qt.LeftButton)
                                    inCircle.start()
                             }
        }
    }

    ParallelAnimation
    {
        id: inCircle
        PropertyAnimation
        {
            target: mySquare
            property: "radius"
            to: 250
            duration: 600
        }
        PropertyAnimation
        {
            target: root
            property: "color"
            to: "white"
            duration: 600
        }
    }

    function getRandomHexValue() {
        return '#' + Math.floor(Math.random() * 16777215).toString(16);
    }


}
