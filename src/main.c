// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
// DO NOT TOUCH THIS FILE, MAT9ISO HTA HAJA HNA
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "sorts.h"
#include "utils.h"

int main()
{
    // seeding
    srand(time(NULL));

    printf("=== Sorting Algorithms Benchmark ===\n\n");

    // Quick test to verify algorithms work
    printf("Testing algorithms with small array...\n");
    int test_arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = 7;

    printf("Original: ");
    for (int i = 0; i < n; i++)
        printf("%d ", test_arr[i]);
    printf("\n");

    quick_sort(test_arr, n);

    printf("Sorted:   ");
    for (int i = 0; i < n; i++)
        printf("%d ", test_arr[i]);
    printf("\n");

    if (is_sorted(test_arr, n))
    {
        printf("✓ Algorithm works correctly!\n\n");
    }
    else
    {
        printf("✗ Algorithm failed!\n\n");
        return 1; // return of failing
    }

    // Run full benchmark
    printf("Starting full benchmark...\n");
    printf("This may take a few minutes...\n\n");

    run_full_benchmark("results.csv");

    printf("\nDone! Check results.csv for data.\n");
    printf("Use GNUPlot to visualize the results.\n");

    return 0;
}