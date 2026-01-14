#!/bin/bash
# ALL SCAN Installer (Hassle-Free)

echo "[+] Installing ALL SCAN..."

# ---------- ROOT CHECK ----------
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run using:"
  echo "    sudo bash install.sh"
  exit 1
fi

# ---------- FILE CHECK ----------
if [ ! -f "allscan" ]; then
  echo "[-] allscan file not found!"
  exit 1
fi

# ---------- FIX LINE ENDINGS ----------
# CRITICAL: fixes python3\r error
sed -i 's/\r$//' allscan
sed -i 's/\r$//' install.sh

# ---------- PERMISSIONS ----------
chmod 755 allscan

# ---------- REMOVE OLD INSTALL ----------
rm -f /usr/local/bin/allscan

# ---------- INSTALL ----------
cp allscan /usr/local/bin/allscan

# ---------- VERIFY ----------
if command -v allscan >/dev/null 2>&1; then
  echo "[+] Installation successful!"
  echo "[+] Run the tool using: allscan"
else
  echo "[-] Installation failed"
  exit 1
fi
