#!/bin/bash

kdesrc-build \
    plasma-workspace plasma-framework plasma-integration \
    bluedevil powerdevil plasma-nm plasma-pa plasma-thunderbolt \
    plasma-vault plasma-firewall plasma-workspace-wallpapers \
    kdeplasma-addons krunner milou kwin kscreen sddm-kcm \
    plymouth-kcm breeze print-manager plasma-sdk kdeconnect-kde \
    plasma-browser-integration xdg-desktop-portal-kde \
    kde-gtk-config kgamma5 breeze-gtk drkonqi phonon flatpak-kcm \
    kactivitymanagerd plasma-desktop systemsettings plasma-disks \
    plasma-systemmonitor kinfocenter kmenuedit dolphin konsole \
    kdsoap ksshaskpass kwayland-integration kate plasma-welcome \
    baloo-widgets dolphin-plugins kdegraphics-thumbnailers \
    ffmpegthumbs kdenetwork-filesharing kio-extras kio-admin \
    xwaylandvideobridge kde-cli-tools kdecoration kpipewire \
    ksystemstats kwallet-pam layer-shell-qt libkscreen polkit-kde-agent-1 \
    --include-dependencies

