#/bin/sh
usuario="pepe"
usuario_pass="123"
useradd $usuario -m -s /bin/bash
echo -e "$usuario_pass\n$usuario_pass" | passwd $usuario
