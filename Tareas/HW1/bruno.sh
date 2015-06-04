#./bin/bash
echo =========================================
echo La cantidad de planetas en el catálogo es: 

awk -F"," '{print $1}' kepler.csv | sed '1d' | wc -l # Fijo "," como separador con el comando awk, uso sed para no tener en cuenta la primera línea del archivo, y uso wc  para contar los planetas.

echo =========================================

echo La cantidad planetas con una masa menor que una centésima de la masa de Júpiter son:
      
awk -F"," '{if ($2 < 0.01 && $2 > 0) print $2}' kepler.csv | wc -l # Igual que antes pero ahora impongo las condiciones deseadas sobre la masa del planeta en comparación con la masa de Júpiter.

echo Los nombres de los planetas con una masa menor que una centésima de la masa de Júpiter son:

awk -F"," '{if ($2 < 0.01 && $2 > 0) print $1}' kepler.csv # No cuento los planetas, tan solo imprimo sus nombres.

echo =====================================

echo El planeta con el menor periodo orbital es:

sort -t "," --key=6 -d kepler.csv | awk -F"," '{print $1}' | head -2 # Utilizo los comandos dados en la tarea para encontrar el planeta con las condiciones requeridas.
