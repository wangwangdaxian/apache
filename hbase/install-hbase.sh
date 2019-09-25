#!/bin/zsh
version="2.1.6"
release="hbase-2.1.6"
HBASE_HOME="/usr/local/$release"
# download hadoop release
function download() {
    curl "http://mirrors.tuna.tsinghua.edu.cn/apache/hbase/$version/$release-bin.tar.gz" -o "$release.tar.gz"
    sudo tar -zxf "$release.tar.gz" -C /usr/local
    sudo chown -R "$USER" "$HBASE_HOME"
    rm $HBASE_HOME/conf/*.cmd $HBASE_HOME/bin/*.cmd
    rm $HBASE_HOME/lib/client-facing-thirdparty/slf4j-log4j12-1.7.25.jar
    rm "$release.tar.gz"
}
# setup hbase configuration
function ln_config() {
    for file in "$@"; do
        rm -f "$HBASE_HOME/conf/$file"
        ln -s "$APACHE_HOME/hbase/conf/$file" "$HBASE_HOME/conf/$file"
    done
}
function ln_all() {
    ln_config hbase-env.sh hbase-site.xml
}
