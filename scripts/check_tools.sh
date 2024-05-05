#!/bin/bash

function check_asdf() {
  if type "asdf" >/dev/null 2>&1; then
    echo "asdf is installed."
    exit 0
  else
    echo "asdf is not installed. Please install asdf."
    exit 1
  fi
}

check_asdf
