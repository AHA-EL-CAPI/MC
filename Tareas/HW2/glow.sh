# Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#!/bin/bash

let x=0 # Defino una variable que uso para llamar a circle.sh posteriormente.
while true
do
	clear # Limpia la terminal de tal forma que solo se muestra cada uno de los círculos graficados posteriormente.
	./circle.sh $(echo "c($x/10)*c($x/10)" | bc -l) # Grafica un círculo con el radio cos²(x/10). 
	let x++ # Avance de la variable usada para los radios de los círculos.
	sleep 0.5 # Regula la velocidad con la cual se grafican los círculos.
done