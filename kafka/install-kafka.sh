#!/bin/zsh
version="2.3.0"
name="kafka_2.12-$version"
release="kafka-$version"
KAFKA_HOME="/usr/local/$release"
# download kafka release
function download() {
    curl "https://www-eu.apache.org/dist/kafka/$version/$name.tgz" -o "$name.tgz"
    sudo tar -zxf "$name.tgz" -C /usr/local
    sudo mv /usr/local/$name /usr/local/$release
    sudo chown -R "$USER" "$KAFKA_HOME"
    rm -r $KAFKA_HOME/bin/windows
    rm "$release.tgz"
}
# setup kafka configuration
function ln_config() {
    for file in "$@"; do
        rm "$KAFKA_HOME/config/$file"
        ln -s "$APACHE_HOME/kafka/config/$file" "$KAFKA_HOME/config/$file"
    done
}
function ln_all() {
    ln_config server.properties
}
