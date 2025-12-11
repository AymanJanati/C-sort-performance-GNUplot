# MASTER SCRIPT - Generates ALL plots at once!
# Run with: gnuplot generate_all_plots.gnu

set datafile separator ","

print "========================================="
print "  Generating Professional Plots"
print "========================================="
print ""

# ============ Plot 1: ALL ALGORITHMS ============
print "📊 Generating: all_algorithms.png..."
set terminal pngcairo size 1800,1100 enhanced font "Arial,13"
set output "plots/all_algorithms.png"

set title "Comparaison Complète des 7 Algorithmes de Tri" font "Arial,22 bold"
set xlabel "Taille du tableau (nombre d'éléments)" font "Arial,16"
set ylabel "Temps d'exécution (millisecondes)" font "Arial,16"

unset logscale
set grid xtics ytics lt 0 lw 1 lc rgb "#dddddd"
set key top left box opaque font "Arial,12"
set border lw 2

set style line 1 lc rgb '#e41a1c' lt 1 lw 2.5 pt 7 ps 1.5
set style line 2 lc rgb '#377eb8' lt 1 lw 2.5 pt 9 ps 1.5
set style line 3 lc rgb '#4daf4a' lt 1 lw 2.5 pt 11 ps 1.5
set style line 4 lc rgb '#984ea3' lt 1 lw 2.5 pt 13 ps 1.5
set style line 5 lc rgb '#ff7f00' lt 1 lw 2.5 pt 5 ps 1.5
set style line 6 lc rgb '#a65628' lt 1 lw 2.5 pt 15 ps 1.5
set style line 7 lc rgb '#f781bf' lt 1 lw 2.5 pt 17 ps 1.5

plot '../data/results.csv' using 2:3 every 7::0 with linespoints ls 1 title "Quick Sort", \
     '' using 2:3 every 7::1 with linespoints ls 2 title "Merge Sort", \
     '' using 2:3 every 7::2 with linespoints ls 3 title "Heap Sort", \
     '' using 2:3 every 7::3 with linespoints ls 4 title "Shell Sort", \
     '' using 2:3 every 7::4 with linespoints ls 5 title "Insertion Sort", \
     '' using 2:3 every 7::5 with linespoints ls 6 title "Selection Sort", \
     '' using 2:3 every 7::6 with linespoints ls 7 title "Bubble Sort"

# ============ Plot 2: FAST ALGORITHMS ============
print "📊 Generating: fast_algorithms.png..."
set output "plots/fast_algorithms.png"

set title "Algorithmes Rapides - O(n log n)" font "Arial,20 bold"

set style line 1 lc rgb '#e41a1c' lt 1 lw 3 pt 7 ps 2
set style line 2 lc rgb '#377eb8' lt 1 lw 3 pt 9 ps 2
set style line 3 lc rgb '#4daf4a' lt 1 lw 3 pt 11 ps 2
set style line 4 lc rgb '#984ea3' lt 1 lw 3 pt 13 ps 2

plot '../data/results.csv' using 2:3 every 7::0 with linespoints ls 1 title "Quick Sort", \
     '' using 2:3 every 7::1 with linespoints ls 2 title "Merge Sort", \
     '' using 2:3 every 7::2 with linespoints ls 3 title "Heap Sort", \
     '' using 2:3 every 7::3 with linespoints ls 4 title "Shell Sort"

# ============ Plot 3: SLOW ALGORITHMS ============
print "📊 Generating: slow_algorithms.png..."
set output "plots/slow_algorithms.png"

set title "Algorithmes Lents - O(n²)" font "Arial,20 bold"

set style line 5 lc rgb '#ff7f00' lt 1 lw 3 pt 5 ps 2
set style line 6 lc rgb '#a65628' lt 1 lw 3 pt 15 ps 2
set style line 7 lc rgb '#f781bf' lt 1 lw 3 pt 17 ps 2

plot '../data/results.csv' using 2:3 every 7::4 with linespoints ls 5 title "Insertion Sort", \
     '' using 2:3 every 7::5 with linespoints ls 6 title "Selection Sort", \
     '' using 2:3 every 7::6 with linespoints ls 7 title "Bubble Sort"

# ============ Plot 4: BEST COMPARISON ============
print "📊 Generating: best_comparison.png..."
set output "plots/best_comparison.png"

set title "Meilleurs Algorithmes par Catégorie" font "Arial,20 bold"

set style line 1 lc rgb '#e41a1c' lt 1 lw 4 pt 7 ps 2.5
set style line 4 lc rgb '#984ea3' lt 1 lw 4 pt 13 ps 2.5
set style line 5 lc rgb '#ff7f00' lt 1 lw 4 pt 5 ps 2.5

plot '../data/results.csv' using 2:3 every 7::0 with linespoints ls 1 title "Quick Sort (O(n log n))", \
     '' using 2:3 every 7::3 with linespoints ls 4 title "Shell Sort (O(n^1.5))", \
     '' using 2:3 every 7::4 with linespoints ls 5 title "Insertion Sort (O(n²))"

# ============ Plot 5: LOGARITHMIC ============
print "📊 Generating: logarithmic_comparison.png..."
set output "plots/logarithmic_comparison.png"

set title "Analyse Logarithmique - Tous les Algorithmes" font "Arial,20 bold"
set xlabel "Taille du tableau (échelle log)" font "Arial,15"
set ylabel "Temps d'exécution (ms, échelle log)" font "Arial,15"

set logscale xy
set format x "10^{%L}"
set format y "10^{%L}"

set style line 1 lc rgb '#e41a1c' lt 1 lw 2.5 pt 7 ps 1.5
set style line 2 lc rgb '#377eb8' lt 1 lw 2.5 pt 9 ps 1.5
set style line 3 lc rgb '#4daf4a' lt 1 lw 2.5 pt 11 ps 1.5
set style line 4 lc rgb '#984ea3' lt 1 lw 2.5 pt 13 ps 1.5
set style line 5 lc rgb '#ff7f00' lt 1 lw 2.5 pt 5 ps 1.5
set style line 6 lc rgb '#a65628' lt 1 lw 2.5 pt 15 ps 1.5
set style line 7 lc rgb '#f781bf' lt 1 lw 2.5 pt 17 ps 1.5

plot '../data/results.csv' using 2:($3 < 0.1 ? 0.1 : $3) every 7::0 with linespoints ls 1 title "Quick Sort", \
     '' using 2:($3 < 0.1 ? 0.1 : $3) every 7::1 with linespoints ls 2 title "Merge Sort", \
     '' using 2:($3 < 0.1 ? 0.1 : $3) every 7::2 with linespoints ls 3 title "Heap Sort", \
     '' using 2:($3 < 0.1 ? 0.1 : $3) every 7::3 with linespoints ls 4 title "Shell Sort", \
     '' using 2:($3 < 0.1 ? 0.1 : $3) every 7::4 with linespoints ls 5 title "Insertion Sort", \
     '' using 2:($3 < 0.1 ? 0.1 : $3) every 7::5 with linespoints ls 6 title "Selection Sort", \
     '' using 2:($3 < 0.1 ? 0.1 : $3) every 7::6 with linespoints ls 7 title "Bubble Sort"

print ""
print "✅ SUCCESS! All plots generated!"
print ""
print "Generated plots in plots/ folder:"
print "  📈 all_algorithms.png - Complete comparison"
print "  📈 fast_algorithms.png - O(n log n) algorithms"
print "  📈 slow_algorithms.png - O(n²) algorithms"
print "  📈 best_comparison.png - Best of each category"
print "  📈 logarithmic_comparison.png - Log scale view"
print ""
print "========================================="