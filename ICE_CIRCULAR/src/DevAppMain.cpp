#include <QApplication>
#include <QTimer>
#include "ComplexGuage.h"

int main(int argc,  char* argv[])
{
    QApplication app(argc, argv);

    auto widget = CreateExternalWidget(nullptr);

    widget->show();

    int value = 1;

    QTimer timer;

    QObject::connect(&timer, &QTimer::timeout, [&]
    {
        widget->setProperty("SpeedoNeedleRotation", ++value);
    });

    timer.start(100);

    return QApplication::exec();
}
