# Clase del 27 de Mayo de 2015
Primera clase de **Métodos Computacionales** 

Las herramientas que vamos a usar en este curso son:

+ git
+ gitHub
+ bash
+ C
+ Python
 
Los métodos a estudiar son:

	1. Interpolación
	2. Análisis de Fourier.
	3. Diferenciación e integración numérica.
	4. Ecuaciones diferenciales ordinarias.
	5. Ecuaciones diferenciales parciales.
	6. Métodos de Monte Carlo.

# Clase del 29 de Mayo de 2015

## HandsOn-1

### Usos del comando git

Se usaron los comandos `git checkout` y `git log` para revisar un commit realizado en el curso de Métodos Computacionales en el semestre 2013-1

# Clase del 2 de Junio de 2015

## Hands-On2

###Expresiones regulares

La expresión regular que representa cuatro caracteres al inicio de una línea seguidos de un espacio, es.
 ```
 ^(.... ) 
 ```

En esta clase se comenzó a usar `gnuplot`, una herramienta que permite realizar diversas gráficas desde la terminal.
Uno de los ejemplos trabajados en clase fue el siguiente:
```
gnuplot

set term dumb

set parametric

set size ratio 1

set datafile separator ","

plot "$1" using $2:$3
```

El anterior código corresponde a un programa en bash que recibe un archivo (`$1`) y dos de sus columnas (`$2` y `$3`) como parámetros y hace una gráfica paramétrica de las mencionadas columnas.Fue probado con el archivo de las lunas de Júpiter.

Posteriormente, se realizó la división, en líneas con 20 caracteres, de los primeros 10 millones de decimales de pi. El código utilizado fue el siguiente:

```
curl -s http://pi.karmona.com/ | sed 's/<[^>]*>//g' | sed 's/Pi \- 10 Million Digits\ @ http:\/\/Pi.Karmona.com//g' | sed 's/Pi \- 10 Million Digits//g' | sed 's/.\{20\}/&\n/g' > pi.txt
```

Donde:

+ `curl`: Obtiene el código fuente de la página proporcionada.

+ `sed`: Busca y remplaza caracteres de acuerdo a los parámetros dados.

+ `.\{20\`: Expresión regular usada para dividir el documento en líneas de 20 caracteres

### Más sobre gnuplot

En la clase se usó EOF para poner varias líneas de código consecutivas en gnuplot. SU forma de uso es la siguiente: 
```
	gnuplot << EOF
	# Aquí van las líneas de código deseadas.
	EOF
```

# Clase del 3 de Junio de 2015

## Profundización en Gnuplot

Se usaron datos de la página http://www.exchange-rates.org/history/COP/USD/T, que contiene información sonbre la historia de tasas de cambio entre dólares estadounidenses y pesos comlobianos. Dicha página se visualizó en la terminal con el siguiente código:
```
w3m http://www.exchange-rates.org/history/COP/USD/T
```
Luego se tomó la tabla contenida en esa página con el comando grep de la siguiente manera:
```
| grep USD COP rate for
```
Además de lo anterior, se trató la susodicha tabla para tener solo la información de interés y para poder graficar se configuró el formato de fechas en gnuplot con los comandos:
```
set xdata time
set timefmt "%m/%d/%Y"
```
Donde "%m/%d/%Y" es el formato de fecha dado en el sitio web.

Finalmente, se trabajó un ejemplo acerca de cómo hacer regresiones con gnuplot, haciendo uso de la herramienta `fit` y del archivo `galaxies.csv`:
```
y(x)=m*x+b
fit y(x) 'galaxies.csv' using 2:3 via m,b
```