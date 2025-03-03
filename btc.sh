#!/bin/bash

# define currency
currency=bitcoin

# build url
endpoint=https://api.coincap.io/v2/assets/$currency

# make request and get price
respuesta=$(curl -s $endpoint | jq -r '.data.priceUsd')

# build message to send notify
precio="Precio: $respuesta USD" # Usar comillas dobles para la expansión

# sending notify to screen
/usr/bin/notify-send "$currency" "$precio"