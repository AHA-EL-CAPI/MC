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

# Clase del 9 de Junio de 2015

## Make

En clase se vio una herramienta llamada Make que sirve para actualizar conjuntos de archivos que dependen, a su vez, de otros archivos. Es importante notar que los conjuntos de archivos pueden pensarse como grafos, cuyos nodos son diversas tareas a realizar, de tal forma que hay una jerarquía de tareas en las que unas se realizan antes que otras, recompilando en cada ocasión los archivos usados en el programa.

## Proyecto
Considerando lo visto las primeras dos semanas del curso, me gustaría tomar un determinado problema en física cuya solución requiera métodos numéricos, solucionarlo y analizar gráficamente dichas soluciones con las herramientas aprendidas. Problemas interesantes en este sentido se pueden encontrar en el campo de la materia condensada, cuando se tienen en cuenta procesos no-Markovianos, algo que aún no está muy estudiado. 

Cabe mencionar que quiero trabajar conjuntamente en el proyecto final con Nicolás A. Morales D.

# Clase del 10 de Junio de 2015

## Python

En clase se vio cómo trabajar con múltiples gráficas en python usando el comando `subplot`. EL código de python usado para hacer las gráficas solicitadas fue el siguiente:

```python
# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

%pylab inline

# <codecell>

a = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4]
b = [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4] 
delta = pi/2
t = linspace(-pi,pi,300)
figure(figsize=(20,20))
for i in range(0,16):
 x = sin(a[i]*t + delta)
 y = sin(b[i] * t)
 subplot(4,4,i+1)
 axis('off')
 axis('equal')
 plot(x,y)

savefig('foo.png', bbox_inches='tight')
show()

# <codecell>
```
![Lissajous figures](https://github.com/AHA-EL-CAPI/MC/blob/master/HandsOn/HandsOn5/Lissajous.png)

# Clase del 16 de Junio de 2015

## Interpolación

Las siguientes líneas de código corresponden a la interpolación del campo magnético de un dipolo.

```python
%pylab inline
import numpy as np
import matplotlib.pyplot as plt
from scipy import interpolate

x = np.array([2.3,2.8,3.2,3.7,4.3])
b = np.array([34745.,19689.,12594.,7982.,5822.])

from scipy.optimize import curve_fit

def func(x,m):
    return 2*m/(4*np.pi*(x**3))

nonlfit =curve_fit(func, x,b)
plt.figure(figsize=(10,5))
plt.ylabel(r'$P(\theta)$',fontsize=15)
plt.xlabel(r'$\theta$',fontsize=15)
th=np.linspace(2.3,4.3,100)
plt.plot(x,b,'or')
plt.plot(th,func(th,nonlfit[0][0]),"g")
plt.title(u'el papi',fontsize=15)
plt.show()
print 
Ahora imprimimos la tabla con los 100 valores

for i in range (100):
    print th[i],func(th,nonlfit[0][0])[i]
```

# Clase del 23 de Junio de 2015

## Tranformada de Fourier

Teniendo en cuenta los conocimientos acerca de la tranformada de Fourier y la forma de implementarla en python, el código para solucionar el hands on de este día fue el siguiente:

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import ifft, fft, fftfreq
%matplotlib inline

# Importo el archivo directamente desde la url.
file_1 = np.genfromtxt('https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesDatos/master/hands_on/solar/monthrg.dat')
year_1 = file_1[:,0] 
month_1 = file_1[:,1]
day_1 = file_1[:,2]
mean_1 = file_1[:,3]

# Nos importan solo los que tengan días distintos de cero.
year = []
month = []
mean = []
for i in range(len(day_1)):
    if(day_1[i]!=0):
        year.append(year_1[i])
        month.append(month_1[i])
        mean.append(mean_1[i])

# Queremos tener el año como decimal, así que incluyo el decimal del mes correspondiente en cada uno de los datos.
year = [year[i] + month[i]/12. for i in range(len(year))]

# Cálculo de la transformada de Fourier
mean_fou = fft(mean)
# Se define el array de frecuencias que tiene en cuenta que el espaciamiento es años, de tal forma que se obtienen
# frequencias con unidades ciclos/año.
frequency = fftfreq(len(year), 1./12.)

# Gráfica de los datos de la transformada
plt.figure(figsize=(15,10))
plt.plot(frequency,np.abs(mean_fou),'o')
# Se observó que la información relevante estaba alrededor de cero, así que nos limitamos 
# a un intervalo pequeño alrededor de cero.
plt.xlim(-0.25,0.25)
plt.show()

# Filtrado de las frecuencias
mean_fou[np.abs(frequency) >= 0.2 ] = 0.

# Gráfica de la información para ver el cambio con el filtrado.
plt.figure(figsize=(15,10))
plt.plot(frequency,np.abs(mean_fou),'o')
plt.xlim(-0.25,0.25)
plt.show()

# Transformada inversa de los datos.
filter_mean = ifft(mean_fou)

# Gráifica de los datos iniciales y de los datos filtrados en el intervalo de interés.
plt.figure(figsize=(15,10))
plt.plot(year[2988:],np.abs(filter_mean[2988:]),'r',linewidth=3.)
plt.plot(year[2988:],mean[2988:],'c',alpha=0.5)
plt.xlabel(u't/año')
plt.ylabel(u'manchas solares/mes')
plt.show()

fcut = 0.05
wanted_frequency = frequency[frequency>=fcut]
wanted_mean = np.abs(mean_fou[frequency>=fcut])
max_index = np.argmax(wanted_mean)
print "El período del ciclo solar es: " + str(1/wanted_frequency[max_index]) + " años."

```

