import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import com.vv.exampleclass 1.0

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("AreaTriangle")
    color: "#D9FCDA"

    Row
    {
        spacing: 10
        padding: 30
        anchors.horizontalCenter: parent.horizontalCenter
        Button
        {
            id: sideButton
            width: root.width/4
            background: Rectangle
            {
                color: "white"
                radius: 10
            }
            text: qsTr("Sides")
            font: sideText.font
            onClicked: sideAnimation.start()
        }
        Button
        {
            id: coordinateButton
            width: root.width/4
            background: Rectangle
            {
                color: "white"
                radius: 10
            }
            text: qsTr("Coordinates")
            font: sideText.font
            onClicked: coordinateAnimation.start()
        }
    }

    Calculator
    {
        id: sideCalculator
        onCalcEnd:
        {
            sideAnswer.clear()
            sideAnswer.insert(0, newArea + " м2")
            sideAnswerAnimation.start()
        }
    }

    Calculator
    {
        id: coordinateCalculator
        onCalcEnd:
        {
            coordinateAnswer.clear()
            coordinateAnswer.insert(0, newArea + " м2")
            coordinateAnswerAnimation.start()
        }
    }

    Rectangle
    {
        id: sideFrame
        width: root.width/2
        height: root.height/2
        anchors.centerIn: parent
        color: "white"
        radius: 20
        opacity: 0
        property color textColor: "#535353"
        Column
        {
            anchors.fill: parent
            padding: 30
            spacing: 10

            Text {
                id: sideText
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Sides of triangle")
                font.family: "Helvetica"
                font.pointSize: 12
                color: sideFrame.textColor
            }
            Row
            {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                TextField
                {
                    id: sideA
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "side A"
                    color: sideFrame.textColor
                }
                TextField
                {
                    id: sideB
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "side B"
                    color: sideFrame.textColor
                }
                TextField
                {
                    id: sideC
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "side C"
                    color: sideFrame.textColor
                }
            }

            Button
            {
                id: calulateButton
                width: parent.width/2
                height: parent.height/6
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle
                {
                    color: parent.down ? "#D9FCDA" : (parent.hovered ? "#41E6B3" : "#D9FCDA")
                    radius: 10
                }
                text: qsTr("Calculate")
                font: sideText.font
                onClicked: sideCalculator.calcArea(sideA.text, sideB.text, sideC.text)
            }

            TextEdit {
                id: sideAnswer
                text: qsTr("Text")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
                color: sideFrame.textColor
                opacity: 0
            }
        }
    }

    Rectangle
    {
        id: coordinateFrame
        width: root.width/2
        height: root.height/2
        anchors.centerIn: parent
        color: "white"
        radius: 20
        opacity: 0
        property color textColor: "#535353"
        Column
        {
            anchors.fill: parent
            padding: 20
            spacing: 10

            Text {
                id: coordinateText
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Coordinates of the vertices")
                font.family: "Helvetica"
                font.pointSize: 12
                color: sideFrame.textColor
            }
            Row
            {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                TextField
                {
                    id: xA
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "Point A: x"
                    color: sideFrame.textColor
                }
                TextField
                {
                    id: yA
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "Point A: y"
                    color: sideFrame.textColor
                }
            }
            Row
            {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                TextField
                {
                    id: xB
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "Point B: x"
                    color: sideFrame.textColor
                }
                TextField
                {
                    id: yB
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "Point B: y"
                    color: sideFrame.textColor
                }
            }
            Row
            {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                TextField
                {
                    id: xC
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "Point C: x"
                    color: sideFrame.textColor
                }
                TextField
                {
                    id: yC
                    width: sideFrame.width/4
                    height: width/3
                    placeholderText: "Point C: y"
                    color: sideFrame.textColor
                }
            }
            Button
            {
                id: calulatePointsButton
                width: parent.width/2
                height: parent.height/6
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle
                {
                    color: parent.down ? "#D9FCDA" : (parent.hovered ? "#41E6B3" : "#D9FCDA")
                    radius: 10
                }
                text: qsTr("Calculate")
                font: sideText.font
                onClicked: coordinateCalculator.calcSide(xA.text, yA.text, xB.text, yB.text, xC.text, yC.text)
            }
            TextEdit {
                id: coordinateAnswer
                text: qsTr("Answer")
                opacity: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
                color: sideFrame.textColor
            }
        }
    }


    SequentialAnimation
    {
        id: sideAnswerAnimation
        PropertyAnimation
        {
            target: sideAnswer
            property: "opacity"
            to: 100
            duration: 600
        }
    }
    SequentialAnimation
    {
        id: coordinateAnswerAnimation
        PropertyAnimation
        {
            target: coordinateAnswer
            property: "opacity"
            to: 100
            duration: 600
        }
    }


    SequentialAnimation
    {
        id: sideAnimation
        PropertyAnimation
        {
            targets: [coordinateFrame, coordinateText, xA, yA, xB, yB, xC, yC]
            property: "opacity"
            to: 0
            duration: 400
        }

        PropertyAnimation
        {
            targets: [sideFrame, sideText, sideA, sideB, sideC, calulateButton]
            property: "opacity"
            to: 100
            duration: 400
        }
    }

    SequentialAnimation
    {
        id: coordinateAnimation
        PropertyAnimation
        {
            targets: [sideFrame, sideText, sideA, sideB, sideC, calulateButton]
            property: "opacity"
            to: 0
            duration: 400
        }
        PropertyAnimation
        {
            targets: [coordinateFrame, coordinateText, xA, yA, xB, yB, xC, yC]
            property: "opacity"
            to: 100
            duration: 400
        }


    }
}
