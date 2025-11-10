# 🐧 Dennis Hilk – NixOS System Backup (`cthulhu`)

> ⚠️ **Hinweis / Note:**  
> Dies ist **mein persönliches System-Backup** für meinen NixOS-Rechner **"cthulhu"**.  
> Es dient ausschließlich als Referenz und Sicherung meiner eigenen Konfiguration.  
> Andere Nutzer*innen können sich gern inspirieren lassen,  
> aber diese Dateien sind **nicht für die direkte Installation gedacht**.

---

## 🇩🇪 **Über dieses Repository**

Dieses Repository enthält meine aktuelle **NixOS-Konfiguration**  
für mein System **"cthulhu"** (Workstation, Desktop).  
Es spiegelt exakt meinen laufenden Zustand wieder – inklusive:

- 🧠 **Desktop Environment:** XFCE + Picom (GLX)
- 🎨 **Theme:** Gruvbox GTK + Nerd Fonts
- 🧰 **Shell:** Zsh mit Powerlevel10k
- 🧩 **System:** NixOS 25.05 (Warbler)
- ⚙️ **GPU:** NVIDIA RTX 3060 Ti (open module)
- 🧮 **CPU:** AMD Ryzen 7 5800X3D
- 🖥️ **Monitore:** 3440×1440 + 1920×1080
- 🧊 **Kernel:** Linux 6.17+
- 🕹️ **Ziel:** Gaming + Entwicklung + Linux-Optimierung

Dieses Setup ist darauf ausgelegt, **optisch minimalistisch**, **technisch stabil**  
und **leicht reproduzierbar** zu sein – ideal für den Alltag mit NixOS.

---

## 🇬🇧 **About this Repository**

This repository contains my **personal NixOS configuration**
for my workstation **"cthulhu"**.

It represents my actual running setup, including:

- 🧠 **Desktop Environment:** XFCE + Picom (GLX)
- 🎨 **Theme:** Gruvbox GTK + Nerd Fonts
- 🧰 **Shell:** Zsh with Powerlevel10k
- 🧩 **System:** NixOS 25.05 (Warbler)
- ⚙️ **GPU:** NVIDIA RTX 3060 Ti (open driver)
- 🧮 **CPU:** AMD Ryzen 7 5800X3D
- 🖥️ **Monitors:** 3440×1440 + 1920×1080
- 🧊 **Kernel:** Linux 6.17+
- 🕹️ **Purpose:** Gaming, development and desktop optimization

It’s designed to be **clean**, **stable**, and **fully reproducible** –  
perfect for everyday use and testing under NixOS.

---

## 🐙 Git & Backup

All configuration files are versioned and automatically synchronized with GitHub  
using a daily `systemd` timer (`/usr/local/bin/nixos-backup.sh`).

Manual sync:
```bash
cd /etc/nixos
sudo git add .
sudo git commit -m "Update: new tweaks or packages"
sudo git push
