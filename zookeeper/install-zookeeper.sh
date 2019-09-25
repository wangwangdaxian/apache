#!/bin/zsh
release="zookeeper-3.5.5"
ZOOKEEPER_HOME="/usr/local/$release"
# download hadoop release
function download() {
    curl "https://www-eu.apache.org/dist/zookeeper/$release/apache-$release-bin.tar.gz" -o "$release.tar.gz"
    sudo tar -zxf "$release.tar.gz" -C /usr/local
    sudo mv /usr/local/apache-$release-bin /usr/local/$release
    sudo chown -R "$USER" "$ZOOKEEPER_HOME"
    rm $ZOOKEEPER_HOME/bin/*.cmd
    rm "$release.tar.gz"
}
# setup zookeeper configuration
function ln_config() {
    for file in "$@"; do
        ln -s "$APACHE_HOME/zookeeper/conf/$file" "$ZOOKEEPER_HOME/conf/$file"
    done
}
function ln_all() {
    ln_config zoo.cfg
}
ln_all