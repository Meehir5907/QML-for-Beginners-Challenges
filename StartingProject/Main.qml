// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {

    id: root
    height: 480
    width: 1.586*height

    visible: true
    title: qsTr("Business Card")

    QtObject {
        id: appTheme
        property color mainText: Qt.rgba(0.1, 0.1, 0.1, 1.0)
        property color btnFill: Qt.rgba(0.2, 0.5, 0.8, 1.0)
        property color btnText: Qt.rgba(1.0, 1.0, 1.0, 1.0)
        property color linkText: Qt.rgba(0.0, 0.4, 0.8, 1.0)
    }

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides the properties to fill in.
        // You can create as many instances of this as you like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company

        // Detailed Info properties:
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }

    ContactInfo {
        id: myContactInfo

        // this is one example instance of a ContactInfo inline Component
        // showing how the properties are populated.

        name: "Your Name"
        photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "QML Enthusiast"
        company: "Indie Soft"
        address: "Candy Cane Lane"
        country: "North Pole"
        phone: "+01 2345 567 890"
        email: "email@server.com"
        webSite: Qt.url("https://www.qt.io")
    }

    /* Your solution should contain these key features:

        - A Text element for each of the ContactInfo properties.
        - The name and photo image should be shown all the time.
        - These should be grouped into two categories "Basic Info" and "Details".
        - Create a button using a MouseArea or TapHandler that can be used to
          toggle between showing the two categories of information.
        - Use a larger font size for the name
    */

    component TitleText: Text {
        color: appTheme.mainText
        font {
            pointSize: root.width / 20
            bold: true
            capitalization: Font.AllUppercase
        }
    }

    component HeadingText: Text {
        color: appTheme.mainText
        font {
            pointSize: root.height / 30
            bold: true
        }
    }

    component BodyText: Text {
        color: appTheme.mainText
        font {
            pointSize: root.height / 40
        }
    }

    component CardBtn: Rectangle {
        id: btnContainer
    
        property alias labelText: btnTextElement.text
        signal clicked()

        radius: root.height / 12
        border.width: 1
        color: appTheme.btnFill
        height: 0.1 * root.height
        width: 3.142857 * height

        Text {
            id: btnTextElement
            anchors.centerIn: parent
            color: appTheme.btnText
            font.pointSize: root.height / 42
        }

        MouseArea {
            anchors.fill: parent
            onClicked: btnContainer.clicked()
        }
    }

    Rectangle {
        border.width: 2
        radius: root.height/96
        
        anchors {
            fill : parent
            margins: 15
        }

        Rectangle {
            radius: root.height/96
            anchors {
               fill : parent
               margins: 10
            }
           
            TitleText {
                visible: true
                id: u_name
                text: myContactInfo.name 
            }

            Rectangle {
                border.width: 2
                radius: root.height/96
                width: 0.313*parent.width
                height: 0.313*parent.width
                anchors.right: parent.right
                Image {
                    source: "IDPhoto.png"
                    anchors {
                        fill: parent
                        margins: 5
                    }
                    fillMode: Image.PreserveAspectFit
                }
            }

            Column {
                id: details
                visible: false
                anchors.top: u_name.bottom
                spacing: 4

                HeadingText {
                    id: u_addr
                    text: myContactInfo.address
                }

                HeadingText {
                    id: u_country
                    text: myContactInfo.country
                }

                BodyText {
                    id: u_phone
                    text: myContactInfo.phone
                }

                BodyText {
                    id: u_email
                    text: myContactInfo.email
                }

                BodyText {
                    id: u_website
                    text: myContactInfo.webSite
                    color: appTheme.linkText

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Qt.openUrlExternally(myContactInfo.webSite)
                    }
                }
            }

            CardBtn {
                anchors {
                    left: parent.left
                    bottom: parent.bottom
                }
                labelText: "Details"
                onClicked: details.visible = !details.visible
            }
        }
    }
}
