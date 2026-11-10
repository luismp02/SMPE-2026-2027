#!/usr/bin/env bash
set -euo pipefail

output_dir="data/$(hostname)_$(date +%F)"
mkdir -p "$output_dir"

output_file="$output_dir/measurements_extended_$(date +%H%M%S).txt"

sizes=(1000000 2500000 5000000 7500000 10000000 15000000 20000000)
repetitions=20

# MIXING THE ORDER: Create and shuffle the list of runs
runs_file=$(mktemp)
trap 'rm -f "$runs_file"' EXIT

for size in "${sizes[@]}"; do
  for rep in $(seq 1 "$repetitions"); do
    printf '%s %s\n' "$size" "$rep"
  done
done | shuf > "$runs_file"

last_second=""

while read -r size rep; do
  # Wait until the clock reaches a new second
  while [[ "$(date +%s)" == "$last_second" ]]; do
    sleep 0.1
  done
  last_second=$(date +%s)

  echo "Size: $size" >> "$output_file"
  echo "Repetition: $rep" >> "$output_file"

  echo "Running size $size, repetition $rep"
  ./src/parallelQuicksort "$size" >> "$output_file"
done < "$runs_file"

echo "Results saved to: $output_file"