# FROM [イメージ] [タグ]
# Docker Hub (https://hub.docker.com/) 参照
FROM ubuntu:25.10

# 環境変数を docker-compose.yml から受け取る
ARG WS
ARG USER_NAME
ARG PASSWORD
ARG ENTRY_DIR
ARG ENTRY_POINT
ARG VOLUME
ARG LANG

# 環境変数を設定
# 1000以上推奨
ENV USER_ID=1001
ENV GROUP_ID=1001

# RUN 命令はなるべく1つにまとめる
# コマンドが長くなる場合は \ で改行すること
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    sudo nano iproute2 iputils-ping language-pack-ja && \
    useradd -m -s /bin/bash -u ${USER_ID} ${USER_NAME} && \
    usermod -aG sudo ${USER_NAME} && \
    echo "root:${PASSWORD}" | chpasswd && \
    echo "${USER_NAME}:${PASSWORD}" | chpasswd && \
    mkdir -p /home/${USER_NAME}/${ENTRY_DIR} && \
    update-locale LANG=${LANG}

COPY ${ENTRY_POINT} /home/${USER_NAME}/${ENTRY_DIR}/${ENTRY_POINT}
RUN chmod +x /home/${USER_NAME}/${ENTRY_DIR}/${ENTRY_POINT}

RUN apt install -y \
    nut \
    usbutils

COPY ${VOLUME}/config/* /etc/nut/
# USER ${USER_NAME}
WORKDIR /home/${USER_NAME}/${WS}

# 起動したら実行するコマンド
# 環境変数は使えないので注意
# ENTRYPOINT ["/Programs/start.sh"] 

# 起動したら実行するコマンド
# CMD ["/bin/bash", "-c", "while true; do sleep 1000; done"]
# 無限ループでbashを起動し続ける