function I= trapecio_compuesto(f,a,b,N)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando la regla del trapecio compuesta
    %
    %Sintaxis: trapecio_compuesto(f,a,b,N)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion
    %            N= numero de puntos en el intervalo    
    %           
    %Parámetros de Salida:                           
    %            I= aproximacion numerica de la integral
    %
    %Ejemplo de Implementacion:
    %            trapecio_compuesto(log(x),2,5,4)
    %
    
    warning('off')
    pkg load symbolic
    h=(b-a)/(N-1);
    valores =[a];
    atemp=a+h;
    while (atemp)<b
        valores =[valores atemp];
        atemp=atemp+h;
    endwhile
    valores=[valores b];
    syms x;
    var= sym('x');
    f1= matlabFunction(sym(f));
    res=0;
    for i=(1:numel(valores))
        if(i==1 || i==(numel(valores)))
            res+=f1(valores(i));
        else
            res+=f1(valores(i))*2;
        endif
    endfor
    I= res*(h/2);
endfunction