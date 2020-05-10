#!/bin/bash

echo "Updating system..."
apt-get update --yes
apt-get upgrade --yes
apt-get dist-upgrade --yes
apt clean --yes
