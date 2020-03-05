#!/bin/bash -eux

dnf install -y epel-release
dnf install -y figlet rubygems
dnf upgrade -y

#Set Python3 as standard Python
alternatives --set python /usr/bin/python3

#Set MOTD
gem install lolcat
mkdir /etc/custom_motd/
wget https://gist.github.com/MaartenMol/7a6d19bbc6976eee9b557f4ea0f2b4d5/raw/00c78aa4c5f1cbe512f8dd2d70dfbe75a7794f78/motd.sh -O /etc/custom_motd/motd.sh
chmod +x /etc/custom_motd/motd.sh
echo "/etc/custom_motd/motd.sh" | tee --append /etc/profile

dnf clean all

# Logging cleanup
systemctl stop systemd-journald.socket
find /var/log -type f -exec rm {} \;
mkdir -p /var/log/journal
cd /root ; rm -f .bash_history ; history -c

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync