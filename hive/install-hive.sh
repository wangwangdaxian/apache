#!/bin/zsh
release="hive-2.3.6"
connector="mysql-connector-java-8.0.17"
PROJECT_HOME="$HOME/apache"
HIVE_HOME="/usr/local/$release"
# download hive release
function download() {
    curl "https://mirrors.tuna.tsinghua.edu.cn/apache/hive/$release/apache-$release-bin.tar.gz" -o "$release.tar.gz"
    sudo tar -zxf "$release.tar.gz" -C /usr/local
    sudo mv /usr/local/apache-$release-bin /usr/local/$release
    sudo chown -R "$USER" "$HIVE_HOME"
    rm "$HIVE_HOME"/lib/log4j-slf4j-impl-2.6.2.jar
    rm "$release.tar.gz"
}
function download_connector() {
    curl "https://cdn.mysql.com//Downloads/Connector-J/$connector.tar.gz"
    tar -zxf $connector.tar.gz
    mv $connector/$connector.jar $HIVE_HOME/lib
    rm -rf $connector
}
# setup hive configuration
function ln_config() {
    for file in "$@"; do
        ln -s "$PROJECT_HOME/hive/conf/$file" "$HIVE_HOME/conf/$file"
    done
}
function ln_all() {
    ln_config hive-site.xml hive-log4j2.properties
}
# set up mysql
function exec_sql() {
    mysql --login-path=local -e "$1"
}
function init_mysql() {
    exec_sql "CREATE DATABASE IF NOT EXISTS hive"
    exec_sql "CREATE USER IF NOT EXISTS 'hive'@'localhost' IDENTIFIED BY 'hive'"
    exec_sql "GRANT ALL ON hive.* TO 'hive'@'localhost'"
}
# init hive
function init() {
    schematool -dbType mysql -initSchema
}
