#!/bin/sh

# Obtener el usuario actual
USER=$(who | grep "(:0)" | awk '{print $1}')

# Obtener el ID del usuario
USER_ID=$(id -u "$USER")

# Obtener el DBUS_SESSION_BUS_ADDRESS desde el archivo de sesión
DBUS_PATH="/run/user/$USER_ID/bus"

# Verifica si el socket de D-Bus existe
if [ -S "$DBUS_PATH" ]; then

    # Exportamos las variables del bus necesarios para el notify-send
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_PATH"
    export DISPLAY=:0

    # Definimos la cripto
    currency=bytecoin-bcn

    # Construimos la url
    endpoint=https://api.coincap.io/v2/assets/$currency

    # Ejecutar la peticion y obtener el precio
    respuesta=$(curl -s $endpoint | jq -r '.data.priceUsd')

    # Construimos el cuerpo del notify-send
    precio="Precio : $respuesta USD" # Usar comillas dobles para la expansión

    # Enviamos la notificacion al usuario
    /usr/bin/notify-send "$currency" "$precio"

# Sino enviamos un mensaje de error
else

    # Mensaje de error
    echo "Error: No se pudo encontrar el bus D-Bus para el usuario $USER."
fi