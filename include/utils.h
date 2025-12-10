// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>

// Array generation functions
void generate_random(int *arr, int n);
void generate_sorted(int *arr, int n);
void generate_reverse(int *arr, int n);

// Copy array (for testing same data on different algorithms)
void copy_array(int *source, int *dest, int n);

// Check if array is sorted (for verification)
int is_sorted(int *arr, int n);

// Benchmark a sorting function
double benchmark_sort(void (*sort_func)(int *, int), int *arr, int n);

// Run full benchmark and save to CSV
void run_full_benchmark(char *filename);

#endif