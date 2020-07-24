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

    pkg load symbolic
    syms x;
    var= sym('x');
    f1= matlabFunction(sym(f));
    dfp = matlabFunction(diff(sym(f1)));
    dfs = matlabFunction(diff(sym(dfp)));
    s=solve(dfs, x);
    i=length(s);
    j=1;
    ev=[];
    sa=abs(dfs(a));
    sb=abs(dfs(b));
    ev=[ev sa sb];
    while (j<=i)
        j=j+1;
        si=abs(dfs(s(i)));
        ev=[ev si];
    endwhile
    cota=((b-a)^3/12)*max(ev);
    I = ((f1(b)+f1(a))*(b-a))/2;
    
endfunction