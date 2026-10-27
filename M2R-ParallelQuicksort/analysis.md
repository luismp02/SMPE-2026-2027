###   Computer specifications
- Intel Core Ultra 9 285H 16 physical cores 16 logical CPUs.

## First observations

- The parallel version becomes more competitive as the array size increases.
- Compared with the sequential version, the mean speedup is below 1 for all tested sizes.
- For arrays of 5 and 10 million elements, the parallel version is faster in some individual runs.
- The mean speedup is almost the same for 5 and 10 million elements.
- The results vary between runs, especially for larger arrays.
- Each size was tested 10 times -> confidence intervals are just a first estimate.

## Next steps

- Look at the absolute execution times and time differences.
- Run more repetitions to check how stable the results are.
