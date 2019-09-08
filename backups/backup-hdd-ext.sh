#!/bin/sh
#Script para montar y desmontar unidad usb con particiOn NTFS
#Y realizar copia
disco=sdc1
montaje=/media/user/pendrive/
origen=/home/user/Escritorio/test/
mount /dev/$disco $montaje;
df | grep $disco | if [ `awk '{print $1}'` = "/dev/$disco" ] ;
then
echo `date`;
rsync -rltDvu --modify-window=1 --progress --delete $origen $montaje/1/;
umount /dev/$disco;
else 
echo "no se ha montado unidad y no se ha realizado copia"
exit 0;fi;
