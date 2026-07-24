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
> A Linux anti-forensics automation tool developed for cybersecurity research, digital forensics education, and controlled laboratory environments. It demonstrates common anti-forensics techniques to support learning, security testing, and incident response training in authorized environments only.

---

## 📖 Overview

**Nuke** is a Bash-based Linux anti-forensics automation tool designed to demonstrate how forensic artifacts can be cleaned from a Linux system in controlled environments.

It automates common cleanup tasks such as log removal, history cleanup, temporary artifact deletion, persistence cleanup, secure shredding, and other techniques frequently studied in Digital Forensics & Incident Response (DFIR).

The objective of this project is to help cybersecurity professionals, students, researchers, and DFIR analysts understand attacker cleanup behavior and improve defensive detection capabilities.

---

## ✨ Features

Current functionality includes:

* Stop common Linux logging services
* Remove Bash and Zsh history
* Clean system log files
* Remove rotated log archives
* Clean authentication and login records
* Remove selected non-default user accounts
* Securely shred specified files
* Remove temporary files and directories
* Remove common web shell locations
* Remove scheduled persistence (cron jobs)
* Clear SSH authorized keys and known hosts
* Restore selected SSH configuration values
* Remove suspicious host entries
* Flush the ARP/Neighbor cache
* Wipe temporary free space
* Self-delete after execution

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

* Linux
* Bash
* Root privileges

---

## 🚀 Installation

Clone the repository:

```bash
git clone https://github.com/abhinavms404/Nuke.git
cd Nuke
```

Make the script executable:

```bash
chmod +x nuke.sh
```

Run the tool:

```bash
sudo ./nuke.sh
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

Run this project only in controlled environments such as:

* Virtual Machines
* CTF Labs
* Cyber Ranges
* Malware Analysis Labs
* Digital Forensics Labs
* Personal Test Systems

> **Do not execute this tool on production systems or systems without explicit authorization.**

---

## ⚠️ Limitations

This project is intended for educational purposes and does **not** guarantee complete forensic evasion.

Evidence may still be available through:

* Memory captures
* Remote log servers
* SIEM platforms
* EDR/XDR telemetry
* Network devices
* Hypervisor snapshots
* Filesystem journals
* Backup systems
* Cloud logging services

---

## 📚 Educational Use

This project can help you:

* Study Linux anti-forensics
* Understand attacker cleanup techniques
* Improve DFIR investigations
* Test security monitoring solutions
* Build cybersecurity lab environments
* Demonstrate forensic artifact handling

---

## 🗺️ Roadmap

Planned improvements include:

* Modular cleanup engine
* Interactive mode
* Configuration file support
* Distribution-specific modules
* Selective cleanup options
* Reporting and logging
* Docker lab environment
* Automated testing

---

## 🤝 Contributing

Contributions are welcome.

If you have ideas, improvements, or discover bugs, feel free to:

* Open an Issue
* Submit a Pull Request
* Share research ideas

---

## ⚖️ Disclaimer

This software is provided **strictly for educational purposes, cybersecurity research, digital forensics training, and authorized security testing**.

It is intended to help researchers and defenders understand anti-forensics techniques in controlled environments.

The author does not encourage or condone unauthorized access, misuse, or illegal activity. Users are solely responsible for ensuring compliance with applicable laws, organizational policies, and ethical standards.

The author assumes no responsibility or liability for any damage, data loss, legal consequences, or misuse resulting from the use of this project.

---

## 📄 License

This project is licensed under the **MIT License**.

See the `LICENSE` file for details.

---

## 👨‍💻 Author

**Abhinav M S (Matrix)**

Cybersecurity Researcher

**GitHub:** https://github.com/abhinavms404

---

## ⭐ Support

If this project helped you learn about Linux anti-forensics or DFIR, consider giving the repository a **⭐ Star** on GitHub.
