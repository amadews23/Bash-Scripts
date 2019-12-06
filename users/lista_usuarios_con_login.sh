#/bin/bash
passwd -S -a | cut -d" " -f1-2 | grep P | cut -d" " -f1
