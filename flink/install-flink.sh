#!/bin/zsh
release="flink-1.9.1"
FLINK_HOME="/usr/local/$release"
# download flink release
function download() {
    curl "https://mirrors.tuna.tsinghua.edu.cn/apache/flink/$release/$release-bin-scala_2.12.tgz" -o "$release.tar.gz"
    sudo tar -zxf "$release.tar.gz" -C /usr/local
    sudo chown -R "$USER" "$FLINK_HOME"
    rm $FLINK_HOME/bin/*.bat
    rm "$release.tar.gz"
}
