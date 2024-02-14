#!/bin/bash

# Flatpak install
if ! command -v flatpack &> /dev/null
then
    echo "flatpak could not be found installing..."
    wait 1
    sudo apt install -y flatpak
else
    echo "flatpak found!"
    wait 1
fi

# Rancher desktop install
sudo usermod -a -G kvm "$USER"
sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80
sudo apt install -y pass
curl -s https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/Release.key | gpg --dearmor | sudo dd status=none of=/usr/share/keyrings/isv-rancher-stable-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/isv-rancher-stable-archive-keyring.gpg] https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/ ./' | sudo dd status=none of=/etc/apt/sources.list.d/isv-rancher-stable.list
sudo apt update
sudo apt install -y rancher-desktop

# Install Slack
flatpak install -y flathub com.slack.Slack

# Install VSCode
flatpak install -y flathub com.visualstudio.code

# Install github desktop
flatpak install -y flathub io.github.shiftey.Desktop

# Install obsidian notes
flatpak install -y flathub md.obsidian.Obsidian
