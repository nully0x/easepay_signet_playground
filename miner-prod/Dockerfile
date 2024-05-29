# Dockerfile
FROM 1maa/signet-miner:latest

ENV MINING_DIFFICULTY=1d00ffff
ENV REWARDS_BTC_ADDRESS=tb1qvf8h76j478yq442ruz0h7zlctpxdyzv0vv8hq5
ENV RPC_PWD=easepay
ENV RPC_USER=easepay

ENTRYPOINT ["sh", "-c", "miner --cli=\"bitcoin-cli -rpcuser=$RPC_USER -rpcpassword=$RPC_PWD -rpcconnect=$RPC_ADDR\" generate --address $REWARDS_BTC_ADDRESS --grind-cmd=\"bitcoin-util grind\" --nbits=$MINING_DIFFICULTY --ongoing"]