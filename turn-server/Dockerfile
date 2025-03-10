FROM coturn/coturn:latest

# Install dependencies for self-signed cert generation
RUN apt-get update && apt-get install -y openssl

# Create certificate (self-signed for testing)
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/turn.key \
    -out /etc/ssl/certs/turn.crt -days 365 -nodes \
    -subj "/CN=turn-server.onrender.com"

# Expose ports
EXPOSE 3478/tcp 3478/udp 5349/tcp 5349/udp

# Set entrypoint with environment variables
CMD ["turnserver", "-n", 
    "--log-file=stdout",
    "--min-port=49152",
    "--max-port=65535",
    "--lt-cred-mech",
    "--realm=yourdomain.com",
    "--user=${TURN_USER}:${TURN_SECRET}",
    "--cert=/etc/ssl/certs/turn.crt",
    "--pkey=/etc/ssl/private/turn.key"]