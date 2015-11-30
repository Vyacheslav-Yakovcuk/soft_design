import QtQuick 2.4
import QtQuick.Window 2.2
import 'lib/request.js' as HTTP

Window {
    width: 700
    height: 600
    visible: true

    Workspace {
        id: ui
        anchors.fill: parent
        send.onClicked: {
            var Request = HTTP.request;
            Request.method = method;
            Request.addHeader("Content-Type", "application/json");
            Request.setBody(dataSend);
            Request.url = url;
            Request.send(function(response, success) {
                console.log(success);
                  ui.webView.loadHtml(response);
            });
        }
    }
}
