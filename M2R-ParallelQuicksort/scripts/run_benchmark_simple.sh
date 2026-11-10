#!/usr/bin/env bash
set -euo pipefail

output_dir="data/$(hostname)_$(date +%F)"
mkdir -p "$output_dir"

output_file="$output_dir/measurements_simple_$(date +%H%M%S).txt"

for size in 10000 100000 1000000 5000000 10000000; do
  for rep in {1..10}; do
    printf '%s %s\n' "$size" "$rep"
  done
done | shuf | while read -r size rep; do
  echo "Size: $size" >> "$output_file"
  echo "Repetition: $rep" >> "$output_file"
  ./src/parallelQuicksort "$size" >> "$output_file"
done

echo "saved: $output_file"
