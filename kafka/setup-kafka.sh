#!/bin/zsh
# shellcheck source=/Users/shizk233/apache/common/setup.sh
source "$APACHE_HOME"/common/setup.sh

# Setup configuration
function ln_all() {
  export TARGET_PATH="$KAFKA_HOME"/config
  export SOURCE_PATH="$APACHE_HOME"/kafka/config
  link_file server.properties
}

ln_all