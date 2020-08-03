"""
Created on Sun Aug  2 16:41:33 2020

@author: Jeanpol
"""

from sympy import sympify
import numpy as np
import time
import threading
import matplotlib.pyplot

def edo2(p,q,f,h,a,b,y0,yn):
##Funcion en pyhton para aproximar ecuaciones diferenciales con diferencas finitas
##Entradas
##        p:   funcion de x, que acompanna la y', pertenece a R
##        q:   funcion de x, que acompanna la y, pertenece a R
##        f:   funcion de x, que acompanna la constante, pertenece a R
##        h:   paso 
##        a,b: intervalo 
##        y0:   valor de y(a)
##        yn:   valor de y(b)
##Salidas
##        x:   vector de puntos del eje x
##        y:   vector con valores aproximados para el vector x
    N = int((b-a)/h)
    matrix = []
    vector = []
    x = []
    pj = sympify(p)
    qj = sympify(q)
    fj = sympify(f)
    tj = a + (0*h)
    x += [tj]
    listaX=[]
    listaY=[]
    listaX += [tj]
    
    for i in range(0,N):
        flag = []
        for j in range(0,N):
            flag += [0]
        matrix += [flag]

    matrix[0][0] = 2 + (pow(h,2)*qj.subs({'x': tj}))
    matrix[0][1] = (h/2)*(pj.subs({'x':tj})) - 1
    e0 = ((h/2)*(pj.subs({'x':tj})) + 1) * y0
    vector += [(-pow(h,2)*fj.subs({'x':tj})) + e0]
    
    for i in range(1,N-1):
        tj = a + (i*h)
        x += [tj]
        listaX += [tj]
        matrix[i][i-1] = (-h/2)*(pj.subs({'x':tj})) - 1
        matrix[i][i] = 2 + (pow(h,2)*qj.subs({'x': tj}))
        matrix[i][i+1] = (h/2)*(pj.subs({'x':tj})) - 1
        vector += [(-pow(h,2)*fj.subs({'x':tj}))]
        
    tj = a + ((N-1)*h)
    x += [tj]
    listaX += [tj]
    matrix[N-1][N-2] = ((-h/2)*pj.subs({'x':tj})) - 1
    matrix[N-1][N-1] = 2 + (pow(h,2)*qj.subs({'x': tj}))

    en = (((-h/2)*pj.subs({'x':tj})) + 1)*yn
    vector += [(-pow(h,2)*fj.subs({'x':tj})) + en]
    print("resolviendo Eqn")
    y = np.linalg.solve( np.array(matrix,dtype='float'), np.array(vector,dtype='float')).copy()
    for i in range(0,len(y)):
        listaY += [y[i]]
    return [listaX,listaY]

def FReal(a,puntosX,puntosY):
    fReal = "sin(6-x)/(sin(5)(x*0.5))"
    fR = sympify(fReal)
    for i in range(0,5*10**3):
        puntosX += [a + (i*10**-3)]
        puntosY += [fR.subs({'x':puntosX[i]})]
    print("R,done")

def llamadas():
    p = "-1/x"
    q = "(1/(4*x**2)) - 1"
    f = "0"
    y0 = 1
    yn = 0
    a = 1
    b = 6
    paso=0
    for i in range(1,3):
        paso = 10**-i
        x = edo2(p,q,f,paso,a,b,y0,yn)
        print(x) 
        

    print("done: " + str(paso))
    
def animacion():
    p = "-1/x"
    q = "(1/(4*x**2)) - 1"
    f = "0"
    y0 = 1
    yn = 0
    a = 1
    b = 6
    paso=0
    matplotlib.pyplot.title("resultado") 
    for i in range(1,4):
        paso = 10**-i
        x = edo2(p,q,f,paso,a,b,y0,yn)
        matplotlib.pyplot.plot(x[0], x[1])
        matplotlib.pyplot.pause(2)
        
    print("done: " + str(paso))
    matplotlib.pyplot.show()
    
animacion()