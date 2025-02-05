# Linux Cheat Sheet

## **Manual**
 ```bash
  man find
  ```
- Suchen mit /

## **Rechte**
- **Berechtigungen anzeigen:**
  ```bash
  ls -l
  ```
- **Berechtigungen ändern:**
  ```bash
  chmod u+x script.sh  # Ausführbar für den Besitzer
  chmod 755 script.sh  # rwxr-xr-x
  chmod a+r file.txt   # Leserecht für alle
  ```
- **Besitzer ändern:**
  ```bash
  chown user:group file.txt
  chgrp group file.txt
  ```

## **User & Groups**
- **Benutzer anlegen:**
  ```bash
  adduser username
  ```
- **Benutzer zu Gruppe hinzufügen:**
  ```bash
  usermod -aG groupname username
  ```
- **Gruppe erstellen:**
  ```bash
  groupadd groupname
  ```
- **Benutzerinformationen anzeigen:**
  ```bash
  id username
  cat /etc/passwd
  ```

## **Logs**
- **Logs anzeigen:**
  ```bash
  tail -f /var/log/syslog  # Live ansehen
  grep "ERROR" /var/log/syslog  # Fehler suchen
  ```
- **Apache Logs finden:**
  ```bash
  find /var/log/apache2 -type f -name "*log*"
  ```

## **History**
- **Letzte 10 Befehle anzeigen:**
  ```bash
  history 10
  ```

## **Find**
- **Dateien/Verzeichnisse suchen:**
  ```bash
  find /path -name "filename"  # Nach Namen suchen
  find /path -type f -mtime -7  # Dateien, die in den letzten 7 Tagen modifiziert wurden
  find /path -type d -name "dirname"  # Verzeichnisse suchen
  find /path -size +100M  # Dateien größer als 100MB
  ```

## **Symlinks**
- **Symbolischen Link erstellen:**
  ```bash
  ln -s /path/to/original /path/to/link
  ```
- **Hardlink erstellen:**
  ```bash
  ln /path/to/original /path/to/link
  ```

## **Netzwerk**
- **Offene Ports anzeigen:**
  ```bash
  sudo netstat -tnp  # TCP-Verbindungen
  sudo netstat -tlnp # TCP-Listener
  sudo netstat -ua   # UDP-Verbindungen
  sudo netstat -tc   # TCP-Verbindungen (kurz)
  ```
- **Netzwerkscan:**
  ```bash
  sudo nmap -sS -p- <IP>
  ```
- **IP-Adresse anzeigen:**
  ```bash
  ip a
  ifconfig
  ```

## **Prozesse**
- **Laufende Prozesse anzeigen:**
  ```bash
  ps aux
  top
  ```
- **Prozessdetails anzeigen:**
  ```bash
  cat /proc/<PID>/cmdline  # Prozessbefehl
  cat /proc/<PID>/environ   # Umgebungsvariablen
  ```

## **Timezone**
- **Zeitzone anzeigen:**
  ```bash
  timedatectl
  ```
- **Zeitzone ändern:**
  ```bash
  sudo timedatectl set-timezone Europe/Berlin
  ```

## **ZIP & Archivierung**
- **Dateien komprimieren:**
  ```bash
  zip archive.zip file1 file2
  ```
- **Dateien entpacken:**
  ```bash
  unzip archive.zip
  ```
- **TAR-Dateien erstellen:**
  ```bash
  tar -czvf archive.tar.gz /path/to/dir
  ```
- **TAR-Dateien entpacken:**
  ```bash
  tar -xzvf archive.tar.gz
  ```

## **Netzwerk-Diagnose**
- **Ping:**
  ```bash
  ping google.com
  ```
- **Traceroute:**
  ```bash
  traceroute google.com
  ```
- **DNS-Abfrage:**
  ```bash
  nslookup google.com
  dig google.com
  ```

## **Firewall (UFW)**
- **Firewall aktivieren:**
  ```bash
  sudo ufw enable
  ```
- **Port öffnen:**
  ```bash
  sudo ufw allow 22/tcp
  ```
- **Firewall-Status anzeigen:**
  ```bash
  sudo ufw status
  ```

## **SSH**
- **SSH-Verbindung herstellen:**
  ```bash
  ssh user@hostname
  ```
- **SSH-Key erstellen:**
  ```bash
  ssh-keygen -t rsa -b 4096
  ```

## **Docker**
- **Docker-Container starten:**
  ```bash
  docker run -d --name containername image
  ```
- **Docker-Container stoppen:**
  ```bash
  docker stop containername
  ```

## **Kubernetes**
- **Kubernetes-Pods anzeigen:**
  ```bash
  kubectl get pods
  ```

## **Ansible**
- **Playbook ausführen:**
  ```bash
  ansible-playbook playbook.yml
  ```

## **Git**
- **Repository klonen:**
  ```bash
  git clone https://github.com/user/repo.git
  ```
- **Änderungen committen:**
  ```bash
  git add .
  git commit -m "Commit message"
  git push origin master
  ```

## **Python**
- **Python-Skript ausführen:**
  ```bash
  python3 script.py
  python3 generate_random_files.py
  ```

