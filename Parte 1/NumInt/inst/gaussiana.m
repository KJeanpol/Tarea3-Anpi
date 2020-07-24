function I=gaussiana(f,a,b,M)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando cuadraturas gaussianas
    %
    % Esta funcion utiliza la funcion polinomio_legendre la cual calcula
    % el polinomio de legendre de grado n. Utilice "help polinomio_legendre"
    % para obtener mas informacion.
    %
    %Sintaxis: gaussiana(f,a,b,M)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion
    %            M= grado del polinomio de legendre            
    %            
    %Parámetros de Salida:                           
    %            I= aproximacion de la integral
    %
    %Ejemplo de implementacion:
    %            gaussiana(log(x),2,5,2)
    
    warning('off')
    pkg load symbolic
    syms x;
    [pol,ceros]=polinomio_legendre(M);
    expr=f;
    expr=subs(expr,x,((b-a)/2)*x+((b+a)/2));
    fx= matlabFunction(sym(expr));
    i=1;
    res=0;
    while(i<=M)
        res+=fx(ceros(i));
        i+=1;
    endwhile
    I=res*((b-a)/2);
endfunction