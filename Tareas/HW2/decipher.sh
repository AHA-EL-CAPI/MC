# Grupo de Trabajo: Alejandro Hernández A. y Nicolás A. Morales D.
#!/bin/bash

cat $input >> ar.txt # Envío los caracteres pasados por parámetro a un archivo de texto.

for i in {1..10}
do
./flip.sh v z ar.txt > ar2.txt
./flip.sh h y ar2.txt > ar.txt
./flip.sh p x ar.txt > ar2.txt
./flip.sh u w ar2.txt > ar.txt
./flip.sh z v ar.txt > ar2.txt
./flip.sh s u ar2.txt > ar.txt
./flip.sh f t ar.txt > ar2.txt
./flip.sh g s ar2.txt > ar.txt
./flip.sh x r ar.txt > ar2.txt
./flip.sh e q ar2.txt > ar.txt
./flip.sh d p ar.txt > ar2.txt
./flip.sh r o ar2.txt > ar.txt
./flip.sh m n ar.txt > ar2.txt
./flip.sh b m ar2.txt > ar.txt
./flip.sh j l ar.txt > ar2.txt
./flip.sh a k ar2.txt > ar.txt
./flip.sh c j ar.txt > ar2.txt
./flip.sh y i ar2.txt > ar.txt
./flip.sh k h ar.txt > ar2.txt
./flip.sh t g ar2.txt > ar.txt
./flip.sh q f ar.txt > ar2.txt
./flip.sh o e ar2.txt > ar.txt
./flip.sh l d ar.txt > ar2.txt
./flip.sh w c ar2.txt > ar.txt
./flip.sh n b ar.txt > ar2.txt
./flip.sh i a ar2.txt > ar.txt
done
# Con el for anterior utilizo repetridas veces a flip.sh para realizar los intercambios de letras dados en la tarea con el fin de descubrir el mensaje oculto. Se manejan simultáneamente 2 archivos de texto que se eliminarán al final del método.
cat ar.txt # Muestro en pantalla el mensaje descifrado.

rm ar2.txt
rm ar.txt # Elimino los archivos de texto usados en el método.