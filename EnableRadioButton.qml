import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

RadioButton {
    id: radioButton;
    Constants {
        id: constants;
    }
    width: 400
    height: 60
    text: checked?"true":"false";
    property string textColor: "white";
    property int spacing: 12;
    property bool disabled: false;

    style: RadioButtonStyle {
        spacing: control.spacing;
        indicator: Rectangle {
            height: control.height;
            width: control.width;
            radius: height * 0.5;
            color:  {
                if (disabled) {
                    return "#e6e8ea";
                }
                else {
                    return control.checked ? constants.peterRiver : constants.wetAsphalt;
                }
            }
            Behavior on color {
                PropertyAnimation {duration: 100}
            }
            Rectangle {
                anchors.left: parent.left
                anchors.leftMargin: control.checked ? (parent.width - width-2):2 ;
                anchors.top:parent.top
                anchors.topMargin: 2
                height: parent.height-4;
                width: parent.height-4;
                radius: height * 0.5;
                color: white;
                Behavior on color {
                    PropertyAnimation {duration: 100}
                }
            }
        }

        label:  Text {
            id: txt
            width: 100
            height: 60
            color: "white"
            text: checked?"true":"false";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: constants.labelFontSize
        }
    }
}
