#ifndef STANDARDDISTRIBUTION_H
#define STANDARDDISTRIBUTION_H

#include <QObject>
#include <QVector>

class StandardDistribution : public QObject
{
    Q_OBJECT

public:
    StandardDistribution(QObject * = nullptr);
    StandardDistribution(StandardDistribution &);

    Q_PROPERTY(bool isValid READ isValid NOTIFY isValidChanged)
    Q_PROPERTY(QString dataSet READ dataSet WRITE setStandardDistribution NOTIFY dataSetChanged)
    Q_PROPERTY(int numDataPoints READ numDataPoints NOTIFY dataSetChanged)
    Q_PROPERTY(double range READ range NOTIFY dataSetChanged)
    Q_PROPERTY(double sum READ sum NOTIFY dataSetChanged)
    Q_PROPERTY(double sumSquares READ sumSquares NOTIFY dataSetChanged)
    Q_PROPERTY(double mean READ mean NOTIFY dataSetChanged)
    Q_PROPERTY(double q1 READ q1 NOTIFY dataSetChanged)
    Q_PROPERTY(double median READ median NOTIFY dataSetChanged)
    Q_PROPERTY(double q3 READ q3 NOTIFY dataSetChanged)
    Q_PROPERTY(QString outliers READ outliers NOTIFY dataSetChanged)
    Q_PROPERTY(QString mode READ mode NOTIFY dataSetChanged)
    Q_PROPERTY(double variance READ variance NOTIFY dataSetChanged)
    Q_PROPERTY(double standardDeviation READ standardDeviation NOTIFY dataSetChanged)

    bool isValid() const { return m_dataSet.length() > 0; }
    QString dataSet() const;
    int numDataPoints() const { return m_dataSet.length(); }
    double range() const;
    double sum() const { return m_sum; }
    double sumSquares() const { return m_sumSquares; }
    double mean() const { return m_mean; }
    double q1() const { return m_q1; }
    double median() const { return m_median; }
    double q3() const { return m_q3; }
    QString outliers() const;
    QString mode() const;
    double variance() const { return m_standardDeviation * m_standardDeviation; }
    double standardDeviation() const { return m_standardDeviation; }

    Q_INVOKABLE void setStandardDistribution(QString);

signals:
    void isValidChanged();
    void dataSetChanged();

private:
    void calculateSum();
    void calculateMean();
    void calculateMedianQ1Q3Outliers();
    void calculateMode();
    void calculateSumSquaresVarianceStanDev();

    QList<double> m_dataSet;
    double m_sum = 0;
    double m_mean = 0;
    double m_q1 = 0;
    double m_median = 0;
    double m_q3 = 0;
    QList<double> m_outliers;
    QList<double> m_mode;

    // note that this currently returns sum((x-mean)^2), not sum(x^2)
    double m_sumSquares = 0;
    double m_variance = 0;
    double m_standardDeviation = 0;
};

#endif // STANDARDDISTRIBUTION_H
