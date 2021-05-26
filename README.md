# nym mixnode installer

do it one-line

wget -O install_nym.sh https://raw.githubusercontent.com/fxpy/nym/main/install_nym.sh && chmod +x install_nym.sh && ./install_nym.sh 


# nym mixnode updater

!ATTENTION!
this updater works ONLY for root user (if you installed nym-mixnode as root) and added it to systemd (as described in Nym docs)
So if you follow the docs and install 0.10.0 - this updater will help you!

wget -O nym-update.sh https://raw.githubusercontent.com/fxpy/nym/main/nym-update.sh && chmod +x nym-update.sh && ./nym-update.sh

after that run

journalctl -u nym-mixnode -f -o cat

go to https://web-wallet-finney.nymtech.net/ login with your mnemonic, unbond node, then bond again with new version 0.10.1
