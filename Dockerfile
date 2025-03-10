FROM coturn/coturn:latest

# Required Render-specific settings
ENV TURN_USER=render \
    TURN_SECRET=your_strong_password \
    TURN_REALM=yourdomain.com

# Configure ports
EXPOSE 3478/tcp 3478/udp 5349/tcp 5349/udp

# Health check (required for Render)
HEALTHCHECK --interval=30s --timeout=30s \
  CMD turnutils_uclient -t -e 127.0.0.1 || exit 1

# Run command (critical security flags)
CMD ["turnserver", \
    "-n", \
    "--log-file=stdout", \
    "--lt-cred-mech", \
    "--user=${TURN_USER}:${TURN_SECRET}", \
    "--realm=${TURN_REALM}", \
    "--no-cli", \
    "--no-tls", \
    "--no-dtls", \
    "--pidfile=/tmp/turn.pid"]