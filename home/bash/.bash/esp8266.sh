# ---------------------------------------------------------------------------- #
#   #ESP8266
# ---------------------------------------------------------------------------- #

esp_home_path="/opt/esp-open-sdk"
sming_path="/opt/Sming/Sming"

if [ -r "$esp_home_path" ]; then
  export ESP_HOME=$esp_home_path
  export PATH="$esp_home_path/xtensa-lx106-elf/bin:${PATH}"
fi

if [ -r "$sming_path" ]; then
  export SMING_HOME=$sming_path
fi
