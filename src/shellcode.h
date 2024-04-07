#ifndef SHELLCODE_H
#define SHELLCODE_H

#pragma once

#include <QString>

typedef struct {
        QString author;
        QString os;
        QString name;
        QString url;
} Shellcode;

Shellcode make_shellcode(QString author, QString os, QString name, QString url);

#endif
