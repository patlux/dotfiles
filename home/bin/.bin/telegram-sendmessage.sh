#!/bin/sh

if [ -z ${TELEGRAM_BOT_TOKEN+x} ]; then

  echo 'missing telegram bot token'

else

  MESSAGE_TEXT=${1:-'Keine Nachricht angegeben :('}
  CHAT_ID=${2:-$TELEGRAM_CHAT_ID}

  echo "Sending to $CHAT_ID: $MESSAGE_TEXT .."

  curl -capath -X POST \
      -H "Content-Type:application/json" \
      --data "{ \"chat_id\": \"$CHAT_ID\", \"text\": \"$MESSAGE_TEXT\" }" \
      "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

fi
