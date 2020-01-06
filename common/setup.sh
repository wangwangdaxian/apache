#!/bin/bash

# Target directory path,eg:"$HADOOP_HOME/etc/hadoop".
TARGET_PATH="null"
# Source directory path,eg:"$APACHE_HOME/hadoop/etc/hadoop".
SOURCE_PATH="null"
function link_file() {
  if [[ "$TARGET_PATH" == "null" ]]; then
    echo "Script Exit.Require to set variable 'TARGET_PATH'."
    exit 0
  fi
  if [[ "$SOURCE_PATH" == "null" ]]; then
    echo "Script Exit.Require to set variable 'SOURCE_PATH'."
    exit 0
  fi
  for file in "$@"; do
    rm -f "$TARGET_PATH/$file"
    ln -s "$SOURCE_PATH/$file" "$TARGET_PATH/$file"
  done
}
