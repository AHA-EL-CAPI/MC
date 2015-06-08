#!/bin/bash
let x=0 #Variable que se le pasa a la función.
while true
do
	clear #Borra el círculo anterior
	./circle.sh $(echo "c($x/5)*c($x/5)" | bc -l) #Grafica un círculo con el radio deseado por cada iteración. 
	let x++ #Aumenta la variable que se le pasa a la función.
	sleep 0.8 
done