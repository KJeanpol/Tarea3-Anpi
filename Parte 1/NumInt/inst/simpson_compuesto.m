function I= simpson_compuesto(f,a,b,N)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando la regla de simpson compuesta
    %
    %Sintaxis: simpson_compuesto(f,a,b,N)
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
    %            simpson_compuesto(log(x),2,5,7)
    
    warning('off')
    pkg load symbolic
    format long;
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
    respar=0;
    resimpar=0;
    for i=(1:numel(valores))
        if(i==1 || i==(numel(valores)))
            res+=f1(valores(i));
        elseif(mod(i,2)==0)
            resimpar+=f1(valores(i));
        else
            respar+=f1(valores(i));
        endif
    endfor
    res=res+(2*respar)+(4*resimpar);
    cota=(((b-a)*(h**4))/180)*max(ev);
    I=(h/3)*res;
endfunction