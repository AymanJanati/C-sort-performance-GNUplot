set terminal pngcairo size 1200,800
set output "plots/fast_large.png"

set title "Algorithmes rapides (grandes tailles)"
set xlabel "Taille du tableau"
set ylabel "Temps d'exécution (ms)"
set grid

plot \
    "data/results.csv" using 1:5 with lines lw 2 title "Shell Sort", \
    "" using 1:6 with lines lw 2 title "Merge Sort", \
    "" using 1:7 with lines lw 2 title "Quick Sort", \
    "" using 1:8 with lines lw 2 title "Heap Sort"
