#!/bin/bash

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (não considera peso) \n Score"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_010.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_iguais.dat" u 1:2 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:8 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:4 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:10 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (não considera peso) \n Recursos"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_011.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_iguais.dat" u 1:3 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:9 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:5 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:11 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (não considera peso) \n Score e Recursos"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_012.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_iguais.dat" u 1:6 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:12 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:7 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:13 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (peso rebaixados > existentes > promovidos) \n Score"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_013.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_d_e_p.dat" u 1:2 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:8 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:4 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:10 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (peso rebaixados > existentes > promovidos) \n Recursos"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_014.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_d_e_p.dat" u 1:3 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:9 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:5 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:11 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (peso rebaixados > existentes > promovidos) \n Score e Recursos"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_015.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_d_e_p.dat" u 1:6 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:12 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:7 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:13 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (peso rebaixados > existentes = promovidos) \n Score"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_016.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_d_ep.dat" u 1:2 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:8 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:4 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:10 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (peso rebaixados > existentes = promovidos) \n Recursos"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_017.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_d_ep.dat" u 1:3 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:9 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:5 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:11 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

gnuplot -persist <<-EOFMarker
reset
set title "PRECISÃO - TÉCNICA DE ORDENAMENTO SIMPLES \n Qtde de Jogadores Promovidos Varia (peso rebaixados > existentes = promovidos) \n Score e Recursos"
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
set xlabel "Número de Jogadores Promovidos"
set datafile separator ";"
set term eps
set output "experimentD_investigation01_018.eps"
set border 3
set pointintervalbox 3
plot "variando_promoted_pesos_d_ep.dat" u 1:6 t "Hit Rebaixados (com d)" with lines ls 3, "" u 1:12 t "Hit Rebaixados (sem d)" with lines ls 4, "" u 1:7 t "Hit Promovidos (com d)" with lines ls 5, "" u 1:13 t "Hit Promovidos (sem d)" with lines ls 6
EOFMarker

