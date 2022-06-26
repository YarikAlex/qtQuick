import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    width: 450
    height: 680
    visible: true
    title: qsTr("Library")

    Item {
        width: parent.width
        height: parent.height
        ListModel
        {
            id: books
            ListElement
            {
                icon: ""
                title: "Witcher"
                genre: "Fantasy"
                author: "A. Sapkowski"
            }
            ListElement
            {
                icon: ""
                title: "Game of Throns"
                genre: "Fantasy"
                author: "J.R.R. Martin"
            }
            ListElement
            {
                icon: ""
                title: "Ice Dragon"
                genre: "Fantasy"
                author: "J.R.R. Martin"
            }
            ListElement
            {
                icon: ""
                title: "The Host"
                genre: "Fantasy"
                author: "S. Meyer"
            }

            ListElement
            {
                icon: ""
                title: "Inferno"
                genre: "Detective"
                author: "D. Brown"
            }

            ListElement
            {
                icon: ""
                title: "1984"
                genre: "Anti-utopia"
                author: "D. Orwell"
            }

        }

        ListView
        {
            id: listBooks
            anchors.fill: parent
            model: books
            header: Rectangle
            {
                width: parent.width
                height: 30
                color: "black"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("My library. Books that I recommend")
                    font.pointSize: 12
                    color: "white"
                }
            }
            footer: Rectangle
            {
                width: parent.width
                height: 30
                color: "black"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("FOOTER")
                    font.pointSize: 12
                    color: "white"
                }
            }
            section.delegate: Rectangle
            {
                width: parent.width
                height: 20
                color: "darkRed"
                Text {
                    anchors.centerIn: parent
                    text: section
                    font.pointSize: 12
                    color: "white"
                }
            }
            section.property: "genre"
            delegate: Rectangle
            {
                width: listBooks.width
                height: 50
                color: "grey"
                border.width: 1
                border.color: "black"
                MouseArea
                {
                    anchors.fill: parent
                }
                Column
                {
                    anchors.fill: parent
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{text: "Title:"; font.weight: Font.Bold; font.family: "Calibri"; font.pixelSize: 16}
                        Text{text: title; font.italic: true; font.family: "Calibri"; font.pixelSize: 16}
                        spacing: 20
                    }
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{text: "Author:"; font.weight: Font.Bold; font.family: "Calibri"; font.pixelSize: 16}
                        Text{text: author; font.italic: true; font.family: "Calibri"; font.pixelSize: 16}
                        spacing: 20
                    }
                }

            }

        }
    }
}
