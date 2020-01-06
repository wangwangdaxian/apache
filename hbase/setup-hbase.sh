#!/bin/bash
# shellcheck source=/Users/shizk233/apache/common/setup.sh
source "$APACHE_HOME"/common/setup.sh

# Setup configuration
function ln_all() {
  export TARGET_PATH="$HBASE_HOME"/conf
  export SOURCE_PATH="$APACHE_HOME"/hbase/conf
  link_file hbase-env.sh hbase-site.xml
}

ln_all