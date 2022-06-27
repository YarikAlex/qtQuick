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
                icon: ":/img/witcherIcon.jpeg"
                title: "Witcher"
                genre: "Fantasy"
                author: "A. Sapkowski"
            }
            ListElement
            {
                icon: ":/img/GameOfThroneIcon.png"
                title: "Game of Throns"
                genre: "Fantasy"
                author: "J.R.R. Martin"
            }
            ListElement
            {
                icon: ":/img/IceDragonIcon.jpg"
                title: "Ice Dragon"
                genre: "Fantasy"
                author: "J.R.R. Martin"
            }
            ListElement
            {
                icon: ":/img/theHostIcon.jpg"
                title: "The Host"
                genre: "Fantasy"
                author: "S. Meyer"
            }

            ListElement
            {
                icon: ":/img/infernoIcon.jpeg"
                title: "Inferno"
                genre: "Detective"
                author: "D. Brown"
            }

            ListElement
            {
                icon: ":/img/1984Icon.jpeg"
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
                    text: qsTr("Developer: Alexander Yaroslavtcev from Saint-Petersburg")
                    font.pointSize: 10
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
                height: 60
                color: "grey"
                border.width: 1
                border.color: "black"
                MouseArea
                {
                    anchors.fill: parent

                }
                Column
                {
                    anchors.left: parent.left
                    Image
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 30
                        height: 30
                        source: icon
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Column
                {
                    anchors.left: parent.horizontalCenter
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{text: "Title:"; font.weight: Font.Bold; font.family: "Calibri"; font.pixelSize: 16}
                        Text{text: title; font.italic: true; font.family: "Calibri"; font.pixelSize: 16}
                        spacing: 10
                    }
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{text: "Author:"; font.weight: Font.Bold; font.family: "Calibri"; font.pixelSize: 16}
                        Text{text: author; font.italic: true; font.family: "Calibri"; font.pixelSize: 16}
                        spacing: 10
                    }
                }

            }

        }
    }
}
