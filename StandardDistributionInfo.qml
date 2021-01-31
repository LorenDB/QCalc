import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QCalc 1.0

Flickable {
    id: root

    ScrollBar.vertical: ScrollBar {}


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
