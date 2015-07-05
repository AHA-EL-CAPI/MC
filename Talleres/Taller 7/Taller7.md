#Taller 7 - Caos
*Métodos Computacionales - Laboratorio*

01-Jul-2015 & 03-Jul-2015

## El Atractor de Rössler X 10 ✵

El [sistema de Rössler](https://en.wikipedia.org/wiki/R%C3%B6ssler_attractor) es un sistema de ecuaciones diferenciales lineales que presenta comportamiento caótico. Las ecuaciones que definen al sistema son:

![](https://upload.wikimedia.org/math/7/b/8/7b8101ee4d46234d6ce0db24c1974a7a.png? raw=true =350x).

Siendo a, b y c parámetros.

1. ✵✵ Resuelva las ecuaciones diferenciales para

  ```
  a = b = 0.1,
  c = 14,
  ```
  y t en el intervalo [0,600.].

  Haga una gráfica de la trayectoria en 3D usando  `mpl_toolkits.mplot3d` y otra que sea una proyección sobre el plano `xy`.

  ![](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/3dRossler.png? raw=true =350x)

  ![](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/2dRossler.png? raw=true =350x)

## Solución:
```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.animation as animation
%matplotlib inline

# Parámetros de las ecuaciones diferenciales a solucionar
a = 0.1
b = 0.1
c = 14.

# Función que retorna la derivada del vector r = [x,y,z]
def fun(r,t):
    return np.array([-r[1]-r[2],r[0]+a*r[1],b + r[2]*(r[0]-c)]) 

# Solución de la ecuación diferencial usando odeint.
tmax = 600. 
times = np.linspace(0.,tmax,100000) 
funsol,others = odeint(fun,[1.,1.,1.],times,full_output=True)

# Gráfica en 3d de la solución usando mpl_toolkits.mplot3d.
fig = plt.figure(figsize=(15,10))
ax = fig.gca(projection='3d')
x = funsol[:,0]
y = funsol[:,1]
z = funsol[:,2]
ax.plot(x, y, z )

plt.show()

# Gráfica de la proyección en el plano xy de la solución de la ec. diferencial.
fig = plt.figure(figsize=(15,10))
plt.plot(x, y )
plt.axis('equal')
plt.show()
  ```

2. ✵✵ A continuación reproduzca el siguiete panel de gráficas (a su vez reproducido del artículo en Wikipedia sobre el sistema). En ello resuelva las ecuaciones diferenciales dejando `a=b=0.1` y resolviendo para el array de tiempos `np.linspace(0,600,10000)` eliminando los 2000 primeros puntos (el transiente).

  ![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/panel.png? raw=true =350x)

## SOlución:

```python
# Gráficas solicitadas cambiando el parámetro c.
c = np.array([4.,6.,8.5,8.7,9.,12.,12.6,13.,18.])

tmax = 600.
times = np.linspace(0.,tmax,10000)

fig = plt.figure(figsize=(15,10))

for i in range(len(c)):
    
    def fun(r,t):
        return np.array([-r[1]-r[2],r[0]+a*r[1],b + r[2]*(r[0]-c[i])]) 
    
    funsol,others = odeint(fun,[1.,1.,1.],times,full_output=True)
    fig.add_subplot(3,3,i+1)
    x = funsol[:,0][2000:] 
    y = funsol[:,1][2000:] # Se elimina el transiente de los datos de la solución.
    plt.plot(x, y,linewidth=0.5)
    plt.axis('equal')
    plt.title('c = ' + str(c[i]))

plt.show()
```

3. ✵✵✵ Ahora construya el diagrama de bifurcación para una [sección de Poincaré](https://en.wikipedia.org/wiki/Poincar%C3%A9_map) aproximada por las condiciones: abs(x)<=1 and y >= 0. Tome `a=b=0.1` y modifique `c` entre 1 y 45. Al igual que en el anterior ejercicio elimine 2000 puntos para descartar el transiente.

  ![](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/Rosslerbifurcation.png? raw=true =350x)

## Solución:
```python
# Gráfica del diagrama de bifurcación.
c = np.linspace(1.,45.,100) # Se definen todos los valores del parámetro c a utilizar.

x = np.array([])
y = np.array([]) # Arreglos utiliados para hacer la gráfica.

fig = plt.figure(figsize=(15,10))
plt.title('Rossler System: Bifurcation Diagram\n a = b = 0.1')

for i in range(len(c)):
    
    def fun(r,t):
        return np.array([-r[1]-r[2],r[0]+a*r[1],b + r[2]*(r[0]-c[i])]) 
        
    funsol,others = odeint(fun,[1.,1.,1.],times,full_output=True)
    
    sol_x = funsol[:,0][2000:]
    sol_y = funsol[:,1][2000:] # Nuevamente, se elimina el transiente de los datos.
    
    for j in range(len(sol_x)):
        if (np.absolute(sol_x[j])<=1 and sol_y[j] >= 0): # Condiciones dadas para hacer el diagrama.
            x = np.append(x,c[i])
            y = np.append(y, sol_y[j]) # Se guarda la información de los puntos que cumplen las condiciones
                                       # en los arreglos previamente definidos.
            
plt.plot(x,y,'ko')
plt.show()
```

4. ✵✵✵ Finalmente haga una animación que de cuenta de la estructura tridimiensional del atractor. **No** utilice `mpl_toolkits.mplot3d`, haga proyecciones sobre los siguientes planos:

  P(θ):={[x,y,z], n=[cos(45º) cos(θ), cos(45º) sin(θ), sin(45º) ] | [x,y,z].n = 0}

  Estos planos están generados por el siguiente par de vectores ortonormales:

  n1(θ) = [-sin(θ), cos(θ), 0]

  n2(θ) = [-cos(45º)cos(θ), -cos(45º)sin(θ), sin(45º)].

  El resultado debe ser similar a [este](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/RosslerAnimation.mp4). Para ello tome los mismos parámetros que en el primer ejercicio duplicando el número de puntos y dejando solo los últimos 40000.

## Solución:

```python
# Animación de los datos sin unsar gráficas en 3d.
%matplotlib

a = 0.1
b = 0.1
c = 14.

def fun(r,t):
    return np.array([-r[1]-r[2],r[0]+a*r[1],b + r[2]*(r[0]-c)]) 

tmax = 600.
times = np.linspace(0.,tmax,20000) # Se soluciona la ecuación diferencial para un mayor número de datos.
funsol,others = odeint(fun,[1.,1.,1.],times,full_output=True)

x = funsol[:,0][-4000:] 
y = funsol[:,1][-4000:]
z = funsol[:,2][-4000:] # Solo se tienen en cuenta los últimos 4000 datos de la solución.

r = np.array([[x[i],y[i],z[i]] for i in range(len(x))]) # Vector posición de la solución.

fig=plt.figure(figsize=(15,10))
ax = fig.add_subplot(111, autoscale_on=False, xlim=(-25., 25.), ylim=(-20., 40.))
ax.set_aspect('equal')

graph, = ax.plot([],[],lw=2)

angles = np.linspace(0.,2.*np.pi,20) # Arreglo de ángulos para los cuales se va a realizar la animación.

def animate(i):
    
    # Sobre los siguientes vectores se hace la proyección de r con el fin de hacer gŕaficas en 2d
    # que permitan apreciar una rotación del mismo.
    n1 = np.array([-np.sin(angles[i]),np.cos(angles[i]),0.])
    n2 = np.array([-np.cos(np.pi/4.)*np.cos(angles[i]),-np.cos(np.pi/4.)*np.sin(angles[i]),np.sin(np.pi/4.)])
    
    new_x= np.array([])
    new_y= np.array([]) # Vectores que contienen la rotación de r.
    
    for i in range(len(r)):
        projec_1 = sum(r[i]*n1)
        projec_2 = sum(r[i]*n2) # Proyecciones hechas por medio de producto punto.
        new_x = np.append(new_x,projec_1)
        new_y = np.append(new_y,projec_2)
    
    graph.set_data(new_x,new_y)
    
    return graph

ani = animation.FuncAnimation(fig, animate, 20 ,
    interval=100, blit=False,repeat_delay=1000)

#Writer = animation.writers['ffmpeg']
#writer = Writer(fps=10, metadata=dict(artist='Me'), bitrate=1800)
#ani.save(u'Rotación.mp4', writer=writer)

plt.show()
```

  **Al terminar la clase del viernes ejecute `lottery.sh` para saber si su taller va a ser revisado.**
