#!/usr/bin/env bash

# First, update your existing list of packages:
apt -y update

# Next, install a few prerequisite packages which let apt use packages over HTTPS:
apt -y install apt-transport-https ca-certificates curl software-properties-common

# Then add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository to APT sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update your existing list of packages again for the addition to be recognized:
apt -y update

# Finally, install Docker:
apt -y install docker-ce

#Enable TCP port 2375 for external connection to Docker

#Create daemon.json file in /etc/docker:
mkdir -p /etc/docker

cat <<EOF >>/etc/docker/daemon.json
{
    "hosts": [
        "tcp://127.0.0.1:2375",
        "unix:///var/run/docker.sock"
    ]
}
EOF

# Add /etc/systemd/system/docker.service.d/override.conf
mkdir -p /etc/systemd/system/docker.service.d/
cat <<EOF >>/etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOF

#Reload the systemd daemon:
systemctl daemon-reload

#Restart docker:
systemctl restart docker.service

# Add user ubuntu to docker group (optional)
usermod -a -G docker ubuntu

# to use docker locally (optional)
chmod 666 /var/run/docker.sock
