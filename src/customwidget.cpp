#include "customwidget.h"

CustomWidget::CustomWidget(QWidget *parent, QList<Shellcode> shellcodes) : QWidget(parent), shellcodes(shellcodes) {
        layout = new QVBoxLayout(this);
        m_widget = new QListWidget(this);
        layout->addWidget(m_widget);


        m_code = new QTextEdit(this);
        m_code->hide();

        m_stacked = new QStackedWidget;
        m_stacked->addWidget(m_widget);
        m_stacked->addWidget(m_code);
        layout->addWidget(m_stacked);

        m_edit = new QLineEdit(this);
        layout->addWidget(m_edit);

        m_savebutton = new QPushButton("Save", this);
        m_savebutton->hide();
        layout->addWidget(m_savebutton);
        m_backbutton = new QPushButton("Go Back", this);
        m_backbutton->hide();
        layout->addWidget(m_backbutton);
        m_button = new QPushButton("Quit", this);
        layout->addWidget(m_button);

        setLayout(this->layout);


        for(const Shellcode& shellcode : this->shellcodes) {
                m_widget->addItem(shellcode.name);
        }

        connect(m_widget, SIGNAL(itemDoubleClicked(QListWidgetItem*)), this, SLOT(itemClicked(QListWidgetItem*)));
        connect(m_edit, SIGNAL(editingFinished()), this, SLOT(updateItem()));
        connect(m_edit, &QLineEdit::textChanged, this, &CustomWidget::searchText);
        connect(m_backbutton, SIGNAL(clicked()), this, SLOT(goBack()));
        connect(m_button, SIGNAL(clicked()), qApp, SLOT(quit()));
        connect(m_savebutton, &QPushButton::clicked, this, [=]() {
                QString filePath = QFileDialog::getSaveFileName(this, "Save File", "", "Text Files (*.txt);;All Files(*)");
                if(!filePath.isEmpty()) {
                        QFile file(filePath);
                        if(file.open(QIODevice::WriteOnly | QIODevice::Text)) {
                                QTextStream out(&file);
                                out << m_code->toPlainText();
                                file.close();
                        }
                }
                        });
}

void CustomWidget::searchText(const QString& query) {
        m_widget->clear();

        for(const Shellcode& shellcode: this->shellcodes) {
                if (shellcode.name.indexOf(query, 0, Qt::CaseInsensitive) != -1) {
                        m_widget->addItem(shellcode.name);
                }
        }
}

void CustomWidget::itemClicked(QListWidgetItem *item) {
        if(item) {
                for(const Shellcode& shellcode : this->shellcodes) {
                        if (shellcode.name == item->text()) {
                                emit askShellcode(m_code, shellcode.url);
                        }
                }
        }
        this->m_backbutton->show();
        this->m_savebutton->show();
        this->m_stacked->setCurrentIndex(1);

}

void CustomWidget::goBack() {
        this->m_backbutton->hide();
        this->m_savebutton->hide();
        this->m_stacked->setCurrentIndex(0);
}

void CustomWidget::updateItem() {
        QListWidgetItem *item = m_widget->currentItem();
        if(item) {
                item->setText(m_edit->text());
        }
}

CustomWidget::~CustomWidget() {}
