###   Computer specifications
- Intel Core Ultra 9 285H 16 physical cores 16 logical CPUs.

## First observations running in my machine, mixing runs order, 
- The parallel version becomes more competitive as the array size increases.
- Compared with the sequential version, the mean speedup is below 1 for all tested sizes.
- For arrays of 5 and 10 million elements, the parallel version is faster in some individual runs.
- The mean speedup is almost the same for 5 and 10 million elements.
- The results vary between runs, especially for larger arrays.
- Each size was tested 10 times -> confidence intervals are just a first estimate.

## Notes on the experimental design

- The original experiment tested five sizes, with five runs per size -> Test more sizes
- No sizes were tested between 100,000 and 1 million. The claimed crossover at 400,000 was not directly measured. 
- The original results come from one machine. They may not apply to another machine so it will be interesting to compare with my colleagues.


## Next steps:
- Test more sizes (intermediate and above 10 million.)
- Run more repetitions per size.
- Compare execution times and speedups, with confidence intervals.

### Preliminary results

- In the new experiment, parallel quicksort has a median speedup above 1 from 2.5 million elements onward.
- Parallel is faster in many runs, but not in all of them.
- Results differ from the first experiment, where mean speedup remained below 1 for all tested sizes


#### Next step (TO DO): separate the experiment (sizes // random runs order) in order to know which is the source of results variability. Maybe randomising the order explains the difference, maybe it was due to changing the sample size, we cannot conclude with one experiment doing every change at the same time 
