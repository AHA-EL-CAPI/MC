#Taller 8 - Ecuación de Onda 2D
*Métodos Computacionales - Laboratorio*

08-Jul-2015 & 10-Jul-2015

## Onda en un cubo X 10 ✵

1. Resuelva la ecuación de onda con condiciones de frontera correspondientes a la topología de un cubo.

![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller8/cube.png? raw=true =200x).

[Aquí](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller8/cubic.mp4) se muestra un ejemplo del resultado tomando los siguientes parámetros:

```
Nt=2000
Nl=50
L=10. # Lado del cubo
tmin=0
tmax=.3
xmin=-L/2
xmax=L/2
ymin=-L/2
ymax=L/2
dt=(tmax-tmin)/Nt
dx=(xmax-xmin)/Nl
v=425. # m/s
xcoords=np.linspace(xmin,xmax,Nl)
ycoords=np.linspace(xmin,xmax,Nl)
xmesh,ymesh=np.meshgrid(xcoords,ycoords)
En dos caras opuestas:
ψ(x,y,0) =
 np.exp(-xmesh**2)*np.exp(-ymesh**2)
```

## Solución:

Partiendo de la información del cuaderno 11-PDE.ipynb y de la ayuda brindada por el profesor en clase, la solución de la ecuación de onda en la superficie de un cubo se realizó de la siguiente manera:

