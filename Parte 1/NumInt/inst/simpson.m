function I= simpson(f,a,b)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando la regla de simpson compuesta
    %
    %Sintaxis: simpson(f,a,b)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion 
    %           
    %Parámetros de Salida:                           
    %            I= aproximacion numerica de la integral
    %
    %Ejemplo de Implementacion:
    %            simpson(log(x),2,5)
    
    warning('off')
    pkg load symbolic
    syms x;
    var= sym('x');
    f1= matlabFunction(sym(f));
    h=(b-a)/2;
    c=(a+b)/2;
    I = (h/3)*(f1(a)+4*f1(c)+f1(b));
endfunction
