import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QCalc 1.0

RowLayout {
    TextField {
        id: dataInput

        Layout.fillWidth: true
        inputMethodHints: Qt.ImhPreferNumbers
        placeholderText: qsTr("1, 2, 3, 4, 5");
        onAccepted: StandardDistribution.dataSet = text
    }

    Button {
        id: useData

        text: qsTr("Use this data set")
        onClicked: StandardDistribution.dataSet = dataInput.text
    }
}
