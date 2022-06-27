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
        anchors.centerIn: parent
        color: "grey"
        radius: 20
        state: loginState

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
                //opacity: 0
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
            inputForm.state = loginState
        else
            inputForm.state = notLoggedInState
    }
}
