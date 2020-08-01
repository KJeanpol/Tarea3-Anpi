function I = romberg(f,a,b,N)
    %Esta función obtiene una aproximacion a la integral de la funcion f 
    %en el intervalo [a,b] utilizando el metodo de romberg
    %
    %Sintaxis: romberg(f,a,b,N)
    % 
    %Parámetros Iniciales: 
    %            f = funcion a integrar
    %            a,b = intervalos de integracion para la funcion 
    %            N= numero de puntos
    %           
    %Parámetros de Salida:                           
    %            [r]= aproximacion numerica de la integral
    %
    %Ejemplo de Implementacion:
    %            romberg('log(x)',2,5,4)

  r(1,1) = (b - a) * (evaluate(f, a) + evaluate(f, b));

  for j = 2:N
      
    h = (b - a) / (2^(j-1));  %Altura
    
    h_prev = (b - a) / (2^(j-2)); 
    
    sum = 0;
    
    for i = 1:2^(j-2)
      
        sum = sum + evaluate(f, a + ((2 * i) - 1) * h); %sumatoria
        
    endfor
    
    r(j,1) = 1/2 * (r(j-1,1) + h_prev * sum);  %r_j1
    
    for k = 2:j
      
        r(j,k) = r(j,k-1) + ((r(j,k-1)-r(j-1,k-1))/(4^(k-1) - 1));
       
    endfor
    
  endfor
    I=r(N,N);
endfunction

function [g] = evaluate(f, x)
  g = eval(f);
endfunction

