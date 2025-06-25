FROM ubuntu:20.04

ENV PORT=8080

RUN apt update -y && apt install -y dante-server autossh nano git && apt purge -y systemd && apt install -y systemctl

RUN adduser -D terminaluser \
    && echo "terminaluser:terminal" | chpasswd

RUN echo 'echo "Welcome to the Web Terminal!"' > /welcome.sh \
    && echo 'echo "You are running on $(uname -a)"' >> /welcome.sh \
    && chmod +x /welcome.sh
    
EXPOSE $PORT

# Start GoTTY with bash
CMD ["sh", "-c", "/welcome.sh && gotty --port 8080 --permit-write --reconnect /bin/bash"]
