// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
#include "utils.h"
#include "sorts.h"
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stdio.h>

// Generate array with random numbers
void generate_random(int *arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        arr[i] = rand() % 10000; // Random numbers 0-9999
    }
}

// Generate already sorted array
void generate_sorted(int *arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        arr[i] = i;
    }
}

// Generate reverse sorted array (worst case for some algorithms)
void generate_reverse(int *arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        arr[i] = n - i;
    }
}

// Copy one array to another
void copy_array(int *source, int *dest, int n)
{
    for (int i = 0; i < n; i++)
    {
        dest[i] = source[i];
    }
}

// Check if array is sorted correctly
int is_sorted(int *arr, int n)
{
    for (int i = 0; i < n - 1; i++)
    {
        if (arr[i] > arr[i + 1])
        {
            return 0; // Not sorted
        }
    }
    return 1; // Sorted
}

// Benchmark a sorting function - returns time in milliseconds
double benchmark_sort(void (*sort_func)(int *, int), int *arr, int n)
{
    clock_t start, end;

    start = clock();
    sort_func(arr, n);
    end = clock();

    double time_ms = ((double)(end - start) / CLOCKS_PER_SEC) * 1000.0;
    return time_ms;
}

// Run complete benchmark on all your algorithms
void run_full_benchmark(char *filename)
{
    // Save to data folder
    char filepath[256];
    snprintf(filepath, sizeof(filepath), "data/%s", filename);

    FILE *file = fopen(filepath, "w");
    if (file == NULL)
    {
        printf("Error opening file! Make sure 'data' folder exists.\n");
        return;
    }

    // Write CSV header
    fprintf(file, "Algorithm,Size,Time_ms\n");

    // Test sizes
    int sizes[] = {1000, 2000, 5000, 10000, 20000, 50000, 100000};
    int num_sizes = 7;

    printf("Running benchmarks...\n");

    for (int i = 0; i < num_sizes; i++)
    {
        int size = sizes[i];
        printf("Testing size: %d\n", size);

        // Allocate arrays
        int *original = (int *)malloc(size * sizeof(int));
        int *test = (int *)malloc(size * sizeof(int));

        // Generate random test data
        generate_random(original, size);

        // Test Quick Sort
        copy_array(original, test, size);
        double time = benchmark_sort(quick_sort, test, size);
        fprintf(file, "Quick Sort,%d,%.2f\n", size, time);
        printf("  Quick Sort: %.2f ms\n", time);

        // Test Merge Sort
        copy_array(original, test, size);
        time = benchmark_sort(merge_sort, test, size);
        fprintf(file, "Merge Sort,%d,%.2f\n", size, time);
        printf("  Merge Sort: %.2f ms\n", time);

        // Test Heap Sort
        copy_array(original, test, size);
        time = benchmark_sort(heap_sort, test, size);
        fprintf(file, "Heap Sort,%d,%.2f\n", size, time);
        printf("  Heap Sort: %.2f ms\n", time);

        free(original);
        free(test);
    }

    fclose(file);
    printf("Benchmark complete! Results saved to %s\n", filepath);
}