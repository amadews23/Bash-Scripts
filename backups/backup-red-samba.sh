#Creamos espejo de un recurso compartido de una maquina windows.
#lo cremos en /srv/$nombre_backup sin empaquetar ni comprimir.
#lo empaquetamos y comprimimos en /srv/backups-tar/ y conservará dos copias.
#realiza un ping para ver si la maquina esta accesible antes de empezar el proceso.
#estan ubicadas las copias en /srv/ porque podria ser un recurso compartido de la maquina linux que comparte las copias en la red, por ejemplo con samba.
#  se necesitan tres directorios: 
# "/mnt/$nombre_backup" para montar temporalmente carpeta compartida,
# "/srv/$nombre_backup" para copia espejo sin comprimir y "/srv/backups-tar" para las copias en tar.gz
#!/bin/sh
ip_pc=192.168.1.44;
nombre_backup=usuarioUno;
recurso_compartido=Documentos;
ping -c 1 $ip_pc | grep packet | if [ `awk '{print $6}'` = "0%" ] ;
then
mv /srv/backups-tar/$nombre_backup.tgz /srv/backups-tar/$nombre_backup.old.tgz;
mount.cifs //$ip_pc/$recurso_compartido /mnt/$nombre_backup -o guest,iocharset=iso8859-15,codepage=cp850 ; 
rsync -av --delete /mnt/$nombre_backup /srv/$nombre_backup/ ;
umount /mnt/$nombre_backup;
tar czfv /srv/backups-tar/$nombre_backup.tgz /srv/$nombre_backup/ ; 
else echo "maquina no encontrada u otro tipo de error en copia" ; 
exit 0 ; fi;
