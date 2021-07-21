# nym mixnode installer

(OOD 0.9.2) - DO NOT USE IT FOR NEW INSTALLATIONS

do it one-line

```
wget -O install_nym.sh https://raw.githubusercontent.com/fxpy/nym/main/install_nym.sh && chmod +x install_nym.sh && ./install_nym.sh
```


# nym mixnode updater

0.10.1 -> 0.11.0

## !ATTENTION!

this updater works ONLY for root user (if you installed nym-mixnode as root) and added it to systemd (as described in Nym docs).
So if you follow the docs and install 0.10.0 - this updater will help you!

- working paths:

```/etc/systemd/system/nym-mixnode.service```

```/root/nym/target/release/nym-mixnode```

### for update run
```
wget -O nym-update.sh https://raw.githubusercontent.com/fxpy/nym/main/nym-update.sh && chmod +x nym-update.sh && ./nym-update.sh
```

after that run for monitoring

```
journalctl -u nym-mixnode -f -o cat
```

then go to https://testnet-milhon-wallet.nymtech.net/
create new PUNK wallet, save mnemonic, and give the Nym mixnode command with your attributes (be sure to change all 3 fields with your own):

```
./nym-mixnode sign --id your-node-id --text "@your_telegram_username your-punk-wallet-address"
```

then go to bot https://t.me/nympunkbot and give it output of previous command like that:

```
/transfer 7xdQ1USuNEZN4WbbiZFPfd59HTqFeNkxpu4zWrYGtmTz 4Yo4ZkUBxREJapzf7AxLPodQXic4cfbNziJMLxsftTQsVdm5XKUg8be8ErXhnHunsnmz8EZvuGLwSD98PifCad1f
```
