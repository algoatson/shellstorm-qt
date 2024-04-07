#ifndef SHELLSTORMAPI_H
#define SHELLSTORMAPI_H

#include <QObject>
#include <iostream>
#include <QString>
#include <QNetworkProxy>
#include <QStackedWidget>
#include <QTextEdit>
#include <QEventLoop>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QXmlStreamReader>

class ShellStormAPI : public QObject {
        Q_OBJECT
public:
        explicit ShellStormAPI(QObject *parent = nullptr)
                : QObject(parent), m_manager(new QNetworkAccessManager(this)) {
                        connect(m_manager, &QNetworkAccessManager::finished, this, &ShellStormAPI::replyFinished);
        }

public slots:
        void fetchShellcodes() {
                QUrl url("http://shell-storm.org/api/?s= ");
                m_manager->get(QNetworkRequest(url));
        }

        void fetchShellcode(QTextEdit* item, const QUrl& url) {
                QEventLoop loop;
                delete m_manager;
                m_manager = new QNetworkAccessManager(this);
                connect(m_manager, &QNetworkAccessManager::finished, this, &ShellStormAPI::finishFetchingShellcode);
                connect(this, &ShellStormAPI::fetchingFinished, &loop, &QEventLoop::quit);
                // QNetworkProxy proxy;
                // proxy.setType(QNetworkProxy::HttpProxy);
                // proxy.setPort(8080);
                // proxy.setHostName(QString("127.0.0.1"));
                // QNetworkProxy::setApplicationProxy(proxy);

                // QUrl
                m_manager->get(QNetworkRequest(url));
                loop.exec();
                item->setText(this->currentShellcode);
        }
signals:
        void shellcodesFetched(const QStringList &shellcodeNames);
        void errorOccured(const QString &error);
        void fetchingFinished();
private slots:
        void replyFinished(QNetworkReply *reply) {
                if (reply->error() == QNetworkReply::NoError) {
                        QByteArray responseData = reply->readAll();
                        QStringList shellcodeNames = QString(responseData).split('\n', Qt::SkipEmptyParts);
                        emit shellcodesFetched(shellcodeNames);
                } else {
                        emit errorOccured(reply->errorString());
                }
                reply->deleteLater();
        }

        QString extractPreRegex(const QString& htmlString) {
                QRegularExpression preRegex("<pre>(.*?)</pre>");
                QRegularExpressionMatch match = preRegex.match(htmlString);

                if(match.hasMatch()) {
                        return match.captured(1);
                } else {
                        return QString();
                }
        }

        void finishFetchingShellcode(QNetworkReply *reply) {
                this->currentShellcode.clear();
                reply->setReadBufferSize(0x1000);
                QByteArray bts = reply->readAll();
                QString str(bts);
                int preStart = str.indexOf("<pre>");
                int preEnd = str.indexOf("</pre>", preStart);
                if(preStart != -1 && preEnd != -1) {
                        int codeStart = preStart + QString("<pre>").length();
                        int codeLength = preEnd - codeStart;
                        currentShellcode.append(str.mid(codeStart, codeLength));
                        currentShellcode.replace("&quot;", "\"");
                        currentShellcode.replace("&gt;", ">");
                        currentShellcode.replace("&lt;", "<");
                }
                emit fetchingFinished();
                reply->deleteLater();
        }

private:
        QNetworkAccessManager *m_manager;
        QString currentShellcode;
};

#endif
