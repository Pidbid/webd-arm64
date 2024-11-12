FROM dockette/debian:stretch-slim
ENV USER=user \
    PASS=pass \
    PORT=9212
EXPOSE 9212
WORKDIR /app
VOLUME [ "/data" ]
RUN apt-get update && apt-get install -y wget && \
    wget https://webd.cf/webd/webd_dl/20240223/webd-20240223-aarch64-linux-gnu.tar.gz && \
    tar -xzvf webd-20240223-aarch64-linux-gnu.tar.gz && \
    chmod +x webd && \
    rm -f webd-20240223-aarch64-linux-gnu.tar.gz && \
    apt-get remove -y wget && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY start.sh /app
CMD ["sh","/app/start.sh"]