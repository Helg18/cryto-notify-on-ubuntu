#!/bin/bash
eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";


# Bytecoin-bcn Url base
currency='https://api.coinmarketcap.com/v1/ticker/bytecoin-bcn/'

# Symbol
symbol="Bytecoin-bcn"

# Show msg
DISPLAY=:0 /usr/bin/notify-send -a 'Bytecoin-bcn' -u low -t 500 $(printf '%s\n' "$symbol") "USD -> "$(curl $(printf '%s\n' "$currency")  | jq -r '.[0].price_usd')