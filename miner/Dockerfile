# Dockerfile
FROM 1maa/signet-miner:latest

ENV MINING_DIFFICULTY=1d00ffff
ENV REWARDS_BTC_ADDRESS=tb1qf5fgspgkusy7n3xp75kx77ml2u4czs62kc9zvg
ENV RPC_ADDR=knots
ENV RPC_PWD=easepay
ENV RPC_USER=easepay

ENTRYPOINT ["sh", "-c", "miner --cli=\"bitcoin-cli -rpcuser=$RPC_USER -rpcpassword=$RPC_PWD -rpcconnect=$RPC_ADDR\" generate --address $REWARDS_BTC_ADDRESS --grind-cmd=\"bitcoin-util grind\" --nbits=$MINING_DIFFICULTY --ongoing"]