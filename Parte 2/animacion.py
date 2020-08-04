import edo2
from sympy import sympify
import matplotlib.pyplot
import numpy as np

def evalFuncion():
    """
    Aproximar la solucion de la funcion dada en el codigo.
    Salidas:
        [X,Y]:  Matriz con los vectores de las soluciones de X y Y evaluadas en la funcion
        
    """
    a=1
    X=[]
    Y=[]
    funcion = "(sin(6-x))*((sin(5)*(x**(1/2)))**-1)"
    f = sympify(funcion)
    for i in range(0,5000):    #Valor maximo 5000, pues es suficiente para mostrar su comportamiento segun los evaluados en edo2
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
    matplotlib.pyplot.title("Funciones") 
    puntos=evalFuncion()
    matplotlib.pyplot.plot(puntos[0],puntos[1]) 
    legendas.append('Funcion Inicial')
    matplotlib.pyplot.legend( legendas, loc=1)
    matplotlib.pyplot.pause(2)
    for i in range(1,4):            # Solo ejecuta 3 iteraciones, pues mas de esas, la pc no es capaz de computarlos, pues maneja numeros punto flotantes muy grandes
        legendas.append("Iteracion: "+ str(i))
        paso = 10**-i
        x = edo2.edo2(p,q,f,paso,a,b,y0,yn)
        matplotlib.pyplot.plot(x[0], x[1])   
        matplotlib.pyplot.legend( legendas, loc=1)
        matplotlib.pyplot.pause(2)
    matplotlib.pyplot.show()
    
animacion()
