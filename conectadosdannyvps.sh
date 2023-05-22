#!/bin/bash

while true; do
  echo "BIENVENIDO AL MENÚ PARA VER CONECTADOS"
  echo "Seleccione una opción:"
  echo "1. Ver conectados en el puerto 80"
  echo "2. Ver conectados en el puerto 443"
  echo "3. Ver conectados en el puerto 444"
  echo "4. Ver conectados en el puerto 90"
  echo "5. Salir"

  read -p "Opción: " opcion

  case $opcion in
    1)
      PSIPHON_PORT_80=$(sudo netstat -tn | awk '$4 ~ /:80$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 80 DE PSIPHON: $PSIPHON_PORT_80"
      ;;
    2)
      PSIPHON_PORT_443=$(sudo netstat -tn | awk '$4 ~ /:443$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 443 DE PSIPHON: $PSIPHON_PORT_443"
      ;;
     3)
      PSIPHON_PORT_444=$(sudo netstat -tn | awk '$4 ~ /:444$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 444 DE PSIPHON: $PSIPHON_PORT_444"
      ;;
      4)
      PSIPHON_PORT_90=$(sudo netstat -tn | awk '$4 ~ /:90$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 90 DE PSIPHON: $PSIPHON_PORT_90"
      ;;
      5)
      echo "Saliendo del script..."
      break
      ;;
    *)
      echo "Opción inválida"
      ;;
  esac

  echo
done