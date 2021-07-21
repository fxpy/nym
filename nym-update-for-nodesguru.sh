#!/bin/bash

#thanks for guys from nodes.guru for that sed magic!
node_id=$(systemctl status nym-mixnode | grep '\-\-id ' | sed 's#.*--id \(\)#\1#' | sed 's/\s.*$//')

sudo systemctl stop nym-mixnode

wget -O nym-mixnode https://github.com/nymtech/nym/releases/download/v0.11.0/nym-mixnode_linux_x86_64
chmod +x nym-mixnode

#sed -i 's/(0.10.1)/(0.11.0)/g' /etc/systemd/system/nym-mixnode.service

sudo mv nym-mixnode /usr/bin
cd /usr/bin
./nym-mixnode upgrade --id $node_id

sudo systemctl daemon-reload
sudo systemctl enable nym-mixnode
sudo systemctl start nym-mixnode
sudo systemctl status nym-mixnode
