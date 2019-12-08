#!/bin/bash
if [[ $(/etc/init.d/$1 status | grep 'active (running)' | cut -d" " -f5-6 ) = "active (running)" ]]; then
        echo "El servicio esta iniciado."
else
	echo "El servicio no esta iniciado."
fi
