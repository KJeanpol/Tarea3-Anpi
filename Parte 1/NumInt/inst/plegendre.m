function [pol,zero]=polinomio_legendre(n)
    %Esta función obtiene el polinomio de legendre de grado n
    %
    %Sintaxis: polinomio_legendren)
    % 
    %Parámetros Iniciales: 
    %            n= grado del polinomio           
    %            
    %Parámetros de Salida:                           
    %            pol= polinomio de grado n
    %            zero= ceros del polinomio
    %
    %Ejemplo de Implementacion: 
    %            polinomio_legendre(3)
    
    pkg load symbolic
    syms x;
    var= sym('x');
    frac= 1/((factorial(n))*(2^n));
    exp=((x^2)-1)^n;
    df=diff(exp, x, n);
    pol=(simplify(frac*df));
    zero=double(solve(pol,x));
endfunction