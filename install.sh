#!/bin/bash
# ALL SCAN Installer (Final & Stable)

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

# Set permissions
chmod 755 allscan

# Install binary
rm -f /usr/local/bin/allscan
cp allscan /usr/local/bin/allscan

# Create report directory safely
REPORT_DIR="/home/kali/allsacnreport"
mkdir -p "$REPORT_DIR"
chown -R kali:kali "$REPORT_DIR"
chmod 755 "$REPORT_DIR"

# Verify
if command -v allscan >/dev/null 2>&1; then
  echo "[+] Installation successful!"
  echo "[+] Reports will be saved to: $REPORT_DIR"
  echo "[+] Run the tool using: allscan"
else
  echo "[-] Installation failed"
  exit 1
fi
