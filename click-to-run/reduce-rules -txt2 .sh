#!/bin/bash

data_dir="${WETUNE_DATA_DIR:-wtune_data}"
rules_dir='rules'

out="${rules_dir}/rulesout2257.txt"
#in="${rules_dir}/rules.raw.txt"
in1="${rules_dir}/rules_000"
in2="${rules_dir}/rules_001"

cat ${in2} ${in1} > 111.txt