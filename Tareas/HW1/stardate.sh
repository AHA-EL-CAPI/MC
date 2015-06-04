#./bin/bash

echo "##########################################"
figlet StarDate # Coloco Stardate en el formato solicitado
echo "##########################################"
figlet $1 # Coloco el año en el formato solicitado.


awk -v new1="$1" -F"\t" '{if ($1 == new1) print $2}' worldhistory.tsv # Muestro el evento histórico correspondiente.

echo "##########################################"

echo LOOK AT THE FOLLOWING STARS:

echo RA/          DEC/             HIP No.

# Guardo el parámetro del programa y selecciono las estrellas que satisfacen los parámetros requeridos.
awk -v new2="$1" -F"," '{if($10<(2015-new2+1) && $10>(2015-new2)) print $8,$9,$2}' hyg.csv | head -5
