import QtQuick 2.0
import QtQuick.Controls 2.0

Item{
    width: 2000
    height: 810
    visible: true

    Connections{
        target: Gauge
        onSendToQml : {

            item1.rotation = count
            text8.text = dyntext
            root.arcEnd = arc
        }
    }

    Item{

        id:hhh
        width:2000
        height:810
        property alias mphtext:text8.text
        Image {
            id: black_bg
            x: 0
            y: 0
            width:2000
            height: 810
            source: "qrc:/assets/assets/bg_black.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: iceFull
            x: 395
            y: 107
            width: 903
            height: 600
            source: "qrc:/assets/assets/Ice Full.png"
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
        y: 58
        color: "#403e3e"
        text: qsTr("120")
        font.pixelSize: 50
    }

    Text {
        id: text10
        x: 787
        y: 37
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
            source: "qrc:/assets/assets/Needle_Dot_White_Halo_10-02-2021.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: needle_bloweffect_75
            x: 220
            y: -134
            width: 70
            height: 183
            opacity: 0.1
            source: "qrc:/assets/assets/Needle_bloweffect_75.png"
            rotation: 59.697
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: side_gauge_needle_fuel_red
            x: 77
            y: -77
            width: 374
            height: 80
            source: "qrc:/assets/assets/side_gauge_needle_fuel_red.png"
            rotation: 147
            fillMode: Image.PreserveAspectFit
        }
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
    Item {
        id: root
        x: 550//1201//1280
        y: 90//155//230


        width: 580//624
        height: 620//620
        rotation:-20//-207.745
        opacity: 0.25
        layer.enabled: true


        property int size: 500
        property real arcBegin: -32
        property real arcEnd: -9
        property real arcOffset: 0
        property bool isPie: false
        property bool showBackground: false
        property real lineWidth: 52
        property string colorCircle: "#9A9A9A"
        property string colorBackground: "#ADD8E6"

        property alias beginAnimation: animationArcBegin.enabled
        property alias endAnimation: animationArcEnd.enabled

        property int animationDuration: 200 //-30

        onArcBeginChanged: canvas.requestPaint()
        onArcEndChanged: canvas.requestPaint()

        Behavior on arcBegin {
            id: animationArcBegin
            enabled: true

        }

        Behavior on arcEnd {
            id: animationArcEnd
            enabled: true

        }

        Canvas {
            id: canvas
            anchors.fill: parent
            rotation: -220 + parent.arcOffset  //-220




            onPaint: {
                var ctx = getContext("2d")
                // draw an image
                // ctx.drawImage('qrc:/Assets/Assets/Hex Pattern.png', 10, 10)
                var x = width / 2
                var y = height / 2
                var start = Math.PI * (parent.arcBegin / 175)
                var end = Math.PI * (parent.arcEnd / 180)
                //ctx.clip()
                ctx.reset()
                //ctx.drawImage('qrc:/Assets/Assets/Hex Pattern.png', 100, 10)




                if (root.isPie) {
                    if (root.showBackground) {
                        ctx.beginPath()
                        ctx.fillStyle = root.colorBackground
                        ctx.moveTo(x,y)
                        ctx.arc(x, y, width / 2, 0, Math.PI * 2, false)
                        ctx.lineTo(x, y)
                        ctx.fill()
                    }
                    ctx.beginPath()
                    ctx.fillStyle = root.colorCircle
                    ctx.moveTo(x, y)
                    ctx.arc(x, y, width / 2, start, end, false)
                    ctx.lineTo(x, y)
                    ctx.fill()
                } else {
                    if (root.showBackground) {
                        ctx.beginPath();
                        ctx.arc(x, y, (width / 2) - parent.lineWidth / 2, 0, Math.PI * 2, false)
                        ctx.lineWidth = root.lineWidth
                        ctx.strokeStyle = root.colorBackground
                        ctx.stroke()
                    }
                    ctx.beginPath();
                    ctx.arc(x, y, (width / 2) - parent.lineWidth / 2, start, end, false)
                    ctx.lineWidth = root.lineWidth
                    ctx.strokeStyle = root.colorCircle
                    ctx.stroke()
                }
            }



        }
    }
}

