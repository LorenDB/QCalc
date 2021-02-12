import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QCalc 1.0

ApplicationWindow {
    id: window

    visible: true
    width: 640
    height: 520
    title: qsTr("QCalc") + " | " + stack.currentItem.pageTitle

    header: ToolBar {

        Label {
            anchors.centerIn: parent

            text: stack.currentItem.pageTitle
        }
    }

    Drawer {
        id: drawer

        edge: Qt.LeftEdge
        height: window.height
        width: window.width * 0.5

        Keys.onBackPressed: {
            close();
            event.accepted = true;
        }

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Standard distribution")
                width: parent.width
                onClicked: {
                    if (stack.currentItem != StandardDistributionPage)
                        stack.push(standardDistributionCalc);
                    drawer.close();
                }
            }

            ItemDelegate {
                text: qsTr("License")
                width: parent.width
                onClicked: {
                    if (stack.currentItem != license)
                        stack.push(license);
                    drawer.close();
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    StackView {
        id: stack

        Keys.onBackPressed: {
            pop();
            event.accept = true;
        }

        focus: true
        anchors.fill: parent
        anchors.margins: 10
        initialItem: standardDistributionCalc
    }

    Component {
        id: standardDistributionCalc

        StandardDistributionPage {
        }
    }

    Component {
        id: license

        LicenseView {
            padding: 10
        }
    }
}
