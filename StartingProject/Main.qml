// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {

    id: root
    height: 480
    width: 1.586*height

    visible: true
    title: qsTr("Business Card")

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

    Rectangle {
        border.width: 2
        
        anchors {
            fill : parent
            margins: 15
        }

        Rectangle {
            anchors {
               fill : parent
               margins: 10
            }
           
            Text {
                visible: true
                id: u_name
                text: myContactInfo.name 
                font {
                    pointSize: root.width/20
                    bold: true
                    capitalization: Font.AllUppercase
                }
            }

            Rectangle {
                border.width: 2
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
                anchors.top: u_name.bottom
                spacing: 4

                Text {
                    id: u_addr
                    text: myContactInfo.address
                    font.pointSize: root.height/30
                }

                Text {
                    id: u_country
                    text: myContactInfo.country
                    font.pointSize: root.height/30
                }

                Text {
                    id: u_phone
                    text: myContactInfo.phone
                    font.pointSize: root.height/40
                }

                Text {
                    id: u_email
                    text: myContactInfo.email
                    font.pointSize: root.height/40
                }

                Text {
                    id: u_website
                    text: myContactInfo.webSite
                    font.pointSize: root.height/40
                }
            }
        }
    }
}
