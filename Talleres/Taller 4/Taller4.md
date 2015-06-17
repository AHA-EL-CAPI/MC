#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.

## Solución:

El código utilizado para desarrollar este punto es:
+ Para el seno:
```python
import numpy as np
import matplotlib.pyplot as plt
from scipy import interpolate
%matplotlib inline

x = np.array([0.0,np.pi/2,np.pi,3*np.pi/2,2*np.pi])
y = np.array(np.sin(x))

def lagrangep(absc,j):
    pol=np.poly1d([0,1])
    k=len(absc)
    for m in range(k):
        if m!=j:
            pol*=1./(absc[j]-absc[m])*np.poly1d([1.,-absc[m]])
    return pol 

def interlagr(absc,orde):
    poly=np.poly1d([0])
    for i in range(len(absc)):
        poly+=orde[i]*lagrangep(absc,i)
    return poly

po=interlagr(x,y)
interpol_lin = interpolate.interp1d(x,y,kind='linear')
interpol_cubic = interpolate.interp1d(x,y,kind='cubic')
xvals = np.linspace(0.0,2*np.pi,100)
fig=plt.figure(figsize=(20,15))
ax1=fig.add_subplot(3,1,1,aspect='equal')
ax1.plot(xvals,interpol_lin(xvals),label="Lineal")
ax2=fig.add_subplot(3,1,2,aspect='equal')
ax2.plot(xvals,interpol_cubic(xvals),label=u"Cúbica")
ax3=fig.add_subplot(3,1,3,aspect='equal')
ax3.plot(xvals,po(xvals),label="Lagrange")
for ax in fig.axes:
    ax.plot(x,y,"o",label="Datos")
    ax.legend(loc='best')
    ax.set_ylim(-1.5,1.5)
plt.show()
```
+ Para el seno con más datos

```ptyhon
x = np.array(np.linspace(-np.pi/2, 2*np.pi, 15))
y = np.array(np.sin(x_new))

po=interlagr(x,y)
interpol_lin = interpolate.interp1d(x,y,kind='linear')
interpol_cubic = interpolate.interp1d(x,y,kind='cubic')
xvals = np.linspace(-np.pi/2,2*np.pi,100)
fig=plt.figure(figsize=(20,15))
ax1=fig.add_subplot(3,1,1,aspect='equal')
ax1.plot(xvals,interpol_lin(xvals),label="Lineal")
ax2=fig.add_subplot(3,1,2,aspect='equal')
ax2.plot(xvals,interpol_cubic(xvals),label=u"Cúbica")
ax3=fig.add_subplot(3,1,3,aspect='equal')
ax3.plot(xvals,po(xvals),label="Lagrange")
for ax in fig.axes:
    ax.plot(x,y,"o",label="Datos")
    ax.legend(loc='best')
    ax.set_ylim(-1.5,1.5)
plt.show()
```
+ Para las funciones discontinuas
```python
x = np.array([-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0])
y1 = np.array([0.0,0.0,0.0,1.0,0.0,0.0,0.0])
y2 = np.array([0.0,0.0,0.0,1.0,1.0,1.0,1.0])
interpol_lin1 = interpolate.interp1d(x,y1,kind='linear')
interpol_cubic1 = interpolate.interp1d(x,y1,kind='cubic')
po1 = interlagr(x,y1)
interpol_lin2 = interpolate.interp1d(x,y2,kind='linear')
interpol_cubic2 = interpolate.interp1d(x,y2,kind='cubic')
po2 = interlagr(x,y2)

xvals = np.linspace(-3.,3.,100)
fig=plt.figure(figsize=(20,15))
ax1=fig.add_subplot(3,1,1,aspect='equal')
ax1.plot(xvals,interpol_lin1(xvals),label="Lineal")
ax2=fig.add_subplot(3,1,2,aspect='equal')
ax2.plot(xvals,interpol_cubic1(xvals),label=u"Cúbica")
ax3=fig.add_subplot(3,1,3,aspect='equal')
ax3.plot(xvals,po1(xvals),label="Lagrange")
for ax in fig.axes:
    ax.plot(x,y1,"o",label="Datos del pulso")
    ax.legend(loc='best')
    ax.set_ylim(-0.5,1.5)
plt.show()

fig=plt.figure(figsize=(20,15))
ax1=fig.add_subplot(3,1,1,aspect='equal')
ax1.plot(xvals,interpol_lin2(xvals),label="Lineal")
ax2=fig.add_subplot(3,1,2,aspect='equal')
ax2.plot(xvals,interpol_cubic2(xvals),label=u"Cúbica")
ax3=fig.add_subplot(3,1,3,aspect='equal')
ax3.plot(xvals,po2(xvals),label="Lagrange")
for ax in fig.axes:
    ax.plot(x,y2,"o",label="Datos del step")
    ax.legend(loc='best')
    ax.set_ylim(-0.5,1.5)
plt.show()
```
2. Leer del libro [Numerical Methods and Optimization](http://ezproxy.uniandes.edu.co:8080/login?url=http://dx.doi.org/10.1007/978-3-319-07671-3) de *Eric Walter* los ejemplos de la sección 5.2: *Computer experiments*, *Prototyping* y *Mining surveys*.  

3. La implementación de cierto algoritmo necesita puntos uniformemente muestreados pero los datos que se tienen son los mostrados en la tabla de abajo. Produzca una nueva tabla con el mismo número de líneas pero con muestreo uniforme usando un *cubic spline* .

	| x        | y           |
| ------------- | ------------- |
|0.138490669327|2.30060161547|
|0.153824397539|2.31193402603|
|0.229578204444|2.30212660197|
|0.266435179672|2.25835963399|
|0.276929414769|2.24136088402|
|0.334159056347|2.11468161418|
|0.383612191183|1.96176872424|
|0.446434890218|1.71619353619|
|0.541989923364|1.25473903911|
|1.33433323552|-1.434111205|
|1.44538290595|-1.20791779482|
|1.51883847305|-0.991229025177|
|1.6057389642|-0.687154743681|
|1.74396177688|-0.152610073833|
|1.87038245824|0.324964643125|
|2.30863773381|1.31618219677|
|2.38628525713|1.37058691008|
|2.46587111271|1.4006163649|
|2.65137821271|1.41356286272|
|2.75152244191|1.41133466756|
|2.82756611885|1.41289890942|
|4.19566321688|0.0396966472625|
|4.3105185461|-0.0681282942773|
|4.45641816306|-0.0704087548339|


**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**
