#!/bin/bash

gnuplot<<EOF
set term dumb #Hace que la gráfica se vea en la terminal  
set size ratio 1
set xrange [-1:1]
set yrange [-1:1] 
set parametric 
unset border #Quita los bordes
unset xtics #Quita los bordes
unset ytics #Quita los bordes
set key off #Quita el label de la función.
plot $1*cos(t),$1*sin(t) #Grafica un círculo.
EOF