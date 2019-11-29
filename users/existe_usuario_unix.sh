#!/bin/bash
if id -u "$1" >/dev/null 2>&1; then 
	echo "El usuario existe" 
else 
	echo "El usuario no existe" 
fi
