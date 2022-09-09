import QtQuick 2.0
import QtQuick.Controls 2.0


ApplicationWindow {
    id: main_window
    width: 640
    height: 480
    visible: true
    title: qsTr("Gauge")

    Connections{
        target: Gauge
        onSendToQml : {

            item1.rotation =count
            text8.text= dyntext
            root.arcEnd = arc
        }
    }

    Item{

        id:hhh
        width:1400
        height:1000
        Image {
            id: chevy_T_bg
            x: -30
            y: -6
            width:1500
            height: 800
            source: "qrc:/images/images/assets/chevy_T_bg.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: iceFull
            x: 395
            y: 107
            width: 903
            height: 600
            source: "qrc:/images/images/assets/Ice Full.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Item {
        id: item1
        x: 730
        y: 327
        width: 200
        height: 150
        rotation: -121.689

        Image {
            id: needle_Dot_White_Halo_10022021
            x: 239
            y: -170
            width: 202
            height: 161
            source: "qrc:/images/images/assets/Needle_Dot_White_Halo_10-02-2021.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: needle_bloweffect_75
            x: 220
            y: -134
            width: 70
            height: 183
            opacity: 0.1
            source: "qrc:/images/images/assets/Needle_bloweffect_75.png"
            rotation: 59.697
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: side_gauge_needle_fuel_red
            x: 67
            y: -87
            width: 374
            height: 80
            source: "qrc:/images/images/assets/side_gauge_needle_fuel_red.png"
            rotation: 150.956
            fillMode: Image.PreserveAspectFit
        }
    }

    Text {
        id: text1
        x: 840
        y: 700
        width: 46
        height: 67
        color: "#403e3e"
        text: qsTr("0")
        font.pixelSize: 50
    }

    Text {
        id: text2
        x: 673
        y: 678
        color: "#403e3e"
        text: qsTr("20")
        font.pixelSize: 50
    }

    Text {
        id: text3
        x: 532
        y: 583
        color: "#403e3e"
        text: qsTr("40")
        font.pixelSize: 50
    }

    Text {
        id: text4
        x: 488
        y: 441
        color: "#403e3e"
        text: qsTr("60")
        font.pixelSize: 50
    }

    Text {
        id: text5
        x: 488
        y: 299
        color: "#403e3e"
        text: qsTr("80")
        font.pixelSize: 50
    }

    Text {
        id: text6
        x: 527
        y: 150
        color: "#403e3e"
        text: qsTr("100")
        font.pixelSize: 50
    }

    Text {
        id: text7
        x: 660
        y: 48
        color: "#403e3e"
        text: qsTr("120")
        font.pixelSize: 50
    }

    Text {
        id: text10
        x: 787
        y: 27
        color: "#403e3e"
        text: qsTr("140")
        font.pixelSize: 50
    }

    Text {
        id: text11
        x: 957
        y: 57
        color: "#403e3e"
        text: qsTr("160")
        font.pixelSize: 50
    }

    Slider {
        id: slider
        x: 962
        y: 521
        width: 400
        height: 53
        stepSize:1
        from:0
        to:160
        value:0
        onValueChanged: Gauge.receiveFromQml(value)
    }

    Text {
        id: text8
        x: 730
        y: 308
        width: 200
        height: 167
        color: "#f8f1f1"
        text: qsTr("0")
        font.pixelSize: 100
        horizontalAlignment: Text.AlignHCenter
        font.family: "Times New Roman"
    }

    Text {
        id: text9
        x: 780
        y: 400
        color: "#f5ebeb"
        text: qsTr("MPH")
        font.pixelSize: 50
    }
}
