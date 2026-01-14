#!/bin/bash
# ALL SCAN Installer

echo "[+] Installing ALL SCAN..."

# Root check
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run with:"
  echo "    sudo bash install.sh"
  exit 1
fi

# File check
if [ ! -f "allscan" ]; then
  echo "[-] allscan file not found!"
  exit 1
fi

# Fix CRLF issues
sed -i 's/\r$//' allscan
sed -i 's/\r$//' install.sh

# Permissions
chmod 755 allscan

# Remove old version
rm -f /usr/local/bin/allscan

# Install
cp allscan /usr/local/bin/allscan

# Verify
if command -v allscan >/dev/null 2>&1; then
  echo "[+] Installation successful!"
  echo "[+] Run using: allscan"
else
  echo "[-] Installation failed"
  exit 1
fi
