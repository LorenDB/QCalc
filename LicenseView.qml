import QtQuick 2.0
import QtQuick.Controls 2.12
import QCalc 1.0

ScrollView {
    id: licenseView

    property string pageTitle: "GNU GPL version 3"

    Text {
        text: QCalc.license
    }
}
