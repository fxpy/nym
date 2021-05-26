#!/bin/bash

node_id=$(systemctl status nym-mixnode | grep '\-\-id ' | sed 's#.*--id \(\)#\1#' | sed 's/\s.*$//')

sudo systemctl stop nym-mixnode

wget -O nym-mixnode https://github.com/nymtech/nym/releases/download/v0.10.1/nym-mixnode_linux_x86_64
chmod +x nym-mixnode

sudo mv nym-mixnode /root/nym/target/release/
cd /root/nym/target/release/
./nym-mixnode upgrade --id $node_id

sudo systemctl daemon-reload
sudo systemctl enable nym-mixnode
sudo systemctl start nym-mixnode
sudo systemctl status nym-mixnode
