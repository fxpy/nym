#!/bin/bash
if [ ! $NYM_NODENAME ]; then
	read -p "Enter node name: " NYM_NODENAME
fi
echo 'Your node name: ' $NYM_NODENAME
if [ ! $NYM_LOCATION ]; then
	read -p "Enter node location: " NYM_LOCATION
fi
echo 'Your node location: ' $NYM_LOCATION
echo 'export NYM_NODENAME='$NYM_NODENAME >> $HOME/.bashrc
echo 'export NYM_LOCATION='$NYM_LOCATION >> $HOME/.bashrc
source $HOME/.bashrc
sudo apt update && sudo apt upgrade -y
sudo apt install make clang pkg-config libssl-dev build-essential git curl -y  #< "/dev/null"
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
git clone https://github.com/nymtech/nym.git
cd nym
git pull
git checkout tags/v0.9.2
cargo build --release
mv $HOME/nym/target/release/nym-mixnode /usr/bin
nym-mixnode init --id $NYM_NODENAME --host $(curl ifconfig.me) --location $NYM_LOCATION
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
sudo systemctl restart systemd-journald
sudo tee <<EOF >/dev/null /etc/systemd/system/nymd.service
[Unit]
Description=Nym Mixnode

[Service]
User=$USER
ExecStart=/usr/bin/nym-mixnode run --id $NYM_NODENAME
KillSignal=SIGINT
Restart=on-failure
RestartSec=30
StartLimitInterval=350
StartLimitBurst=10

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable nymd
sudo systemctl start nymd
sudo systemctl status nymd
