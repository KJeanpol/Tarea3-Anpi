from sympy import sympify
import matplotlib.pyplot
import numpy as np

def edo2(p,q,f,h,a,b,y0,yn):
    """
    Aproximar ecuaciones diferenciales con el metodo de diferencas finitas
    Entradas:
        p:   funcion de x que acompanna la y'
        q:   funcion de x que acompanna la y   
        f:   funcion de x que acompanna la constante
        h:   paso
        a,b: intervalo 
        y0:   valor de y(a)
        yn:   valor de y(b)
    Salidas:
        x:   Vector de puntos en X
        y:   Vector de puntos en Y
    """
    N = int((b-a)/h)  #En el documento se encuentra despejando la ecuacion de h
    matrix = []
    vector = []
    x = []
    pj = sympify(p)
    qj = sympify(q)
    fj = sympify(f)
    tj = a + (0*h)
    x += [tj]
    
    #Se crea una matrix de tamano NxN, con ceros
    for i in range(0,N):
        flag = []
        for j in range(0,N):
            flag += [0]
        matrix += [flag]
        
    #Se instancian los valores iniciales del sistema matricial
    #Esto porque usa otros valores para e, cuando es el inicial o el N valor
    matrix[0][0] = 2 + (pow(h,2)*qj.subs({'x': tj}))
    matrix[0][1] = (h/2)*(pj.subs({'x':tj})) - 1
    e0 = ((h/2)*(pj.subs({'x':tj})) + 1) * y0
    vector += [(-pow(h,2)*fj.subs({'x':tj})) + e0]
    
    #Se calculan los N valores del sistema matricial, hasta N-1
    for i in range(1,N-1):
        tj = a + (i*h)
        x += [tj]
        matrix[i][i-1] = (-h/2)*(pj.subs({'x':tj})) - 1
        matrix[i][i] = 2 + (pow(h,2)*qj.subs({'x': tj}))
        matrix[i][i+1] = (h/2)*(pj.subs({'x':tj})) - 1
        vector += [(-pow(h,2)*fj.subs({'x':tj}))]

    #Se calculan los valores para N   
    tj = a + ((N-1)*h)
    x += [tj]
    matrix[N-1][N-2] = ((-h/2)*pj.subs({'x':tj})) - 1
    matrix[N-1][N-1] = 2 + (pow(h,2)*qj.subs({'x': tj}))

    en = (((-h/2)*pj.subs({'x':tj})) + 1)*yn    #En el documento Beta=x(b)=yn
    vector += [(-pow(h,2)*fj.subs({'x':tj})) + en]
    y = np.linalg.solve( np.array(matrix,dtype='float'), np.array(vector,dtype='float')).copy()
    return [x,y]
