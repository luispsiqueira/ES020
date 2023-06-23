function [t,y] = RA183045_L11_03()
    
    f = @(t,y) (y.^2 + y)/(t); % função a ser integrada
    tspan = [1 3]; % intervalo
    y0 = -2;
    [t,y] = ode45(f,tspan,y0) % integração


    % pós-processamento
    figure;
    plot(t,y,'o'); hold on;
    plot(t,(2*t./(1-2.*t))); %plota uma linha continua a partir da solução analítica da EDO apresentada a cima. A partir dela, podemos ver que a solução obtida anteriormente está correta
    title('y'' = ((y^2 + y)/(t)')

end