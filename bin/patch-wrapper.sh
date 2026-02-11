#!/bin/bash
set -e

HTML="$GALAXY_CONFIG_DIR/web/welcome.html"

if [ -n "$LAB_DOMAIN" ] && [ -f "$HTML" ]; then
    echo "Patching welcome.html with LAB_DOMAIN=$LAB_DOMAIN"
    sed -i "s|https://microbiology.usegalaxy.eu|$LAB_DOMAIN|g" "$HTML"
fi