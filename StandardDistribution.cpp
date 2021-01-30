#include "StandardDistribution.h"

#include <QQmlEngine>
#include <QJSEngine>
#include <QMap>

#include <algorithm>
#include <cmath>

#include "QStatistics.h"

StandardDistribution::StandardDistribution(QObject *parent)
    : QObject{parent}
{
}

StandardDistribution::StandardDistribution(StandardDistribution &other)
    : QObject{other.parent()},
      m_dataSet{other.m_dataSet},
      m_mean{other.m_mean},
      m_mode{other.m_mode},
      m_standardDeviation{other.m_standardDeviation}
{
}

QString StandardDistribution::dataSet() const
{
    if (m_dataSet.length() == 0)
        return tr("None");

    QString dataSet;
    for (auto x : m_dataSet)
        dataSet += QString("%1, ").arg(x);
    dataSet.chop(2); // remove the final ", "
    return dataSet;
}

double StandardDistribution::range() const
{
    return (m_dataSet.length() > 0) ? m_dataSet.last() - m_dataSet.first() : 0;
}

QString StandardDistribution::outliers() const
{
    if (m_outliers.length() == 0)
        return tr("None");

    QString outliersStr;
    for (auto x : m_outliers)
        outliersStr += QString("%1, ").arg(x);
    outliersStr.chop(2);
    return outliersStr;
}

QString StandardDistribution::mode() const
{
    if (m_mode.length() == 0)
        return tr("None");
    QString modes;
    for (auto x : m_mode)
        modes += QString("%1, ").arg(x);
    modes.chop(2);
    return modes;
}

void StandardDistribution::setStandardDistribution(QString data)
{
    auto dataList = data.split(",");
    m_dataSet.clear();
    for (auto item : dataList)
        m_dataSet.push_back(item.toDouble());
    std::sort(m_dataSet.begin(), m_dataSet.end());

    // only calculate if there's stuff to calculate
    // statistics don't really work if you have only one number
    if (m_dataSet.length() > 1)
    {
        calculateSum();
        calculateMean();
        calculateMedianQ1Q3Outliers();
        calculateMode();
        calculateSumSquaresVarianceStanDev();
    }
    else
        m_dataSet.clear();

    emit dataSetChanged();
}

void StandardDistribution::calculateSum()
{
    m_sum = 0;
    for (auto x : m_dataSet)
        m_sum += x;
}

void StandardDistribution::calculateMean()
{
    double accumulator = 0;
    for (auto x : m_dataSet)
        accumulator += x;
    m_mean = accumulator / m_dataSet.length();
}

void StandardDistribution::calculateMedianQ1Q3Outliers()
{
    m_median = QStatistics::median(m_dataSet);
    m_q1 = QStatistics::median(m_dataSet.mid(0, m_dataSet.length() / 2));
    m_q3 = QStatistics::median(m_dataSet.mid(m_dataSet.length() / 2 + 1));

    m_outliers.clear();
    double iqr = m_q3 - m_q1;
    for (auto x : m_dataSet)
        if (x > m_q3 + 1.5 * iqr || x < m_q1 - 1.5 * iqr)
            m_outliers.push_back(x);
}

void StandardDistribution::calculateMode()
{
    QMap<double, int> numOccurences;
    for (auto x : m_dataSet)
        if (numOccurences.contains(x))
            ++numOccurences[x];
        else
            numOccurences[x] = 1;
    m_mode.clear();
    m_mode << m_dataSet.first();
    for (auto x : numOccurences.keys().mid(1)) // use mid to avoid adding the first element twice
        if (numOccurences[x] > numOccurences[m_mode.first()])
        {
            m_mode.clear();
            m_mode << x;
        }
        else if (numOccurences[x] == numOccurences[m_mode.first()])
            m_mode << x;

    bool noMode = true;
    int base = numOccurences[numOccurences.keys().first()]; // set the first occurence count as the base...
    for (auto x : numOccurences.keys())
    {
        if (base != numOccurences[x]) // if there are different numbers of occurences...
        {
            noMode = false; // that means there is a mode
            break;
        }
    }
    if (noMode)
        m_mode.clear(); // no mode if each element appears the same number of times
}

// this function assumes that the mean is accurate
void StandardDistribution::calculateSumSquaresVarianceStanDev()
{
    m_sumSquares = 0;
    for (auto x : m_dataSet)
        m_sumSquares += (x - m_mean) * (x - m_mean);
    m_variance = m_sumSquares / m_dataSet.length();
    m_standardDeviation = sqrt(m_variance);
}
