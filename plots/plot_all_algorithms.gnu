# Complete comparison of all 7 sorting algorithms
set terminal pngcairo size 1800,1100 enhanced font "Arial,13"
set output "plots/all_algorithms.png"

set title "Comparaison Complète des 7 Algorithmes de Tri" font "Arial,22 bold"
set xlabel "Taille du tableau (nombre d'éléments)" font "Arial,16"
set ylabel "Temps d'exécution (millisecondes)" font "Arial,16"

set datafile separator ","
set grid xtics ytics lt 0 lw 1 lc rgb "#dddddd"
set key top left box opaque font "Arial,12"
set border lw 2

# Color scheme - distinct colors for each algorithm
set style line 1 lc rgb '#e41a1c' lt 1 lw 2.5 pt 7 ps 1.5   # Quick - Red
set style line 2 lc rgb '#377eb8' lt 1 lw 2.5 pt 9 ps 1.5   # Merge - Blue
set style line 3 lc rgb '#4daf4a' lt 1 lw 2.5 pt 11 ps 1.5  # Heap - Green
set style line 4 lc rgb '#984ea3' lt 1 lw 2.5 pt 13 ps 1.5  # Shell - Purple
set style line 5 lc rgb '#ff7f00' lt 1 lw 2.5 pt 5 ps 1.5   # Insertion - Orange
set style line 6 lc rgb '#a65628' lt 1 lw 2.5 pt 15 ps 1.5  # Selection - Brown
set style line 7 lc rgb '#f781bf' lt 1 lw 2.5 pt 17 ps 1.5  # Bubble - Pink

plot '..data/results.csv' using 2:3 every 7::0 with linespoints ls 1 title "Quick Sort", \
     '' using 2:3 every 7::1 with linespoints ls 2 title "Merge Sort", \
     '' using 2:3 every 7::2 with linespoints ls 3 title "Heap Sort", \
     '' using 2:3 every 7::3 with linespoints ls 4 title "Shell Sort", \
     '' using 2:3 every 7::4 with linespoints ls 5 title "Insertion Sort", \
     '' using 2:3 every 7::5 with linespoints ls 6 title "Selection Sort", \
     '' using 2:3 every 7::6 with linespoints ls 7 title "Bubble Sort"