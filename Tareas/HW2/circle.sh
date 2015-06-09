# Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#!/bin/bash

gnuplot<<EOF
set term dumb # Establezco que la gráfica realizada va a ser mostrada en la terminal.
set size ratio 0.5 # La proporción entre el eje x y el eje y se fija de tal forma que en mi terminal aparezca un círculo. Es posible que se tenga que poner 1 en vez de 0.5 en otros computadores.
set xrange [-1:1]
set yrange [-1:1] # Con las 2 líneas anteriores siempre grafico en una caja cuadrada de lado 2.
set parametric 
set trange [0:2*pi] # Fijo los valores que puede tomar la variable t.
unset border
unset xtics 
unset ytics 
set key off # Con las 4 líneas anteriores quito los border y la etiqueta de la gráfica.
plot $1*cos(t),$1*sin(t) # Grafico un círculo con radio dado por parámetro.
EOF