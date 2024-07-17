#!/bin/bash
set -ex
sudo swapoff -a
sudo cp /etc/fstab /etc/fstab.bak
sed -i -e 's/\/swap/#\/swap/' /etc/fstab