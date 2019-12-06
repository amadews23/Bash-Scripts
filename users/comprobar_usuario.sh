#!/bin/bash
if [[ $(passwd -S -a | cut -d" " -f1-2 | grep P | cut -d" " -f1 | grep $1 ) = $1 ]]; then
        echo "Es un usuario con Login"
elif [[ $(passwd -S -a | cut -d" " -f1-2 | grep L | cut -d" " -f1 | grep $1 ) = $1 ]]; then
        echo "Es un usuario de Sistema"
else
        echo "El usuario No existe"
fi
