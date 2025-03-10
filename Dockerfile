# Dockerfile
FROM coturn/coturn:latest

EXPOSE 3478/tcp 3478/udp 5349/tcp 5349/udp

CMD ["turnserver", "-n", \
    "--log-file=stdout", \
    "--min-port=49152", \
    "--max-port=65535", \
    "--lt-cred-mech", \
    "--realm=yourdomain.com", \
    "--user=${TURN_USER}:${TURN_SECRET}"]