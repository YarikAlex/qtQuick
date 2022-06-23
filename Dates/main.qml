import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 860
    height: 640
    visible: true
    title: qsTr("Dates")
    color: "#30fc74"

    property color titleTextColor: "#07063b"
    property string personHobby: ""

    Rectangle
    {
        id: personFrame
        width: root.width * (2/3)
        height: root.height *(2/3)
        x: root.width/6
        y: root.height/6
        radius: 10
        color: "#c0fad4"

        Text {
            id: personTitle
            text: qsTr("Привет! Расскажи о себе!")
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 20
            font.family: "Helvetica"
            font.pointSize: 14
            color: root.titleTextColor
        }
        Column
        {
            id: leftColumn
            anchors.right: parent.horizontalCenter
            anchors.left: parent.left
            anchors.top: personTitle.bottom
            spacing: 10

            Label
            {
                id: nameText
                text: qsTr("Как тебя зовут?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: ageText
                text: qsTr("Сколько тебе лет?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: genderText
                text: qsTr("Пол?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }

            Label
            {
                id: cityText
                text: qsTr("Из какого ты города?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }

            Label
            {
                id: educationText
                text: qsTr("Какое образование?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: hobbyText
                text: qsTr("Хобби?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: informationText
                text: qsTr("Расскажи о себе:")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }

        }
        Column
        {
            id: rightColumn
            anchors.left: parent.horizontalCenter
            anchors.top: personTitle.bottom
            spacing: 5
            TextField
            {
               id: nameField
               placeholderText: qsTr("Имя")
               leftPadding: 5
               font.pointSize: 10
               width: 150
            }
            TextField
            {
               id: ageField
               placeholderText: qsTr("Возраст")
               leftPadding: 5
               font.pointSize: 10
               width: 150
            }
            ComboBox
            {
                id: genderBox
                model: ["Мужской", "Женский"]
                leftPadding: 5
                font.pointSize: 10
                width: 150
            }

            TextField
            {
               id: cityField
               placeholderText: qsTr("Город")
               leftPadding: 5
               font.pointSize: 10
               width: 150

            }
            ComboBox
            {
                id: educationBox
                model: ["Студент", "Высшее", "Доктор наук", "Еще учусь", "Уже умею"]
                leftPadding: 5
                font.pointSize: 10
                width: 150
            }
            Row
            {
                spacing: 5
                leftPadding: 5
                CheckBox
                {
                    id: checkSport
                    checked: false
                    text: qsTr("Спорт")
                    font.pointSize: 10
                }
                CheckBox
                {
                    id: checkMusic
                    checked: false
                    text: qsTr("Музыка")
                    font.pointSize: 10
                }
                CheckBox
                {
                    id: checkFilm
                    checked: false
                    text: qsTr("Кино")
                    font.pointSize: 10
                }
            }
            Row
            {
                spacing: 5
                leftPadding: 5
                CheckBox
                {
                    id: checkGames
                    checked: false
                    text: qsTr("Дота")
                    font.pointSize: 10
                }
                CheckBox
                {
                    id: checkProgram
                    checked: false
                    text: qsTr("Программирование")
                    font.pointSize: 10
                }
                CheckBox
                {
                    id: checkSerial
                    checked: false
                    text: qsTr("Сериалы")
                    font.pointSize: 10
                }
            }
            TextField
            {
               id: informationField
               placeholderText: qsTr("Напиши что-нибудь...")
               leftPadding: 5
               width: personFrame.width/2-10
               height: width/3
               font.pointSize: 10
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
            background: Rectangle
            {
                radius: 10
                color: "#30fc74"
            }
            font.family: "Helvetica"
            font.pointSize: 12
            onClicked: changeFrame.start()
        }
    }

    Rectangle
    {
        id: partnerFrame
        width: root.width * (2/3)
        height: root.height *(2/3)
        x: 0 - width
        y: root.height/6
        radius: 10
        color: "#c0fad4"
        Text {
            id: partnerTitle
            text: qsTr("Кого будем искать?")
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 20
            font.family: "Helvetica"
            font.pointSize: 14
            color: root.titleTextColor
        }
        Column
        {
            id: leftPartnerColumn
            anchors.right: parent.horizontalCenter
            anchors.left: parent.left
            anchors.top: partnerTitle.bottom
            spacing: 10

            Label
            {
                id: genderPartnerText
                text: qsTr("Кого ищем?")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: agePartnerText
                text: qsTr("Возраст:")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: educationPartnerText
                text: qsTr("Образование:")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
            Label
            {
                id: hobbyPartnerText
                text: qsTr("Хобби:")
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 12
            }
        }

        Column
        {
            id: rightPartnerColumn
            anchors.left: parent.horizontalCenter
            anchors.top: partnerTitle.bottom
            spacing: 5

            ComboBox
            {
                id: genderPartnerBox
                model: ["Девушку", "Парня"]
                leftPadding: 5
                font.pointSize: 10
                font.family: "Helvetica"
                width: 150
            }
            Row
            {
                spacing: 5
                leftPadding: 5

                Text
                {
                    id: startAge
                    width: 30
                    text: ageRange.first.value
                    font.pointSize: 10
                    font.family: "Helvetica"
                }

                RangeSlider
                {
                    id: ageRange
                    from: 18
                    to: 100
                    first.value: 20
                    second.value: 50
                    stepSize: 1
                    snapMode: RangeSlider.SnapAlways
                    width: 100
                }
                Text
                {
                    id: finishAge
                    width: 30
                    text: ageRange.second.value
                    font.pointSize: 10
                    font.family: "Helvetica"
                }
            }
            ComboBox
            {
                id: educationPartnerBox
                model: ["Студент", "Высшее", "Доктор наук", "Еще учится", "Уже умеет"]
                leftPadding: 5
                font.pointSize: 10
                width: 150
            }
            Row
            {
                spacing: 5
                leftPadding: 5
                CheckBox
                {
                    checked: false
                    text: qsTr("Спорт")
                    font.pointSize: 10

                }
                CheckBox
                {
                    checked: false
                    text: qsTr("Музыка")
                    font.pointSize: 10
                }
                CheckBox
                {
                    checked: false
                    text: qsTr("Кино")
                    font.pointSize: 10
                }
            }
            Row
            {
                spacing: 5
                leftPadding: 5
                CheckBox
                {
                    checked: false
                    text: qsTr("Дота")
                    font.pointSize: 10
                }
                CheckBox
                {
                    checked: false
                    text: qsTr("Программирование")
                    font.pointSize: 10
                }
                CheckBox
                {
                    checked: false
                    text: qsTr("Сериалы")
                    font.pointSize: 10
                }
            }
        }
        Button
        {
            id: registration
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Регистрация")
            width: 150
            height: 50
            background: Rectangle
            {
                radius: 20
                color: "#30fc74"
            }
            font.family: "Helvetica"
            font.pointSize: 12
            onClicked: readData()
        }
    }

    ParallelAnimation
    {
        id: changeFrame
        PropertyAnimation
        {
            target: personFrame
            property: "x"
            to: root.width
            duration: 1000
        }
        PropertyAnimation
        {
            target: partnerFrame
            property: "x"
            to: root.width/6
            duration: 1000
        }
    }

    function readData()
    {
        isCheck()
        let nameDate = "Имя: " + nameField.text + " Возраст: "+ ageField.text
        let genderData = "Пол: " + genderBox.currentText
        let cityData = "Город: " + cityField.text
        let educationData = "Образование: " + educationBox.currentText
        let hobbyData = "Хобби: " + personHobby
        let someInfo = "О себе: "+ informationField.text

        print(nameDate + " " + genderData + " " + cityData + " " + educationData + " " + hobbyData + " " +someInfo)
        print("Ищет " + genderPartnerBox.currentText + " от " + startAge.text + " до " + finishAge.text + " " + educationPartnerBox.currentText)
    }

    function isCheck()
    {
        if(checkSport.checkState === Qt.Checked)
        {
          personHobby = checkSport.text
        }
    }
}
