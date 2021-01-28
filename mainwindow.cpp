#include "mainwindow.h"

#include <QQmlEngine>
#include <QJSEngine>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQuickView>
#include <QFile>

#include "StandardDistribution.h"

MainWindow::MainWindow(QObject *parent)
    : QObject(parent),
      m_dataSet{new StandardDistribution{this}},
      m_engine{new QQmlApplicationEngine}
{
    static auto self = this;
    qmlRegisterSingletonType<MainWindow>("QCalc", 1, 0, "QCalc", [](QQmlEngine *, QJSEngine *) -> QObject * {
        return self;
    });
    qmlRegisterSingletonType<StandardDistribution>("QCalc", 1, 0, "StandardDistribution", [](QQmlEngine *, QJSEngine *) -> QObject * {
        return self->dataSet();
    });

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(m_engine, &QQmlApplicationEngine::objectCreated,
                     qApp, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    m_engine->load(url);
    m_view = new QQuickView{m_engine, nullptr};
}

QString MainWindow::license()
{
    QFile licenseFile{":/LICENSE"};
    if (licenseFile.open(QFile::ReadOnly))
    {
        return QString{licenseFile.readAll()};
    }
    else
        return tr("License couldn't be accessed. The license is available <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">here</a>.");
}
