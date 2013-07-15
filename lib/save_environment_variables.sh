#!/bin/bash
tmp_file=$1
/bin/touch $tmp_file
/bin/chmod 600 $tmp_file
/usr/bin/env > $tmp_file
exit
