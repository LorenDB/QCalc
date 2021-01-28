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
            interactive: true

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
            currentIndex: 0

            ColumnLayout {
                id: rootLayout

                anchors.fill: parent
                spacing: 10
                anchors.margins: 10

                StandardDistributionInput {
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Sorted data: ") + StandardDistribution.dataSet
                }

                Label {
                    text: qsTr("Number of data points: ") + StandardDistribution.numDataPoints
                }

                Label {
                    text: qsTr("Range: ") + StandardDistribution.range
                }

                Label {
                    text: qsTr("Sum: ") + StandardDistribution.sum
                }

                Label {
                    text: qsTr("Sum of squares: ") + StandardDistribution.sumSquares
                }

                Label {
                    text: qsTr("Mean: ") + StandardDistribution.mean
                }

                Label {
                    text: qsTr("Q1: ") + StandardDistribution.q1
                }

                Label {
                    text: qsTr("Median: ") + StandardDistribution.median
                }

                Label {
                    text: qsTr("Q3: ") + StandardDistribution.q3
                }

                Label {
                    text: qsTr("Outliers: ") + StandardDistribution.outliers
                }

                Label {
                    text: qsTr("Mode: ") + StandardDistribution.mode
                }

                Label {
                    text: qsTr("Variance: ") + StandardDistribution.variance
                }

                Label {
                    text: qsTr("Standard deviation: ") + StandardDistribution.standardDeviation
                }

                // use the rest of the space
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

            // the license
            ScrollView {
                anchors.fill: parent

                Label {
                    padding: 10
                    text: QCalc.license
                }
            }
        }
    }
}
