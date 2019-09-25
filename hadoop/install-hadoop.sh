#!/bin/zsh
release="hadoop-2.7.7"
HADOOP_HOME="/usr/local/$release"
# download hadoop release
function download() {
    curl "http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/$release/$release.tar.gz" -o "$release.tar.gz"
    sudo tar -zxf "$release.tar.gz" -C /usr/local
    sudo chown -R "$USER" "$HADOOP_HOME"
    rm $HADOOP_HOME/etc/hadoop/*.cmd $HADOOP_HOME/bin/*.cmd $HADOOP_HOME/sbin/*.cmd $HADOOP_HOME/sbin/start-all.sh
    rm "$release.tar.gz"
}
# setup hadoop configuration
function ln_config() {
    for file in "$@"; do
        rm -f "$HADOOP_HOME/etc/hadoop/$file"
        ln -s "$APACHE_HOME/hadoop/etc/hadoop/$file" "$HADOOP_HOME/etc/hadoop/$file"
    done
}
function ln_all() {
    ln_config core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml hadoop-env.sh
}
# init hdfs
function init() {
    hdfs namenode -format
    start-dfs.sh
    hdfs dfs -mkdir -p "/user/$USER"
    stop-dfs.sh
}
