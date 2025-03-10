FROM coturn/coturn:latest
EXPOSE 3478/tcp 3478/udp 5349/tcp 5349/udp
CMD ["--log-file=stdout", "--min-port=49152", "--max-port=65535", 
     "--lt-cred-mech", "--realm=yourdomain.com", 
     "--user=user:${TURN_SECRET}", "--cert=/etc/ssl/turn.crt",
     "--pkey=/etc/ssl/turn.key"]