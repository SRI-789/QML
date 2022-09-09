#include "gauge_design.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include <QtQuick>

gauge_design::gauge_design(core_widget::Widget* parent) : IExternalWidget(parent)
{

}
void gauge_design::setProperty(const QString& key, int value)
{
    if(value<=1000)
    {
        if(key == "SpeedoNeedleRotation")
        {

            emit sendToQml((value/6.25)*1.34-600,value/6.25,(value/6.25)*1.30-390);
        }

    }
    Q_UNUSED(key);
    Q_UNUSED(value);


};

Q_DECL_EXPORT
IExternalWidget* CreateExternalWidget(core_widget::Widget* parent)
{
    gauge_design  *speed = new gauge_design(parent);

    QQuickView *view = new QQuickView();
    QWidget *container = QWidget::createWindowContainer(view, speed);
    container->setMinimumSize(2000, 810);
    container->setMaximumSize(2000, 810);
    container->setFocusPolicy(Qt::TabFocus);
    view->rootContext()->setContextProperty("Gauge", speed);
    view->setSource(QUrl("qrc:/main.qml"));
    container->setParent(speed);

    return speed;
}
