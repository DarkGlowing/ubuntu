FROM ubuntu:20.04

ENV PORT=8080

RUN apt update -y && apt install -y dante-server autossh nano git wget curl

RUN wget -O /usr/local/bin/gotty https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64 \
    && chmod +x /usr/local/bin/gotty
    
EXPOSE $PORT

CMD ["gotty", "--port", "8080", "--permit-write", "--credential", "root:sudo", "/bin/bash"]
