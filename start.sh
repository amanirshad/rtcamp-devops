#! /bin/bash
# Shell script to create WP site

# Site name check
if [ -z "$1" ]; then
  echo "Please provide a site name as an argument."
  exit 1
fi

# Entry in /etc/hosts
site_name="$1"
echo "127.0.0.1:8000 $site_name" >> /etc/hosts

#Calling install Requirements
sh ./installrequirements.sh
