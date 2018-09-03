#!/bin/bash

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (não considera peso) \n Score"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Score"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_001.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_iguais.dat" u 1:2 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:8 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:4 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:10 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (não considera peso) \n Recursos"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Recursos"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_002.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_iguais.dat" u 1:3 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:9 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:5 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:11 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (não considera peso) \n Score e Recursos"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Score e Recursos"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_003.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_iguais.dat" u 1:6 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:12 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:7 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:13 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (peso rebaixados > existentes > promovidos) \n Score"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Score"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_004.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_d_e_p.dat" u 1:2 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:8 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:4 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:10 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (peso rebaixados > existentes > promovidos) \n Recursos"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Recursos"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_005.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_d_e_p.dat" u 1:3 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:9 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:5 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:11 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (peso rebaixados > existentes > promovidos) \n Score e Recursos"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Score e Recursos"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_006.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_d_e_p.dat" u 1:6 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:12 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:7 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:13 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (peso rebaixados > existentes = promovidos) \n Score"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Score"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_007.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_d_ep.dat" u 1:2 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:8 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:4 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:10 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (peso rebaixados > existentes = promovidos) \n Recursos"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Recursos"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_008.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_d_ep.dat" u 1:3 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:9 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:5 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:11 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Rebaixados Varia (peso rebaixados > existentes = promovidos) \n Score e Recursos"
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
    
set yrange [0:30]
set xrange [0:30]
set grid y 
set tics font ", 7"
set boxwidth 0.95
set xtic scale 0.5
set ytic scale 0.5 
set ylabel "Número de Hit por Score e Recursos"
set xlabel "Número de Jogadores Rebaixados"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_009.eps"
set border 3
set pointintervalbox 3
plot "variando_demoted_pesos_d_ep.dat" u 1:6 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:12 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:7 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:13 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

