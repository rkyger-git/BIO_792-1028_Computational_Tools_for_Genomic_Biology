#!/usr/bin/bash
#mac_to_unix_line_endings.sh
cat $1 | tr '\r' '\n' > unix_$1
