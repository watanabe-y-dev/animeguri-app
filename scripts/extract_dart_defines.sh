#!/bin/bash

OUTPUT_FILE="${SRCROOT}/Flutter/Defines.xcconfig"

: >"${OUTPUT_FILE}"

function entry_decode() { echo "${*}" | base64 --decode; }

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"; do
  item=$(entry_decode "${define_items[$index]}")
  lower_item=$(echo "$item" | tr '[:upper:]' '[:lower:]')
  if [[ $lower_item != flutter* ]]; then
    echo "${item}" >>"${OUTPUT_FILE}"
  fi
done
