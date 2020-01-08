#!/bin/bash
# shellcheck source=/Users/shizk233/apache/common/setup.sh
source "$APACHE_HOME"/common/setup.sh

# Setup configuration
function ln_all() {
  export TARGET_PATH="$HADOOP_HOME"/etc/hadoop
  export SOURCE_PATH="$APACHE_HOME"/hadoop/etc/hadoop/
  link_file core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml hadoop-env.sh
}

# Init hdfs
function init() {
  hdfs namenode -format
}

ln_all
