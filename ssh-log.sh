#!/bin/bash
# @contributor : Yogi Junior
# @community : Zerobyte.ID | Bash.ID

#### Setting TelegramBot ####
apikey="1308022779:AAFHFx48r3PCfBn84aW3kfJ-nmTcDfo2iLw" # Api key telegram
chatid="1322536950" # Chat id telegram
#############################

DATE_LOG=$(date "+%d %b %Y %H:%M")
LOG="/tmp/log-ssh.txt"

if [ -n "$SSH_CLIENT" ]; then
  IP=$(echo $SSH_CLIENT | awk '{ print $1}')
  PORT=$(echo $SSH_CLIENT | awk '{ print $3}')
  GETINFO=$(curl -Ls "https://whatismyipaddress.com/ip/${IP}" -A "Mozilla/5.0 buntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0")
  GETIP=$(echo $GETINFO | grep -Po '(?<=IP:</th><td>)[^<]*')
  if [ -z "$GETIP" ]; then
    # Login SSH menggunakan IP Lokal
    curl -s "https://api.telegram.org/bot${apikey}/sendMessage?chat_id=${chatid}&parse_mode=Markdown&text=^^^ NOTIFIKASI LOGIN SSH ^^^%0d%0aUser : *${USER}*%0d%0aDate : *${DA$
    echo "${IP} : ${PORT}" >> $LOG
  else
    # Login SSH menggunakan IP Publik
    CITY=$(echo $GETINFO | grep -Po '(?<=City:</th><td>)[^<]*')
    STATE=$(echo $GETINFO | grep -Po '(?<=State/Region:</th><td>)[^<]*')
    COUNTRY=$(echo $GETINFO | grep -Po '(?<=Country:</th><td>)[^<]*')
    ISP=$(echo $GETINFO | grep -Po '(?<=ISP:</th><td>)[^<]*')
    LATITUDE=$(echo $GETINFO | grep -Po '(?<=Latitude:</th><td>)[^&]*')
    LONGITUDE=$(echo $GETINFO | grep -Po '(?<=Longitude:</th><td>)[^&]*')
    curl -s "https://api.telegram.org/bot${apikey}/sendMessage?chat_id=${chatid}&parse_mode=Markdown&text=^^^ NOTIFIKASI LOGIN SSH ^^^%0d%0aUser : *${USER}*%0d%0aDate : *${DA$
    echo "${IP} : ${PORT} | ${COUNTRY}" >> $LOG
    fi
fi
