# Lightweight Ubuntu base image
FROM ubuntu:22.04

#Envvar
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt update && apt install -y \
    bash \
    tar \
    grep \
    coreutils \
    systemd \
    && apt clean

#  working directory
WORKDIR /app

# Copy files
COPY backup.sh update.sh monitor.sh main.sh ./


RUN chmod +x *.sh

# Default command
CMD ["bash", "./main.sh"]
