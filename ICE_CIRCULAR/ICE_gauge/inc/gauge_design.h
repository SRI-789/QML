#ifndef GAGUE_DESIGN_H
#define GAGUE_DESIGN_H
#include <CoreWidget/IExternalWidget.h>
#include <CoreWidget/Widget.h>
#include <QObject>


class gauge_design : public IExternalWidget
{
    Q_OBJECT
public:
    gauge_design() = delete;

    explicit gauge_design(core_widget::Widget* parent);

    ~gauge_design() override = default;

    void setProperty(const QString& key, int value) override;

signals:
    void sendToQml(double count,int  dyntext,double arc);
public slots:

private:
    double counter{30};
};
#endif
