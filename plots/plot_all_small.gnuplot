// ajouti hado f lmakefile : 
  plots:
    gnuplot plots/plot_all_small.gnuplot
    gnuplot plots/plot_fast_large.gnuplot



set terminal pngcairo size 1200,800
set output "plots/all_small.png"

set title "Performance des algorithmes (petites tailles)"
set xlabel "Taille du tableau"
set ylabel "Temps d'exécution (ms)"

set grid

plot \
    "data/results.csv" using 1:2 with lines lw 2 title "Insertion Sort", \
    "" using 1:3 with lines lw 2 title "Selection Sort", \
    "" using 1:4 with lines lw 2 title "Bubble Sort", \
    "" using 1:5 with lines lw 2 title "Shell Sort", \
    "" using 1:6 with lines lw 2 title "Merge Sort", \
    "" using 1:7 with lines lw 2 title "Quick Sort", \
    "" using 1:8 with lines lw 2 title "Heap Sort"
