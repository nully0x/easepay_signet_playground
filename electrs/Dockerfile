# Dockerfile
FROM 1maa/electrs:latest

COPY electrs.conf /etc/electrs.conf

EXPOSE 60601

CMD ["--conf", "/etc/electrs.conf"]

VOLUME [ "/var/lib/electrs" ]