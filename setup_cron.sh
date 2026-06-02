#!/bin/bash
CRON_FILE="/etc/cron.d/test_cron"
CRON_TASK="*/5 * * * * root date >> /tmp/runtime.txt"

if [ "$EUID" -ne 0 ]; then
  echo "Запустите скрипт с правами sudo или root."
  exit 1
fi

echo "$CRON_TASK" > "$CRON_FILE"
chmod 644 "$CRON_FILE"
echo "Файл успешно создан."