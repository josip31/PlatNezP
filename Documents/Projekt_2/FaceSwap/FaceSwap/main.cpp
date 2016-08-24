#include <QUrl>
#include <QGuiApplication>
#include <QtQuick/QQuickView>



int main(int argv, char **args){
    QGuiApplication app(argv, args);
    QQuickView view;
    QUrl mainUrl;
    mainUrl=QUrl::fromLocalFile("Main.qml");

    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(mainUrl);
    view.show();
    return app.exec();
}
