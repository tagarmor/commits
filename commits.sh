#!/bin/bash

# Conexiones telnet
for ip in 10.0.0.{1..5} 10.0.0.{8..10}
do
    echo "Conectando a $ip por telnet"
    sleep 1 # Espera 1 segundo para establecer conexión
    (
        sleep 1 # Espera 1 segundo para introducir el usuario
        echo "usuario" # Nombre de usuario
        sleep 1 # Espera 1 segundo para introducir la contraseña
        echo "contraseña" # Contraseña de acceso
    ) | telnet $ip > /var/log/commits/$ip-$(date +"%Y-%m-%d").log
done

# Conexiones SSH
for ip in 10.0.0.6 10.0.0.7
do
    echo "Conectando a $ip por SSH"
    sleep 1 # Espera 1 segundo para establecer conexión
    (
        sleep 1 # Espera 1 segundo para introducir la contraseña
        echo "contraseña" # Contraseña de acceso
    ) | ssh usuario@$ip "terminal length 0; show configuration commit changes all" > /var/log/commits/$ip-$(date +"%Y-%m-%d").log
done



Usar en crontab
0 20 * * * root /ruta/al/script.sh
