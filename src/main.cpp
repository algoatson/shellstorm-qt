#include <QtGui>
#include <QApplication>
#include <QCoreApplication>
#include <QDebug>
#include <QObject>
#include <QMap>
#include <QEventLoop>
#include "shellstormapi.h"
#include "customwidget.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    ShellStormAPI api_handler;
    QList<Shellcode> shellcodes;
    QStringList parts;
    QEventLoop loop;

    QObject::connect(&api_handler, &ShellStormAPI::shellcodesFetched, [&](const QStringList &shellcodeNames) {
        foreach(const QString& str, shellcodeNames) {
            QRegularExpression re("::::");
            QStringList parts = str.split(re);
            if (parts.size() >= 4) {
                shellcodes.append(make_shellcode(parts[0].trimmed(), parts[1].trimmed(), parts[2].trimmed(), parts[4].trimmed()));
            }
        }
        loop.quit();
    });

    QObject::connect(&api_handler, &ShellStormAPI::errorOccured, [](const QString &error) {
            qDebug() << "Error occured: " << error;
            QCoreApplication::quit();
            });

    api_handler.fetchShellcodes();
    loop.exec();
    QScopedPointer<CustomWidget> widget(new CustomWidget(nullptr, shellcodes));
    widget->resize(240,120);
    widget->show();
    QObject::connect(widget.data(), &CustomWidget::askShellcode, &api_handler, &ShellStormAPI::fetchShellcode);
    return app.exec();
}
