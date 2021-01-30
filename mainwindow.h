#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QQuickView>
#include <QQmlApplicationEngine>

#include "StandardDistribution.h"

class MainWindow : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString license READ license CONSTANT)

public:
    explicit MainWindow(QObject *parent = nullptr);
    StandardDistribution *dataSet() { return m_dataSet; }

    QString license();

signals:

private:
    StandardDistribution *m_dataSet = nullptr;
    QQuickView *m_view = nullptr;
    QQmlApplicationEngine *m_engine = nullptr;
};

#endif // MAINWINDOW_H
