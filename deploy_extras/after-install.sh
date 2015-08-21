#!/usr/bin/env bash

set -e # We want any sub commands in here to fail the whole script.

# Any commands that should be run after the deb has been installed
adduser --system --no-create-home django-readonly
chown -R django-readonly /srv/django-readonly
mkdir -p /var/log/django-readonly
chown -R django-readonly /var/log/django-readonly

# Some post-install help
echo "You should have set permanent environment variables for each of the following sensitive settings."
echo "> LEGACY_DB_USER"
echo "> LEGACY_DB_PASSWORD"
echo "> DJANGO_SETTINGS_MODULE (Environment specific settings to use readonly.settings.<your environment>)"
echo "> READONLY_SECRET_KEY (A long random string, used for encryption.)"
echo "If not, please set them and restart the server."
echo "The logs can be found at /var/log/django-readonly"
echo "Enjoy!"