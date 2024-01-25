#!/bin/bash

data_dir="${WETUNE_DATA_DIR:-wtune_data}"
rules_dir='rules'

for (( i = 000; i <= 230; i++)); do
if [ $i -le 9 ] ; then
    t=00$i
elif [ $i -le 99 ] ;  then
    t=0$i
else
    t=$i
fi
 out="${rules_dir}/rules$t.txt"
 in="${rules_dir}/rules_$t"
 #if ! [ -f "${in}" ]; then
 #  in="${rules_dir}/rules.local.txt"
 #fi

 # read arguments
 while [[ $# -gt 0 ]]; do
  case "$1" in
  "-f" | "-file" | "-i" | "-in" | "-input" | "-R" | "rules")
    in="${2}"
    shift 2
    ;;
  "-o" | "-out" | "-output")
    out="${2}"
    shift 2
    ;;
  "-spes")
    out="${rules_dir}/rules.spes.txt"
    shift
    ;;
  *)
    positional_args+=("${1}")
    shift
    ;;
  esac
 done


 #for ((i = from_partition; i <= to_partition; i++)); do
  echo "Begin rule reducing."
  gradle :superopt:run --args="ReduceRules -R=${in} -o=${out}"
  echo "$(wc -l "${data_dir}/${out}" | cut -f1 -d' ') non-reducible rules discovered."
 #done
done
