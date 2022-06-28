import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    width: 600
    height: 400
    visible: true
    title: qsTr("My Application")
    color: "black"
    property string testLogin: "login"
    property string testPassword: "password"
    property string notLoggedInState: "red_color"
    property string loginState: "grey_color"

    Rectangle
    {
        id: inputForm
        width: parent.width/2
        height: parent.height * (2/3)
        x: width/2
        y: height/4
        color: "grey"
        radius: 20
        state: loginState
        opacity: 100
        Column
        {
            anchors.fill: parent
            padding: 40
            spacing: 30
            TextField
            {
                id: inputLogin
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/2
                height: 30
                placeholderText: qsTr("Login")
            }
            TextField
            {
                id: inputPassword
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/2
                height: 30
                echoMode: TextInput.Password
                placeholderText: qsTr("Password")
            }

            Button
            {
                id: inputSubmit
                width: parent.width/2
                height: 30
                Text {
                     text: qsTr("Submit")
                     font.family: "Helvetica"
                     font.pixelSize: 12
                     color: "white"
                     anchors.centerIn: parent
                }
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle
                {
                    color: "black"
                    radius: 20
                }
                onClicked:  checkCredentials()
            }

            Text {
                id: forgotPasswordText
                width: parent.width
                text: qsTr("Have you forgotten your password?")
                font.family: "Helvetica"
                font.pointSize: 10
            }
        }
        states:
        [
            State{
                name: notLoggedInState
                PropertyChanges {
                    target: forgotPasswordText
                    opacity: 100
                }
                PropertyChanges {
                    target: inputPassword
                    placeholderTextColor: "#ea9999"
                }
                PropertyChanges {
                    target: inputLogin
                    placeholderTextColor: "#ea9999"
                }
            },
            State{
                name: loginState
                PropertyChanges {
                    target: forgotPasswordText
                    opacity: 0
                }
            }
        ]
    }

    function checkCredentials()
    {
        if (testLogin === inputLogin.text && testPassword === inputPassword.text)
        {
            inputForm.state = loginState
            loginAcceptAnimation.start()
        }
        else
            inputForm.state = notLoggedInState
    }

    Rectangle
    {
        id: loginAcceptForm
        width: parent.width
        height: parent.height
        x: 0-width
        y: 0
        color: "lightGrey"
        opacity: 0
        radius: 20

        MouseArea
        {
            id: area
            anchors.fill: parent
            onClicked: greetingTextAnimation.start()
        }

        Column
        {
            anchors.fill: parent
            padding: 20
            spacing: 10
            Text {
                id: greetingText
                anchors.horizontalCenter: parent.horizontalCenter
                text: "You've successfully logged in"
                font.family: "Helvetica"
                font.pixelSize: 20
                opacity: 100
            }
            Text {
                id: continueText
                anchors.horizontalCenter: parent.horizontalCenter
                text: "click to continue"
                font.family: "Helvetica"
                font.pixelSize: 10
                opacity: 100
            }

            TextField
            {
                id: searchText
                width: parent.width/3
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Search")
                opacity: 0
            }
            Button
            {
                id: findButton
                width: parent.width/3
                height: 30
                Text {
                     text: qsTr("Find")
                     color: "white"
                     anchors.centerIn: parent
                     font.family: "Helvetica"
                     font.pixelSize: 12
                }
                opacity: 0
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle
                {
                    color: "black"
                    radius: 20
                }
                onClicked: {
                    busySearch.running = true
                }
            }
        }
    }

    BusyIndicator {
        id: busySearch
        anchors.centerIn: parent
        running: false
    }


    ParallelAnimation
    {
        id: loginAcceptAnimation
        PropertyAnimation
        {
            target: inputForm
            property: "opacity"
            to: 0
            duration: 1000
        }
        PropertyAnimation
        {
            target: inputForm
            property: "x"
            easing.type: Easing.InExpo
            to: width
            duration: 1000
        }
        PropertyAnimation
        {
            target: loginAcceptForm
            property: "opacity"
            to: 100
            duration: 1000
        }
        PropertyAnimation
        {
            target: loginAcceptForm
            property: "x"
            to: 0
            duration: 1000
        }
    }

    ParallelAnimation
    {
        id: greetingTextAnimation
        PropertyAnimation
        {
            targets: [greetingText, continueText]
            property: "opacity"
            to: 0
            duration: 500
        }
        PropertyAnimation
        {
            targets: [searchText, findButton]
            property: "opacity"
            to: 100
            duration: 500
        }
    }
}
