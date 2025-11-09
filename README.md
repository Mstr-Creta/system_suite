# 🛠️ Linux System Maintenance & Monitoring Suite

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-Download-blue?logo=docker)](https://hub.docker.com/r/YOUR_DOCKERHUB_USERNAME/system-suite)

A lightweight, modular suite of Bash scripts designed to automate essential Linux system maintenance tasks and provide real-time system monitoring. It features an interactive menu for easy operation and is available as a ready-to-run Docker container for instant deployment on any Linux system.

## 🚀 Features

* **🗄️ Automated Backups:** Creates timestamped, compressed (`.tar.gz`) backups of vital directories.
* **🔄 System Updates:** Automates the full `apt` lifecycle: updating package lists, upgrading installed software, and cleaning up orphaned dependencies (requires `sudo`).
* **📊 Advanced System Monitor:** A unified dashboard displaying:
    * Real-time CPU & RAM usage.
    * Active background and foreground process tracking.
    * Essential system service status checks.
    * Intelligent log scanning (auto-detects `journalctl` or legacy `/var/log/syslog`) for critical errors.
* **🖥️ Interactive Menu:** A user-friendly terminal interface (`main.sh`) to launch all tasks.
* **🐳 Dockerized:** Fully containerized for portability and ease of use.

## 🏃 Quick Start (Docker)

The fastest way to use the suite is via our pre-built Docker image. No Git cloning or dependency installation required.

### 1️⃣ Run the Full Interactive Suite

To allow the container to monitor your *actual* host system, it needs specific permissions:

```bash
docker run --rm -it \
  --name sys-suite \
  --pid=host \
  --net=host \
  --privileged \
  -v /:/host:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  /imcrtx/system-suite
```


## ⚙️ Manual Installation (Native)
If you prefer running scripts directly on your host without Docker:
📥 Clone the repository

```bash
git clone https://github.com/Mstr-Creta/system-suite.git
cd system-suite
```

## 🔐 Make scripts executable
```
chmod +x *.sh
```

## 🚀 Run the suite
#### Sudo is recommended for full monitoring and update capabilities
```
sudo ./main.sh
```

## 📂 Project Structure

```bash
system_suite/
├── main.sh            # 🎮 Main Controller (Menu Interface)
├── backup.sh          # 📦 Backup Module
├── update.sh          # 🔄 APT Update & Cleanup Module
├── monitor.sh         # 📊 Deep System & Log Monitoring Module
└── Dockerfile         # 🐳 Docker Image Configuration
```


# 🤝 Contributing
Contributions, bug reports, and feature requests are welcome!

# 📜 License
This project is licensed under the MIT License - see the LICENSE file for details.
