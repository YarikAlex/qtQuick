#include "calculator.h"
#include <math.h>
#include <QDebug>

Calculator::Calculator(QObject *parent) :  QObject{parent} {}

void Calculator::calcArea(const QString& sideA, const QString& sideB, const QString& sideC)
{
    double halfPerimetr = (sideA.toDouble() + sideB.toDouble() + sideC.toDouble())/2;
    double first = halfPerimetr - sideA.toDouble();
    double second = halfPerimetr - sideB.toDouble();
    double third = halfPerimetr - sideC.toDouble();
    if(first >= 0 && second >= 0 && third >=0)
        area = QString::number(sqrt(halfPerimetr * first * second * third));
    else
        area = "the lengths are set incorrectly";
    emit calcEnd(area);
}

void Calculator::calcSide(const QString &xA, const QString &yA, const QString &xB, const QString &yB, const QString &xC, const QString &yC)
{
    double sideA = sqrt(pow(xA.toDouble()-xB.toDouble(),2) + pow(yA.toDouble()-yB.toDouble(),2));
    double sideB = sqrt(pow(xB.toDouble()-xC.toDouble(),2) + pow(yB.toDouble()-yC.toDouble(),2));
    double sideC = sqrt(pow(xC.toDouble()-xA.toDouble(),2) + pow(yC.toDouble()-yA.toDouble(),2));
    qDebug() <<"Sides: "<< sideA << " " << sideB << " "<<sideC << " ";
    calcArea(QString::number(sideA), QString::number(sideB), QString::number(sideC));
}
