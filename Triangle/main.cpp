#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "calculator.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Triangle/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    qmlRegisterType<Calculator>("com.vv.exampleclass", 1, 0, "Calculator");
    engine.load(url);

    return app.exec();
}
