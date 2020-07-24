function I= romberg(f,a,b,N)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando el metodo de romberg
    %
    %Sintaxis: romberg(f,a,b)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion 
    %           
    %Parámetros de Salida:                           
    %            I= aproximacion numerica de la integral
    %
    %Ejemplo de Implementacion:
    %            romberg(log(x),2,5)
    
    pkg load symbolic
    syms x;
    var= sym('x');
endfunction