#!/bin/bash
#Comprobar paquetes
instalar_sino_esta() {
	listar_paquete=$(dpkg-query -W -f='${Package}\n' | grep $paquete | head -n 1)
	if [ "$listar_paquete" == "$paquete" ]
	then
	  echo "El paquete: $paquete, SI está instalado."
	else
	  echo -e "El paquete: $paquete, NO está instalado."
	  apt-get install $paquete -y 
	fi
}
paquete="nano"
instalar_sino_esta
