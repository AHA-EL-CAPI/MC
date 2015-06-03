#Taller 2
*Métodos Computacionales - Laboratorio*

03-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller2/. No olvide al final hacer un *commit* y un *push*.

## Lotería

1. Escriba  un script de `bash` llamado `loteria.sh` que determine si su taller es afortunado y va a ser revisado. La información necesaria siempre va a estar en el momento adecuado en el archivo [lottery](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv). Además de imprimir si el taller va a ser o no revisado también se debe imprimir la primera línea del archivo `csv` que tiene la fecha. Guárdelo en la carpeta de ejecutables de su computador.

Solución:

```
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv
head -1 lottery.csv
grep '201219580' lottery.csv | sed 's/201219580,//g'
rm lottery.csv
```

## Expresiones Regulares

2. Descargue el [archivo](http://www.minhacienda.gov.co/portal/page/portal/HomeMinhacienda/presupuestogeneraldelanacion/ProyectoPGN/2015/Presentacion%20Proyecto%202015.pdf) del Ministerio de Hacienda con información sobre el Presupuesto General de la Nación 2015. Abra el archivo, diríjase a la página 10, haga *copy-paste* los datos de la tabla comenzando en *EDUCACIÓN* y terminando en *100,0*, guárdelos en un archivo llamado `pgn.dat`. Escriba comandos de `sed` que lleven a cabo las siguientes tareas de búsqueda y reemplazo y aplíquelos secuencialmente sobre el archivo `pgn.dat`: 

	2.1 eliminar todos los puntos,

	2.2 cambiar por puntos todas las comas que estén seguidas de algún dígito,

	2.3 cambiar por `tab` todos los espacios en blanco que estén seguidos de algún dígito o por (,

	2.4 eliminar todos los paréntesis derechos,

	2.5 y por último cambiar todos los paréntesis izquierdos por -. El resultado final debe quedar guardado en el archivo `pgn.tsv`.

	2.6 Finalmente usar `sort --field-separator=$'\t' ...`  y `head` para organizar el archivo de acuerdo al cambio porcentual y encontrar el sector con el menor cambio porcentual.

Solución:

```
sed 's/\.//g' pgn.dat | sed 's/,[0-9]/,&/g' | sed 's/,,/./g' | sed 's/ [0-9(]/,,&/g' | sed 's/,, /\t/g' | sed 's/)//g' | sed 's/(/-/g' > pgn.tsv # La línea de código anterior realiza los pasos indicados en los numerales 2.1 - 2.6. usando el comando sed y diversas expresiones regulares. Finalmente se redirige el resultado al archivo pgn.tsv, cuya estensión permite manejar texto con comas de forma normal.

sort --field-separator=$'\t' --key=4 -n pgn.tsv | head -1 | awk -F"\t" '{print $1}' # Se usa el comando sort para organizar el archivo pgn.tsv de acuerdo a la columna que tiene información sobre el cambio porcentual y luego se usa head para indicar cuál tiene el menor cambio porcentual (en este caso, un cambio porcentual negativo)
```
## gnuplot

1. Haga con [Saturno](http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html) lo mismo que hicimos con Júpiter: limpiar el archivo llevándolo a formato `csv` y hacer una gráfica con `gnuplot` que evalúe la tercera ley de Kepler. Hay que tener especial cuidado con la columna para el periodo de rotación.

**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**

Solución:

```
# El proceso de limpiado fue el mismo llevado a cabo para Júpiter y no considero necesario poner esa parte del código nuevamente ya que lo hicimos en clase.
gnuplot # Abre la herramienta que voy a emplear para hacer la gráfica.
set term qt # Establece que la gráfica se va a mostrar por fuera de la terminal.
set datafile separator "\t" # Indica a gnuplot el separador del archivo que voy a graficar para poder distinguir las columnas del mismo.
quad(x) = x**2
cube(x) = x**3 # Defino funciones que necesito para verificar la tercera ley de Newton.
ylabel "Square of Period" 
xlabel "Cube of Semimajor Axis" # Defino etiquetas para los ejes x y y de la gráfica.
set title "Kepler's 3rd Law" # Defino el título de la gráfica
plot "Saturno1.txt" using (cube($3)):(quad($4)) with lines # Grafico la información proporcionada usando las funciones previamente definidas.
```
