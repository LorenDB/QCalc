#include "QStatistics.h"

namespace QStatistics {
double median(QList<double> data)
{
    assert(data.length() > 0);
    if (data.length() == 1)
        return data.first();
    else if (data.length() % 2 == 0) // even, so there's no middle number, so calculate one
        return (data[data.length() / 2 - 1] + data[data.length() / 2]) / 2;
    else // odd, use the middle number
        return data[data.length() / 2];
}
}
