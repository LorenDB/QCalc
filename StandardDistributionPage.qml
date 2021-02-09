import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QCalc 1.0

ColumnLayout {
    id: root

    property string pageTitle: "Standard Distribution"

    spacing: 10

    function round(num, places) {
        var powOfTen = Math.pow(10, places);
        return Math.round(num * powOfTen) / powOfTen;
    }

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
                text: qsTr("Sum: ") + round(StandardDistribution.sum, 2)
            }

            Label {
                text: qsTr("Sum of squares: ") + round(StandardDistribution.sumSquares, 2)
            }

            Label {
                text: qsTr("Mean: ") + round(StandardDistribution.mean, 2)
            }

            Label {
                text: qsTr("Q1: ") + round(StandardDistribution.q1, 2)
            }

            Label {
                text: qsTr("Median: ") + round(StandardDistribution.median, 2)
            }

            Label {
                text: qsTr("Q3: ") + round(StandardDistribution.q3, 2)
            }

            Label {
                text: qsTr("Outliers: ") + StandardDistribution.outliers
            }

            Label {
                text: qsTr("Mode: ") + StandardDistribution.mode
            }

            Label {
                text: qsTr("Variance: ") + round(StandardDistribution.variance, 2)
            }

            Label {
                text: qsTr("Standard deviation: ") + round(StandardDistribution.standardDeviation, 2)
            }
        }
    }
}
