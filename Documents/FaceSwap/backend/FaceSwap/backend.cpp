#include <QtQml>
#include <QtQml/QQmlContext>
#include "backend.h"
#include "mytype.h"

void BackendPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("FaceSwap"));

    qmlRegisterType<MyType>(uri, 1, 0, "FaceSwapLogic");
}

void BackendPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}
