# easepay_signet_playground
A dockerized, self-contained signet node for testing bitcoin Applications:  Bitcoin [Signet network](https://en.bitcoin.it/wiki/Signet) to study how it works.

## Requirements

Recent Docker version with the Compose v2 plugin.

```bash
$ docker compose version
Docker Compose version v2.25.0
```

## Setup

Start easepay-signet-node, Electrum(fulcrum), MariaDB and MongoDB.
Since easepay-signet-node is booting in custom signet mode, all services  will finish their setup almost immediately, as there is no blockchain to download.

```bash
$ docker compose up -d easepay-signet fulcrum mariadb mongo
```

Now run a one-time process that will store in easepay-signet' wallet the private key that is used for the signet challenge:

```bash
$ docker compose run --rm wallet-setup
{
  "name": "custom-signet"
}
```

With the private key stored in easepay you can now start the faucet, miner and mempool processes:

```bash
$ docker compose up -d faucet miner mempool-api mempool-web
```

## Testing

### Mempool Explorer

Browse the Signet chain at http://localhost:8080

### WALLET

Connect your Wallet to Fulcrum(Electrum):

1. Tools > Restart in Network > Signet
2. File > Preferences > Server > Private Electrum > localhost:60601, no SSL, no Tor proxy.
3. Wait until the blockchain has at least 100 blocks, then get some sats from the faucet at http://localhost:8123

### bitcoin-cli

Interact directly with the node via the command line by entering into the `easepay-signet` container and running `bitcoin-cli` with the appropriate credentials:

```shell
$ docker compose exec -it easepay-signet sh -l
$ bitcoin-cli -signet -rpcuser=easepay-signet -rpcpassword=rpcpassword -getinfo
Chain: signet
Blocks: 101
Headers: 101
Verification progress: 100.0000%
Difficulty: 0.001126515290698186

Network: in 1, out 0, total 1
Version: 260100
Time offset (s): 0
Proxies: n/a
Min tx relay fee rate (BTC/kvB): 0.00001000

Wallet: custom-signet
Keypool size: 1000
Transaction fee rate (-paytxfee) (BTC/kvB): 0.00000000

Balance: 50.00000000

Warnings: (none)
```


## Clean Up

Stop and remove all containers and data volumes with the usual Docker Compose command:

```bash
$ docker compose down -v
```


# References

## Guides

* [BIP-325: Signet](https://bips.xyz/325)
* [Mempool Docker installation](https://github.com/mempool/mempool/blob/master/docker/README.md)
* [Custom Signet Tutorial](https://en.bitcoin.it/wiki/Signet#Custom_Signet)
