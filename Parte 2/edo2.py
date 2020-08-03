"""
Created on Sun Aug  2 16:41:33 2020

@author: Jeanpol
"""

from sympy import sympify
import matplotlib.pyplot
import numpy as np

def edo2(p,q,f,h,a,b,y0,yn):
    """
    Aproximar ecuaciones diferenciales conel metodo de diferencas finitas
    Entradas:
        p:   funcion de x, que acompanna la y', pertenece a R
        q:   funcion de x, que acompanna la y, pertenece a R    
        f:   funcion de x, que acompanna la constante, pertenece a R
        h:   paso
        a,b: intervalo 
        y0:   valor de y(a)
        yn:   valor de y(b)
    Salidas:
        x:   vector de puntos del eje x
        y:   vector con valores aproximados para el vector x
    """
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
    y = np.linalg.solve( np.array(matrix,dtype='float'), np.array(vector,dtype='float')).copy()
    for i in range(0,len(y)):
        listaY += [y[i]]
    return [listaX,listaY]

def evalFuncion():
    a=1
    X=[]
    Y=[]
    funcion = "(sin(6-x))*((sin(5)*(x**(1/2)))**-1)"
    f = sympify(funcion)
    for i in range(0,5*10**3):
        X += [a + (i*10**-3)]
        Y += [f.subs({'x':X[i]})]
    return[X,Y]


def animacion():
    p = "-1/x"
    q = "(1/(4*x**2))-1"
    f = "0"
    y0 = 1
    yn = 0
    a = 1
    b = 6
    paso=0
    legendas=[]
    matplotlib.pyplot.title("resultado") 
    puntos=evalFuncion()
    matplotlib.pyplot.plot(puntos[0],puntos[1]) 
    legendas.append('Funcion Inicial')
    matplotlib.pyplot.legend( legendas, loc=1)
    matplotlib.pyplot.pause(2)
    for i in range(1,5):
        legendas.append("Iteracion: "+ str(i))
        paso = 10**-i
        x = edo2(p,q,f,paso,a,b,y0,yn)
        matplotlib.pyplot.plot(x[0], x[1])   
        matplotlib.pyplot.legend( legendas, loc=1)
        matplotlib.pyplot.pause(2)
    matplotlib.pyplot.show()
    
animacion()