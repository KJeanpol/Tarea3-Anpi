% [r]=romberg('sin(x)',0,pi,6);
1;

function [g] = evaluate(f, x)
  g = eval(f);
endfunction

function [r] = romberg(f,a,b,n)

  r(1,1) = (b - a) * (evaluate(f, a) + evaluate(f, b));

  for j = 2:n
      
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
  
endfunction
