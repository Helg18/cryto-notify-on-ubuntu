# Cryto-notify

Es un script que consume la API de coinmarketcap para enviar un 'send-notify' a la interfaz del usuario del sistema operativo


## Dependencias 

Para poder usar estos script necesitas CURL y JQ

> sudo apt-get install curl jq


## Permisos

No te olvides de darle los permisos necesarios a tus archivos, por ejemplo

> chmod +x dirname/file/script.sh 


## Crontab

Si lo prefieres puedes ponerlo en un cron 

> sudo nano /etc/crontab

*/5 * * * * developer /home/developer/.cripto/bcn.sh >/dev/null 2>&1

