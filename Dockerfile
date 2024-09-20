FROM debian:trixie-slim
ENV USER=user
ENV PASS=pass
EXPOSE 9212
WORKDIR /app
VOLUME [ "/data" ]
#ADD webd-20240223-aarch64-linux-gnu.tar.gz /app
ADD webd-20240223-x86_64-pc-linux-gnu.tar.gz /app
COPY start.sh /app
#RUN tar -xzvf /app/webd-20240223-aarch64-linux-gnu.tar
#RUN chmod +x /app/start.sh
RUN chmod +x /app/webd
CMD ["sh","/app/start.sh"]