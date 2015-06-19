#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.

#Solución punto c

Interpolación de Lagrange para el seno con los puntos especificados en el libro.
```python
%pylab inline
import numpy as np
import matplotlib.pyplot as plt
from scipy import interpolate

x = np.array([0.0,np.pi/2,np.pi,3*np.pi/2,2*np.pi])
y = np.array(np.sin(x))
def lagrangepol(absc,j):
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
fig=plt.figure()
ixv=np.linspace(-np.pi/2,5*np.pi/2,100)
ax=fig.add_subplot(111)
ax.plot(x,y,"o",ms=10,label="sample points")
ax.plot(ixv,po(ixv),label=u"Interpolation")
plt.legend(loc='best')
plt.show(fig)
```
Interpolación de Lagrange para el seno con más puntos.

```python
x = np.array([-np.pi,-3*np.pi/2,-np.pi/2,0.0,np.pi/2,np.pi,3*np.pi/2,2*np.pi,5*np.pi/2,3*np.pi,7*np.pi/2])
y = np.array(np.sin(x))
def lagrangepol(absc,j):
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
fig=plt.figure()
ixv=np.linspace(-3*np.pi/2,7*np.pi/2,100)
ax=fig.add_subplot(111)
ax.plot(x,y,"o",ms=10,label="sample points")
ax.plot(ixv,po(ixv),label=u"Interpolation")
plt.legend(loc='best')
plt.show(fig)
```
#Solución punto d

Interpolación de Lagrange para el pulso y el step

```python
x = np.array([-3,-2,-1,0,1,2,3])
y = np.array([0,0,0,1,0,0,0])
def lagrangepol(absc,j):
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
fig=plt.figure()
ixv=np.linspace(-3,3)
ax=fig.add_subplot(111)
ax.plot(x,y,"o",ms=10,label="sample points")
ax.plot(ixv,po(ixv),label=u"Interpolation")
plt.legend(loc='best')
plt.show(fig)

x = np.array([-3,-2,-1,0,1,2,3])
y = np.array([0,0,0,1,1,1,1])
def lagrangepol(absc,j):
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
fig=plt.figure()
ixv=np.linspace(-3,3)
ax=fig.add_subplot(111)
ax.plot(x,y,"o",ms=10,label="sample points")
ax.plot(ixv,po(ixv),label=u"Interpolation")
plt.legend(loc='best')
plt.show(fig)
```
Interpolación lineal y cúbica para el step

```python
from scipy import interpolate
x = np.array([-3.0,-2.0,-1,0.0,1.0,2.0,3.0])
y = np.array([0.0,0.0,0.0,1.0,1.0,1.0,1.0])
sale_interpol_lin = interpolate.interp1d(x,y,kind='linear')
sale_interpol_cubic = interpolate.interp1d(x,y,kind='cubic')
xvals=np.linspace(-3,3,100)
fig=plt.figure(figsize=(10,6))
ax1=fig.add_subplot(1,2,1)
ax1.plot(xvals,sale_interpol_lin(xvals),label="linear")
ax6=fig.add_subplot(1,2,2)
ax6.plot(xvals,sale_interpol_cubic(xvals),label="cubic")
for ax in fig.axes:
    ax.plot(x,y,"o",label="data")
    ax.legend(fontsize=8)
    ax.tick_params(axis='both', which='major', labelsize=8)
    ax.set_xlim(-3,3)
    ax.set_ylim(-0.5,1.5)
plt.tight_layout()
plt.show()
```
Interpolación lineal y cúbica para el pulso

```python
x = np.array([-3.0,-2.0,-1,0.0,1.0,2.0,3.0])
y = np.array([0.0,0.0,0.0,1.0,0.0,0.0,0.0])
sale_interpol_lin = interpolate.interp1d(x,y,kind='linear')
sale_interpol_cubic = interpolate.interp1d(x,y,kind='cubic')
xvals=np.linspace(-3,3,100)
fig=plt.figure(figsize=(10,6))
ax1=fig.add_subplot(1,2,1)
ax1.plot(xvals,sale_interpol_lin(xvals),label="linear")
ax6=fig.add_subplot(1,2,2)
ax6.plot(xvals,sale_interpol_cubic(xvals),label="cubic")
for ax in fig.axes:
    ax.plot(x,y,"o",label="data")
    ax.legend(fontsize=8)
    ax.tick_params(axis='both', which='major', labelsize=8)
    ax.set_xlim(-3,3)
    ax.set_ylim(-0.5,1.5)
plt.tight_layout()
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

#Solución

Primero hacemos la interpolación y la mostramos.
```python
x_1=np.array([0.138490669327,0.153824397539,0.229578204444,0.266435179672,0.276929414769,0.334159056347,0.383612191183,0.446434890218,0.541989923364,1.33433323552,1.44538290595,1.51883847305,1.6057389642,1.74396177688,1.87038245824,2.30863773381,2.38628525713,2.46587111271, 2.65137821271, 2.75152244191,2.82756611885,4.19566321688,4.3105185461,4.45641816306])
y_1=np.array([2.30060161547,2.31193402603,2.30212660197,2.25835963399,2.24136088402,2.11468161418,1.96176872424,1.71619353619,1.25473903911,-1.434111205,-1.20791779482,-0.991229025177,-0.687154743681,-0.152610073833,0.324964643125,1.31618219677,1.37058691008,1.4006163649,1.41356286272,1.41133466756,1.41289890942,0.0396966472625,-0.0681282942773,-0.0704087548339])

sale_interpol_cubic = interpolate.interp1d(x,y,kind='cubic')

xvals=np.linspace(0.138490669327,4.45641816306,24)
fig=plt.figure(figsize=(10,5))
ax=fig.add_subplot(1,1,1)
ax.plot(xvals,sale_interpol_cubic(xvals),label="cubicspline")
ax.plot(x_1,y_1,"o",label="data")
ax.legend(fontsize=8)
ax.tick_params(axis='both', which='major', labelsize=8)
plt.tight_layout()
plt.show()
```

Luego botamos la tabla con los 24 datos igualmente espaziados
```python
print '|'+'x'+'               '     +'|'+ 'y'+'          '+'|'
for i in range (24):
    print '|'+str(xvals[i])+'|'+str(sale_interpol_cubic(xvals)[i])+'|'
```
**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**
