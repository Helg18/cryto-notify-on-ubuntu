#!/bin/bash
eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";


# Bitcoin-bcn Url base
currency='https://api.coinmarketcap.com/v1/ticker/bitcoin/'

# Symbol
symbol="Bitcoin"

# Show msg
DISPLAY=:0 /usr/bin/notify-send -a 'bitcoin' -u low -t 500 $(printf '%s\n' "$symbol") "USD -> "$(curl $(printf '%s\n' "$currency")  | jq -r '.[0].price_usd')