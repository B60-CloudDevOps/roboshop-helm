#!/bin/bash

app=$1
env=$2
action=$3

services=(catalogue user cart shipping frontend )

if [[ $app == "all" ]]; then
  case "$action" in
    install)
      for i in "${services[@]}"; do
        helm upgrade --install "$i" . -f "../app/$i/values-$env.yaml"
      done
      ;;
    uninstall)
      for i in "${services[@]}"; do
        helm uninstall "$i"
      done
      ;;
  esac
fi 