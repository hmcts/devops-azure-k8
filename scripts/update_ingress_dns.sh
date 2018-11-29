#!/bin/bash

# PUBLIC_IP and DNS_NAME are exposed from /steps/nginx-ingress-install.yaml

PUBLIC_IP_RESOURCE_ID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$PUBLIC_IP')].[id]" --output tsv)

# Update public ip address with DNS name
az network public-ip update --ids $PUBLIC_IP_RESOURCE_ID --dns-name $DNS_NAME
