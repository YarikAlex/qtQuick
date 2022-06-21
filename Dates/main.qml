import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 860
    height: 640
    visible: true
    title: qsTr("Dates")
    color: "#70f7ce"

    Rectangle
    {
        id: primaryFrame
        width: root.width * (2/3)
        height: root.height *(2/3)
        anchors.centerIn: parent
        radius: 10

        Text {
            id: title
            text: qsTr("Привет! Расскажи о себе!")
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 20
            font.family: "helvetica"
        }
        Column
        {
            id: leftColumn
            anchors.right: parent.horizontalCenter
            anchors.left: parent.left
            anchors.top: title.bottom
            spacing: 10
            Label
            {
                id: nameText
                text: qsTr("Как тебя зовут?")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label
            {
                id: ageText
                text: qsTr("Сколько тебе лет?")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label
            {
                id: genderText
                text: qsTr("Пол?")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                id: findText
                text: qsTr("Кого ищешь?")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                id: cityText
                text: qsTr("Из какого ты города?")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                id: educationText
                text: qsTr("Какое образование?")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label
            {
                id: hobbyText
                text: qsTr("Хобби?")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label
            {
                id: informationText
                text: qsTr("Расскажи о себе:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

        }
        Column
        {
            id: rightColumn
            anchors.left: parent.horizontalCenter
            anchors.top: title.bottom
            spacing: 5
            TextField
            {
               id: nameField
               //anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: qsTr("Имя")
            }
            TextField
            {
               id: ageField
               //anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: qsTr("Возраст")
            }
            ComboBox
            {
                id: genderBox
                model: ["Мужской", "Женский"]
            }
            ComboBox
            {
                id: genderFindBox
                model: ["Женщину", "Мужчину"]
            }

            TextField
            {
               id: cityField
               //anchors.horizontalCenter: parent.horizontalCenter
               placeholderText: qsTr("Город")
            }
            ComboBox
            {
                id: educationBox
                model: ["Студент", "Высшее", "Доктор наук", "Еще учусь", "Уже умею"]
            }
            Row
            {
                spacing: 5
                leftPadding: 5
                CheckBox
                {
                    checked: false
                    text: qsTr("Спорт")
                }
                CheckBox
                {
                    checked: false
                    text: qsTr("Музыка")
                }
                CheckBox
                {
                    checked: false
                    text: qsTr("Кино")
                }
            }
            TextField
            {
               id: informationField
               placeholderText: qsTr("Напиши что-нибудь...")
               width: primaryFrame.width/2-10
               height: width/2
            }
        }

        Button
        {
            id: nextRound
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Далее")
            width: 100
            height: 40
        }
    }
}
