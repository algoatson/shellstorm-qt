#include "shellcode.h"

Shellcode make_shellcode(QString author, QString os, QString name, QString url) {
        return { author, os, name, url };
}
