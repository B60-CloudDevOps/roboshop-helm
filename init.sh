#!/bin/bash

app=$1
env=$2
action=$3

services=(catalogue user cart shipping frontend )

# if $1 or 2 or 3 or all are empty, exit the script and output the usage information
if [[ -z "$app" || -z "$env" || -z "$action" ]]; then
  echo "Error: Missing required arguments."
  echo "Usage: $0 <app> <env> <action>"
  exit 1
fi  

echo "Usage: $0 <app> <env> <action>"
echo "  <app>: all or specific service name"
echo "  <env>: environment name"
echo "  <action>: install or uninstall"

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



