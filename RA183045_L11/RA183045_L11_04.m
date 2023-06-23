function [t,y] = RA183045_L11_04()

    f = @(t,y) -t*y + 4*t/y; % função a ser integrada
    tspan = [0 1]; % intervalo
    y0 = 1;
    [t,y] = ode45(f,tspan,y0) % integração


    % pós-processamento
    figure;
    plot(t,y,'o'); hold on;
    plot(t,sqrt(-3*exp(-t.^2)+4)); %plota uma linha continua a partir da solução analítica da EDO apresentada a cima. A partir dela, podemos ver que a solução obtida anteriormente está correta
    title('y'' = -t*y + 4*t/y')

end