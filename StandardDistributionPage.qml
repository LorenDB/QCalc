import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QCalc 1.0

ColumnLayout {
    id: root

    property string pageTitle: "Standard Distribution"

    spacing: 10

    StandardDistributionInput {
        Layout.fillWidth: true
    }

    ScrollView {
        clip: true
        Layout.fillHeight: true
        Layout.fillWidth: true

        ColumnLayout {
            spacing: 10
            anchors.fill: parent

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
        }
    }
}
