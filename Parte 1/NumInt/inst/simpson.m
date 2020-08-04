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
    dfp = matlabFunction(diff(sym(f1)));
    dfs = matlabFunction(diff(sym(dfp)));
    dft = matlabFunction(diff(sym(dfs)));
    dfc = matlabFunction(diff(sym(dft)));
    h=(b-a)/2;
    c=(a+b)/2;
    s=solve(dfc, x);
    i=length(s);
    j=1;
    ev=[];
    sa=abs(double(dfc(a)));
    sb=abs(double(dfc(b)));
    ev=[ev sa sb];
    while (j<=i)
        si=abs(double(dfc(s(i))));
        ev=[ev si];
        j=j+1;
    endwhile
    cota=((h**5/90)*max(ev));
    I = (h/3)*(f1(a)+4*f1(c)+f1(b));
endfunction
