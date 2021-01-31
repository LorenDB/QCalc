import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QCalc 1.0

Window {
    id: window

    visible: true
    width: 640
    height: 480
    title: qsTr("QStatistics")

    Item {
        id: rootItem

        anchors.fill: parent

        Drawer {
            id: drawer

            edge: Qt.LeftEdge
            height: rootItem.height
            width: rootItem.width * 0.5

            ColumnLayout {
                anchors.fill: parent

                Button {
                    text: qsTr("Standard distribution")
                    Layout.fillWidth: true
                    onClicked: {
                        stack.currentIndex = 0;
                        drawer.close();
                    }
                }

                Button {
                    text: qsTr("License")
                    Layout.fillWidth: true
                    onClicked: {
                        stack.currentIndex = 1;
                        drawer.close();
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

        StackLayout {
            id: stack

            anchors.fill: parent
            anchors.margins: 10
            currentIndex: 0

            ColumnLayout {
                id: standardDistributionLayout

                spacing: 10
                anchors.margins: 10

                StandardDistributionInput {
                    Layout.fillWidth: true
                }

                StandardDistributionInfo {
                    Layout.fillWidth: true
                }

                // use the rest of the space
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

            // the license
            ScrollView {
                id: licenseView

                Label {
                    padding: 10
                    text: QCalc.license
                }
            }
        }
    }
}
