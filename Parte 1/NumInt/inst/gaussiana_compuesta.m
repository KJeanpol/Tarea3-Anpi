function I=gaussiana_compuesta(f,a,b,M,N)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando cuadraturas gaussianas compuesta
    %
    % Esta funcion utiliza la funcion polinomio_legendre la cual calcula
    % el polinomio de legendre de grado n. Utilice "help polinomio_legendre"
    % para obtener mas informacion.
    %
    %
    %Sintaxis: gaussiana_compuesta(f,a,b,M,N)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion
    %            M= grado del polinomio de legendre   
    %            N= numero de puntos    
    %            
    %Parámetros de Salida:                           
    %            I= aproximacion de la integral
    %
    %Ejemplo de implementacion:
    %            gaussiana_compuesta(log(x),2,5,2,11)
    
    warning('off')
    pkg load symbolic
    syms x;
    [pol,ceros]=polinomio_legendre(M);
    h=(b-a)/(N-1);
    valores =[a];
    atemp=a+h;
    while (atemp)<b
        valores =[valores atemp];
        atemp=atemp+h;
    endwhile
    valores=[valores b];
    intera=1;
    interb=1;
    res=0;
    j=1;
    temp=0;
    while(j<=N-1)
        i=1;
        intera=valores(j);
        interb=valores(j+1);
        t1=(interb-intera)/2;
        t2=(interb+intera)/2;
        expr=f;
        expr=subs(expr,x,(t1)*x+(t2));
        fx= matlabFunction(sym(expr));
        res=0;
        while(i<=M)
            res+=fx(ceros(i));
            i=i+1;
        endwhile
        temp=temp+(res*t1);
        j=j+1;
    endwhile
    I=temp;
endfunction