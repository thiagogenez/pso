#!/bin/bash

gnuplot -persist <<-EOFMarker
reset
set title "DESEMPENHO - ORDENAMENTO SEQUÊNCIAL \n A Qtde de Atributos Aumenta Incrementalmente"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:0.006]
set xrange [0:100]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Media do Tempo de Execução"
set xlabel "Número de Atributos"
set datafile separator ";"
set term eps
set output "experimentD_investigation02_001.eps"
set border 3
set pointintervalbox 3
plot "variando_atributos.dat" u 1:2 t "Tempo de Execução com d" with lines ls 3, "" u 1:4 t "Tempo de execução sem d" with lines ls 4
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "DESEMPENHO - ORDENAMENTO SEQUÊNCIAL \n A Qtde de Atributos Aumenta Incrementalmente"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:0.006]
set xrange [0:100]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Desvio Padrão das Amostras"
set xlabel "Amostras"
set datafile separator ";"
set term eps
set output "experimentD_investigation02_002.eps"
set border 3
set pointintervalbox 3
plot "variando_atributos.dat" u 1:3 t "Desvio Padrão com d" with lines ls 3, "" u 1:5 t "Desvio Padrão sem d" with lines ls 4
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "DESEMPENHO - ORDENAMENTO SEQUÊNCIAL \n A Qtde de Jogadores Aumenta Incrementalmente"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:0.01]
set xrange [0:100]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Media do Tempo de Execução"
set xlabel "Número de Jogadores (de um conjunto x 3)."
set datafile separator ";"
set term eps
set output "experimentD_investigation02_003.eps"
set border 3
set pointintervalbox 3
plot "variando_jogadores.dat" u 1:2 t "Tempo de Execução com d" with lines ls 3, "" u 1:4 t "Tempo de execução sem d" with lines ls 4
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "DESEMPENHO - ORDENAMENTO SEQUÊNCIAL \n A Qtde de Jogadores Aumenta Incrementalmente"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:0.01]
set xrange [0:100]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Desvio Padrão das Amostras"
set xlabel "Amostras"
set datafile separator ";"
set term eps
set output "experimentD_investigation02_004.eps"
set border 3
set pointintervalbox 3
plot "variando_jogadores.dat" u 1:3 t "Desvio Padrão com d" with lines ls 3, "" u 1:5 t "Desvio Padrão sem d" with lines ls 4
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "DESEMPENHO - ORDENAMENTO SEQUÊNCIAL \n A Qtde de Atributos e Jogadores Aumenta Incrementalmente"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:0.12]
set xrange [0:100]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Media do Tempo de Execução"
set xlabel "Número de Jogadores e Atributos"
set datafile separator ";"
set term eps
set output "experimentD_investigation02_005.eps"
set border 3
set pointintervalbox 3
plot "variando_jogadores_atributos.dat" u 1:2 t "Tempo de Execução com d" with lines ls 3, "" u 1:4 t "Tempo de execução sem d" with lines ls 4
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "DESEMPENHO - ORDENAMENTO SEQUÊNCIAL \n A Qtde de Atributos e Jogadores Aumenta Incrementalmente"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:0.1]
set xrange [0:100]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Desvio Padrão das Amostras"
set xlabel "Amostras"
set datafile separator ";"
set term eps
set output "experimentD_investigation02_006.eps"
set border 3
set pointintervalbox 3
plot "variando_jogadores_atributos.dat" u 1:3 t "Desvio Padrão com d" with lines ls 3, "" u 1:5 t "Desvio Padrão sem d" with lines ls 4
EOFMarker

