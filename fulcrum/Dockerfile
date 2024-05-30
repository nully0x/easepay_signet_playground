# Dockerfile
FROM cculianu/fulcrum:latest

# Set environment variables
ENV DATA_DIR=/db \
    SSL_CERTFILE=/tls.crt \
    SSL_KEYFILE=/tls.key \
    BITCOIN_NODE_HOST=0.0.0.0 \
    BITCOIN_NODE_RPC_PORT=38332

# Copy configuration and certificate files
COPY ./fulcrum.conf /fulcrum.conf
COPY ./fulcrum-env/easepay.tls.key /tls.key
COPY ./fulcrum-env/easepay.tls.crt /tls.crt

# Run Fulcrum
CMD ["Fulcrum", "/fulcrum.conf"]