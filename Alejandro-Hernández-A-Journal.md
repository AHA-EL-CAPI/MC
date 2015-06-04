##Primera clase
**Métodos Computacionales** vacaciones 2015

Herramientas del curso:
+ git
+ GitHub
+ bash
+ C
+ Python

##Semana 2 

+ '^(.... )' Expresión regular que representa cuatro caracteres al inicio de una línea con un espacio a continuación.

gnuplot

set term dumb

set parametric

set size ratio 1

set datafile separator ","

plot "$1" using $2:$3

+ Este código corresponde al programa en bash que recibe un archivo y dos de sus columnas y hace una gráfica paramétrica de las columnas. Fue probado con el archivo de las lunas de Júpiter.

+ Para separar el archivo de dígitos de Pi seleccionamos lo siguiente y lo reemplazamos por nada:
```
\<.*\> :# Quitamos toda la información extra que viene de la página.

:.* :# Quitamos el contador de dígitos de pi.

\D :# Quitamos las letras PI al inicio.

\n :# Juntamos todas las líneas en una para poderlas separar luego.
```
+ Finalmente en la terminal ejecutamos el siguiente comando al archivo
```
sed 's/.\{20\}/&\n/g' PI.txt
```
Separamos los caracteres en grupos de 20 y le damos espacio para que el archivo nos quede en líneas como se desea. Obtuve el archivo de la página https://archive.org/stream/Pi_to_100000000_places/pi.txt, lo que al parecer lo hacía más complicado pero ya lo dejé así.