function I= trapecio(f,a,b)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando la regla del trapecio
    %
    %Sintaxis: trapecio(f,a,b)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion            
    %           
    %Parámetros de Salida:                           
    %            I= aproximacion numerica de la integral
    %
    %Ejemplo de Implementacion:
    %            trapecio(log(x),2,5)
    %
    warning('off')
    pkg load symbolic
    syms x;
    var= sym('x');
    f1= matlabFunction(sym(f));
    I = ((f1(b)+f1(a))*((b-a)/2));
endfunction