#Taller 6 - Cinemática
*Métodos Computacionales - Laboratorio*

24-Jun-2015

## Un paseo en el parque X 12 ✵ 

2. El archivo [running_dirty_nov.gpx](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/running_dirty_nov.gpx) tiene la longitud, latitud, altura, y tiempo de un paseo por la ciudad. 

	![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/trip.png?raw=true =500x)

	* ✵ Procese el archivo para dejarlo en un formato fácil de importar a Python.

		Esta parte se hizo mediante el programa Sublime Text.

	* ✵ Haciendo los cambios de unidades pertinentes y teniendo en cuenta las características del [sistema de coordenadas esférico](http://mathworld.wolfram.com/SphericalCoordinates.html), calcular las coordenadas cartesianas de cada una de las posiciones registradas.


```python
import numpy as np
import matplotlib.pyplot as plt
from tabulate import tabulate
%matplotlib inline

# Se importa la información necesaria para realizar el taller.
doc = np.genfromtxt("running_dirty_nov.gpx.txt",delimiter=",")
lon = doc[:,0]
lat = doc[:,1]
height = doc[:,2]
hours = doc[:,3]
minutes = doc[:,4]
sec = doc[:,5]

time = hours + minutes/60 + sec/3600

# Definición de las coordenadas cartesianas a partir de los datos de latitud y longitud.

R = 6378.1 # Radio de la tierra en Km.

x = R * np.cos(lat*np.pi/180.) * np.cos(lon*np.pi/180.)

y = R * np.cos(lat*np.pi/180.) * np.sin(lon*np.pi/180.)

z = R * np.sin(lat*np.pi/180.)
```

	* ✵ Después calcular los vectores de desplazamiento espacio-temporal tomando como referencia la primera posición registrada. Desprecie la altura.

```python
# Cálculo de los desplazamientos espacio-temporales.
disx = x - x[0]
disy = y - y[0]
disz = z - z[0]
dist = time - time[0] # Array de tiempo en horas.
```

	* ✵ Usando vectores unitarios en dirección norte y oriente, calcule las coordenadas de los vectores de desplazamiento en ese sistema de coordenadas local. Tome como coordenadas de referencia: latitud 4.5981, longitud -74.0758. Haga una gráfica con la trayectoria. Si quiere que aparezca junto con un mapa busque información sobre **smopy**. 

```python
# Cálculo de las coordenadas locales usando como referencia la latitud y longitud de Bogotá.
lat_ref = 4.5981
lon_ref = -74.0758

x1_ref = -np.sin(lon_ref*np.pi/180.)
y1_ref = np.cos(lon_ref*np.pi/180.)
z1_ref = 0.

x2_ref = -np.cos(lon_ref*np.pi/180.)*np.sin(lat_ref*np.pi/180.)
y2_ref = -np.sin(lon_ref*np.pi/180.)*np.sin(lat_ref*np.pi/180.)
z2_ref = np.cos(lat_ref*np.pi/180.)

# Definición de los vectores norte y oriente.
east = [disx[i]*x1_ref + disy[i]*y1_ref + disz[i]*z1_ref for i in range(len(disx))]
north = [disx[i]*x2_ref + disy[i]*y2_ref + disz[i]*z2_ref for i in range(len(disx))]

# Gráfica de la trayectoria.
plt.figure(figsize=(15,15))
plt.plot(east,north)
plt.axis('equal')
plt.show()
```

	* ✵✵ Ahora calcule la distancia recorrida en función del tiempo estimando numéricamente la integral

		![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/dist_int.png?raw=true =200x). 
		
		Haga una gráfica.

	![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/tripdist.png?raw=true =500x).

```python
# Cálculo y gráfica de la distancia recorida vs tiempo.
r = [np.sqrt((east[i+1]-east[i])**2 + (north[i+1]-north[i])**2) for i in range(0,len(east)-1,1)]
r.insert(0,0) # Array de distancias inividuales.

r_new = np.cumsum(r)

plt.figure(figsize=(15,15))
plt.plot(dist,r_new)
plt.show()
```
	
	* ✵ Estime el tiempo requerido para terminar de recorrer 1, 2 .. 9 km y la posición (en latitud y longitud) en esos instantes.

```python
# Función que retorna el tiempo necesario para recorrer una distancia pasada por parámetro,
# además de la latitud y longitud de la posición final.
def time_required_lat_lon(distance):
    index = 0
    while(r_new[index]<=distance):
        index += 1
    return [distance,dist[index],lat[index],lon[index]]

# Tabla con la información sobre las distancias solicitadas.
table = []
for i in range(1,10,1):
    table.append(time_required_lat_lon(i))
    
headers = ['Dinstance traveled in Km','Approximate time required','Latitude','Longitude']
print tabulate(table,headers,tablefmt="fancy_grid", numalign="center",stralign='center')
```

	* ✵✵ Ahora calcule la rapidez en función del tiempo usando *forward differences*. Tenga en cuenta que los datos no están uniformemente espaciados.

```python
# Cálculo y gráfica de las rapideces, partiendo del array de distancias individuales y del array de tiempo en horas definidos previamente.
# Se tomó como base el cuaderno 08-Numerical Derivatives.ipnb.
numPoints=len(r)
a=min(dist) # Límite inferior.
b=max(dist) # Límite superior.

h = (b-a)/(numPoints-1) # Paso del arreglo x.
yforward = np.roll(r,-1) # Mover el array una posición hacia la izquierda.

# Calcular las derivada usando forward differences.
vel = (yforward-r)/h
vel = vel[:-1] 

# Gráfica del array de velocidades.
plt.figure(figsize=(20,5))
plt.plot(dist[:-1],vel,"o-",label="Foward differences")
plt.xlim(a,b)
plt.legend(loc='best')
plt.show()
```		

	* ✵✵✵ Lo anterior debe resultar muy irregular, proponga alguna estrategia para obtener algo más razonable e impleméntela.
	



