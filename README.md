# Sorting Algorithms Project - Team Guide

## Quick Start

### How to Compile

```bash
gcc -Wall -O2 -Iinclude src/main.c src/sorts.c src/utils.c -o benchmark
```

### How to Run

```bash
./benchmark
```

That's it! The program will test the algorithms and create `data/results.csv` with timing results.

---

For Linux user just run or mingw, just run make then ./benchmark. if not, just use the one line i put under how to compile.

### How to Run plotting

```bash
gnuplot generate_all_plots.gnu
```

make sure you have gnuplot installed tho, and add it to system variables too.
