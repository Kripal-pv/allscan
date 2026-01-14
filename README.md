# ALL SCAN

ALL SCAN is a professional Nmap-based network scanning tool for **authorized security testing** on Kali Linux.

---

### Scan Behavior

ALL SCAN uses **Nmap as its backend**, but unlike manual Nmap usage, it does **not require separate scan flags** such as `-sS`, `-sV`, `-sC`, or `-O`.

ALL SCAN performs a **single, unified scan** that automatically includes:
- Host discovery handling
- Port scanning
- Service and version detection
- Default NSE script scanning
- OS detection

This design simplifies scanning by providing **one complete scan in a single execution**, without requiring users to remember or manage individual Nmap options.

---

## Installation

```bash
git clone https://github.com/Kripal-pv/all-scan.git
cd allscan
sudo bash install.sh

allscan


