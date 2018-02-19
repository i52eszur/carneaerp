#!/bin/bash
# -*- ENCODING: UTF-8 -*-

echo "Comienza la Desinstalacion del programa."
usuario=$(whoami)
ruta="/home/"$usuario"/carnea"
$(rm -rf $ruta)
echo "Software Desinstalado."
exit
