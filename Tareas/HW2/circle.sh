#!/bin/bash
gnuplot << EOF
set term dumb
set size square 
set size ratio 1
set parametric
set trange [0:2*pi]
x(t) = $1*cos(t)
y(t) = $1*sin(t)
plot x(t), y(t)
EOF