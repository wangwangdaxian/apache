#!/bin/zsh
# shellcheck source=/Users/shizk233/apache/common/setup.sh
source "$APACHE_HOME"/common/setup.sh
# Setup configuration
function ln_all() {
  export TARGET_PATH="$ZOOKEEPER_HOME"/conf
  export SOURCE_PATH="$APACHE_HOME"/zookeeper/conf
  link_file zoo.cfg
}
ln_all