function [t,y] = RA183045_L11_01()
      
    f = @(t,y) (2 - 2.*t.*y)./(t.^2 + 1); % função a ser integrada
    tspan = [0 1]; % intervalo
    y0 = 1;
    [t,y] = ode45(f,tspan,y0) % integração


    % pós-processamento
    figure;
    plot(t,y,'o'); hold on;
    plot(t,(2*t + 1)./(t.^2 + 1)); %plota uma linha continua a partir da solução analítica da EDO apresentada a cima. A partir dela, podemos ver que a solução obtida anteriormente está correta
    title('y'' = (2 - 2*t*y)/(t^2 + 1)')

end