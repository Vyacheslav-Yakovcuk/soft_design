import QtQuick 2.4
import QtQuick.Controls 1.3
import QtWebKit 3.0

Rectangle {
    property alias send: send
    property alias url: url.text
    property alias method: method.currentText
    property alias dataSend: dataSend.text
    property alias responseBody: response.text
   // property alias webView: webviewі

    width: 700
    height: 600

    Rectangle {
        id: tabBar
        width: parent.width
        height: 30
        border.color: "#d2d2d2"
        border.width: 1
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ffffff" }
            GradientStop { position: 3.0; color: "#5a5a5a" }
        }
    }

    Rectangle {
        id: workspace
        x: 0
        y: tabBar.height
        width: parent.width
        height: parent.height - this.y
        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 208
            height: parent.height
            color: "#dfdfdf"
            radius: 0
            border.width: 1
            border.color: "#7b7b7b"

            Rectangle {
                id: rectangle4
                x: 0
                y: 0
                width: parent.width
                height: 31
                color: "#696969"
            }
        }



        Rectangle {
            id: requestOptions
            x: 214
            y: 8
            width: parent.width - this.x - 8
            height: 127
            color: "#aee1a7"

            TextField {
                id: url
                x: 8
                y: 8
                width: 171
                height: 20
                placeholderText: qsTr("http://example.com")
                text: qsTr("")
            }

            ComboBox {
                id: method
                x: 8
                y: 34
                width: 76
                height: 23
                model: [ "GET", "POST", "PUT", "DELETE" ]
                activeFocusOnPress: false
            }

            Button {
                id: send
                x: 8
                y: 63
                text: qsTr("Send")
            }
        }

       /* ScrollView {
            x: 100
            y: 200
            width: 500
            height: 500
            WebView {
                id: webview
                z: 2
            }
        }*/


        TextArea {
            id: response
            x: 214
            y: 300
            width: parent.width - this.x - 8
            height: parent.height - this.y - 8
        }

        TextArea {
            id: dataSend
            x: 214
            y: 144

            width: parent.width - this.x - 8
            height: parent.height - response.height - this.y - 20
        }
    }
}