```python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
%matplotlib inline

Nt=2000
Nl=50
L=10. # Lado del cubo
tmin=0
tmax=.3
xmin=-L/2
xmax=L/2
ymin=-L/2
ymax=L/2
dt=(tmax-tmin)/Nt
dx=(xmax-xmin)/Nl
dy=(ymax-ymin)/Nl
v=425. # m/s
r=v*dt/dx # Condiciones dadas en el enunuciado del taller.

xcoords_0 = np.linspace(xmin,xmax,Nl)
ycoords_0 = np.linspace(xmin,xmax,Nl) # Coordenadas de la cara 0.

xcoords_1 = np.linspace(xmin,xmax,Nl)
ycoords_1 = np.linspace(xmin,xmax,Nl) # Coordenadas de la cara 1.
xmesh_1,ymesh_1 = np.meshgrid(xcoords_1,ycoords_1) # Vectorización de las coordenadas, necesarias para definir fácilmente 
                                                   # lacondición inicial sobre esta cara.

xcoords_2 = np.linspace(xmin,xmax,Nl)
ycoords_2 = np.linspace(xmin,xmax,Nl) # Coordenadas de la cara 2.

xcoords_3 = np.linspace(xmin,xmax,Nl)
ycoords_3 = np.linspace(xmin,xmax,Nl) # Coordenadas de la cara 3.
xmesh_3,ymesh_3 = np.meshgrid(xcoords_3,ycoords_3) # Vectorización de las coordenadas, necesarias para definir fácilmente 
                                                   # lacondición inicial sobre esta cara.

xcoords_4 = np.linspace(xmin,xmax,Nl)
ycoords_4 = np.linspace(xmin,xmax,Nl) # Coordenadas de la cara 3.

xcoords_5 = np.linspace(xmin,xmax,Nl)
ycoords_5 = np.linspace(xmin,xmax,Nl) # Coordenadas de la cara 3.

drum_0 = np.zeros((Nt,Nl+2,Nl+2))
drum_1 = np.zeros((Nt,Nl+2,Nl+2))
drum_2 = np.zeros((Nt,Nl+2,Nl+2))
drum_3 = np.zeros((Nt,Nl+2,Nl+2))
drum_4 = np.zeros((Nt,Nl+2,Nl+2))
drum_5 = np.zeros((Nt,Nl+2,Nl+2)) # Arreglos que van a contienen la evolución temporal de las caras. Estos arreglos tienen 2 
                                  # filas y 2 columnas adicionales que sirven para manejar más fácilmente los vecinos de cada
                                  # una de las caras del cubo donde se va a solucionar la ecuación de onda.

# Condiciones iniciales sobre las caras 1 y 3 teniendo en cuenta que hay 2 filas y columnas adicionales en los arreglos 
# correspondientes a estas caras.
stdev=1./np.sqrt(2)
drum_1[0,1:-1,1:-1] = np.exp(-xmesh_1**2/(2*stdev**2))*np.exp(-ymesh_1**2/(2*stdev**2))
drum_1[1,1:-1,1:-1] = drum_1[0,1:-1,1:-1]+r**2/2.*(np.roll(drum_1[0,1:-1,1:-1],1,axis=0)
                                         +np.roll(drum_1[0,1:-1,1:-1],-1,axis=0)
                                         +np.roll(drum_1[0,1:-1,1:-1],1,axis=1)
                                         +np.roll(drum_1[0,1:-1,1:-1],-1,axis=1)-4*drum_1[0,1:-1,1:-1])

drum_3[0,1:-1,1:-1] = np.exp(-xmesh_3**2/(2*stdev**2))*np.exp(-ymesh_3**2/(2*stdev**2))
drum_3[1,1:-1,1:-1] = drum_3[0,1:-1,1:-1]+r**2/2.*(np.roll(drum_3[0,1:-1,1:-1],1,axis=0)
                                         +np.roll(drum_3[0,1:-1,1:-1],-1,axis=0)
                                         +np.roll(drum_3[0,1:-1,1:-1],1,axis=1)
                                         +np.roll(drum_3[0,1:-1,1:-1],-1,axis=1)-4*drum_3[0,1:-1,1:-1])

# Solución de la ecuación de onda en cada cara, basada en la información del cuaderno 11-PDE.ipynb.
for i in range(2,Nt):
    pdrum_0 = drum_0[i-1]
    ppdrum_0 = drum_0[i-2]
    pdrum_1 = drum_1[i-1]
    ppdrum_1 = drum_1[i-2]
    pdrum_2 = drum_2[i-1]
    ppdrum_2 = drum_2[i-2]
    pdrum_3 = drum_3[i-1]
    ppdrum_3 = drum_3[i-2]
    pdrum_4 = drum_4[i-1]
    ppdrum_4 = drum_4[i-2]
    pdrum_5 = drum_5[i-1]
    ppdrum_5 = drum_5[i-2] # Arreglos necesarios para la actualización de cada cara en el tiempo i.

# A continuación se establecen los vecinos correctos de cada cara usando las 2 filas y columnas adicionales.
    pdrum_0[0,1:-1] = pdrum_4[1:-1,1]
    pdrum_0[1:-1,0] = pdrum_3[1:-1,-2]
    pdrum_0[-1,1:-1] = pdrum_5[1:-1,1]
    pdrum_0[1:-1,-1] = pdrum_1[1:-1,1]
    
    pdrum_1[0,1:-1] = pdrum_4[-2,1:-1]
    pdrum_1[1:-1,0] = pdrum_0[1:-1,-2]
    pdrum_1[-1,1:-1] = pdrum_5[1,1:-1]
    pdrum_1[1:-1,-1] = pdrum_2[1:-1,1]
    
    pdrum_2[0,1:-1] = pdrum_4[1:-1,-2]
    pdrum_2[1:-1,0] = pdrum_1[1:-1,-2]
    pdrum_2[-1,1:-1] = pdrum_5[1:-1,-2]
    pdrum_2[1:-1,-1] = pdrum_3[1:-1,1]
    
    pdrum_3[0,1:-1] = pdrum_4[1,1:-1]
    pdrum_3[1:-1,0] = pdrum_2[1:-1,-2]
    pdrum_3[-1,1:-1] = pdrum_5[-2,1:-1]
    pdrum_3[1:-1,-1] = pdrum_0[1:-1,1]
    
    pdrum_4[0,1:-1] = pdrum_3[1,1:-1]
    pdrum_4[1:-1,0] = pdrum_0[1,1:-1]
    pdrum_4[-1,1:-1] = pdrum_1[1,1:-1]
    pdrum_4[1:-1,-1] = pdrum_2[1,1:-1]
    
    pdrum_5[0,1:-1] = pdrum_1[-2,1:-1]
    pdrum_5[1:-1,0] = pdrum_0[-2,1:-1]
    pdrum_5[-1,1:-1] = pdrum_3[-2,1:-1]
    pdrum_5[1:-1,-1] = pdrum_2[-2,1:-1] 
    
    ppdrum_0[0,1:-1] = ppdrum_4[1:-1,1]
    ppdrum_0[1:-1,0] = ppdrum_3[1:-1,-2]
    ppdrum_0[-1,1:-1] = ppdrum_5[1:-1,1]
    ppdrum_0[1:-1,-1] = ppdrum_1[1:-1,1]
    
    ppdrum_1[0,1:-1] = ppdrum_4[-2,1:-1]
    ppdrum_1[1:-1,0] = ppdrum_0[1:-1,-2]
    ppdrum_1[-1,1:-1] = ppdrum_5[1,1:-1]
    ppdrum_1[1:-1,-1] = ppdrum_2[1:-1,1]
    
    ppdrum_2[0,1:-1] = ppdrum_4[1:-1,-2]
    ppdrum_2[1:-1,0] = ppdrum_1[1:-1,-2]
    ppdrum_2[-1,1:-1] = ppdrum_5[1:-1,-2]
    ppdrum_2[1:-1,-1] = ppdrum_3[1:-1,1]
    
    ppdrum_3[0,1:-1] = ppdrum_4[1,1:-1]
    ppdrum_3[1:-1,0] = ppdrum_2[1:-1,-2]
    ppdrum_3[-1,1:-1] = ppdrum_5[-2,1:-1]
    ppdrum_3[1:-1,-1] = ppdrum_0[1:-1,1]
    
    ppdrum_4[0,1:-1] = ppdrum_3[1,1:-1]
    ppdrum_4[1:-1,0] = ppdrum_0[1,1:-1]
    ppdrum_4[-1,1:-1] = ppdrum_1[1,1:-1]
    ppdrum_4[1:-1,-1] = ppdrum_2[1,1:-1]
    
    ppdrum_5[0,1:-1] = ppdrum_1[-2,1:-1]
    ppdrum_5[1:-1,0] = ppdrum_0[-2,1:-1]
    ppdrum_5[-1,1:-1] = ppdrum_3[-2,1:-1]
    ppdrum_5[1:-1,-1] = ppdrum_2[-2,1:-1] 

    # Se actualiza cada cara en el tiempo i partiendo de la discretización de las segundas derivadas derivadas espaciales y 
    # temporales.
    drum_0[i]=2*(1.-2.*r**2)*pdrum_0-ppdrum_0+r**2*(np.roll(pdrum_0,1,axis=1)+np.roll(pdrum_0,-1,axis=1)
                                              +np.roll(pdrum_0,1,axis=0)+np.roll(pdrum_0,-1,axis=0))
    
    drum_1[i]=2*(1.-2.*r**2)*pdrum_1-ppdrum_1+r**2*(np.roll(pdrum_1,1,axis=1)+np.roll(pdrum_1,-1,axis=1)
                                              +np.roll(pdrum_1,1,axis=0)+np.roll(pdrum_1,-1,axis=0))
    
    drum_2[i]=2*(1.-2.*r**2)*pdrum_2-ppdrum_2+r**2*(np.roll(pdrum_2,1,axis=1)+np.roll(pdrum_2,-1,axis=1)
                                              +np.roll(pdrum_2,1,axis=0)+np.roll(pdrum_2,-1,axis=0))
    
    drum_3[i]=2*(1.-2.*r**2)*pdrum_3-ppdrum_3+r**2*(np.roll(pdrum_3,1,axis=1)+np.roll(pdrum_3,-1,axis=1)
                                              +np.roll(pdrum_3,1,axis=0)+np.roll(pdrum_3,-1,axis=0))
    
    drum_4[i]=2*(1.-2.*r**2)*pdrum_4-ppdrum_4+r**2*(np.roll(pdrum_4,1,axis=1)+np.roll(pdrum_4,-1,axis=1)
                                              +np.roll(pdrum_4,1,axis=0)+np.roll(pdrum_4,-1,axis=0))
    
    drum_5[i]=2*(1.-2.*r**2)*pdrum_5-ppdrum_5+r**2*(np.roll(pdrum_5,1,axis=1)+np.roll(pdrum_5,-1,axis=1)
                                              +np.roll(pdrum_5,1,axis=0)+np.roll(pdrum_5,-1,axis=0))

# Animación
%matplotlib

fig = plt.figure(figsize=(15,10))

#plt.hold(True)
# Coordenadas de un areglo más grande que permie mostrar todas las caras del cubo simultáneamente.
x_all = np.linspace(-2*L,2*L,4*Nl)
y_all = np.linspace(-3*L/2,3*L/2,3*Nl)

drum_all = np.zeros((Nt,3*Nl,4*Nl)) 

for i in range(len(drum_all)):
    # Se ubica apropiadamente cada cara en en el arreglo más grande.
    drum_all[i,Nl:2*Nl,0:Nl] = drum_0[i,1:-1,1:-1]
    drum_all[i,Nl:2*Nl,Nl:2*Nl] = drum_1[i,1:-1,1:-1]
    drum_all[i,Nl:2*Nl,2*Nl:3*Nl] = drum_2[i,1:-1,1:-1]
    drum_all[i,Nl:2*Nl,3*Nl:4*Nl] = drum_3[i,1:-1,1:-1]
    drum_all[i,2*Nl:3*Nl,Nl:2*Nl] = drum_4[i,1:-1,1:-1]
    drum_all[i,0:Nl,Nl:2*Nl] = drum_5[i,1:-1,1:-1]

plt.pcolor(x_all,y_all,drum_all[0],cmap='gist_heat',vmin=0.,vmax=1.)

plt.xlim(-2*L + dx,2*L - dx)
plt.ylim(-3*L/2 + dy,3*L/2 -dy)

def animate(i):  
    plt.pcolor(x_all,y_all,drum_all[i],cmap='gist_heat',vmin=0.,vmax=1.)
    plt.xlim(-2*L + dx,2*L - dx)
    plt.ylim(-3*L/2 + dy,3*L/2 -dy)
    
animacion = animation.FuncAnimation(fig, animate, np.arange(0,len(drum_1),10), interval=1, blit=False,repeat_delay=1000)

#Writer = animation.writers['ffmpeg']
#writer = Writer(fps=30, metadata=dict(artist='Me'), bitrate=1800)
#animacion.save(u'Wave equation on cube.mp4',writer=writer)

plt.show()
#plt.hold(False)
```

  **Al terminar la clase del viernes ejecute `lottery.sh` para saber si su taller va a ser revisado.**
