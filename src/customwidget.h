#pragma once

#include <QtWidgets>
#include <QMap>
#include <QLineEdit>
#include <QTextEdit>
#include <QStringList>
#include <QFileDialog>
#include <QFile>
#include <QTextStream>
#include "shellcode.h"
#include "shellstormapi.h"

class CustomWidget : public QWidget {
        Q_OBJECT
public:
        explicit CustomWidget(QWidget *parent = 0, QList<Shellcode> shellcodes = {});
        ~CustomWidget();
private slots:
        void itemClicked(QListWidgetItem *item);
        void updateItem();
        void goBack();
        void searchText(const QString& query);
signals:
        void askShellcode(QTextEdit* item, const QUrl& url);
private:
        QVBoxLayout *layout;
        QStackedWidget *m_stacked;
        QListWidget *m_widget;
        QTextEdit *m_code;
        QLineEdit *m_edit;
        QPushButton *m_button;
        QPushButton *m_backbutton;
        QPushButton *m_savebutton;
        QList<Shellcode> shellcodes;
};
