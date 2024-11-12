FROM dockette/debian:stretch-slim
ENV USER=user \
    PASS=pass \
    PORT=9212
EXPOSE 9212
WORKDIR /app
VOLUME [ "/data" ]
RUN wget https://webd.cf/webd/webd_dl/20240223/webd-20240223-aarch64-linux-gnu.tar.gz -O /app/webd-20240223-aarch64-linux-gnu.tar.gz && \
    tar -xzvf /app/webd-20240223-aarch64-linux-gnu.tar.gz -C /app && \
    chmod +x /app/webd && \
    rm -f /app/webd-20240223-aarch64-linux-gnu.tar.gz
COPY start.sh /app
CMD ["sh","/app/start.sh"]