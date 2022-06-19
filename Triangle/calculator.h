#pragma once

#include <QObject>
#include <QPoint>

class Calculator : public QObject
{
    Q_OBJECT
public:
    explicit Calculator(QObject* parent = nullptr);
    Q_INVOKABLE
    void calcArea(const QString& sideA, const QString& sideB, const QString& sideC);
    Q_INVOKABLE
    void calcSide(const QString& xA, const QString& yA, const QString& xB, const QString& yB, const QString& xC, const QString& yC);
    QString area;
    QPoint pointA;
    QPoint pointB;
    QPoint pointC;

signals:
    void calcEnd(QString& newArea);

};

