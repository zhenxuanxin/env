#!/bin/bash

function uuid() {
  if command -v uuidgen &> /dev/null; then
    uuidgen
    return
  fi
  cat /proc/sys/kernel/random/uuid
}


# usage
uuid=$(uuid)
echo "${uuid//-/}"
