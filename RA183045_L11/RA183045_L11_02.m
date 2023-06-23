 function [t,y] = RA183045_L11_02()
    f = @(t,y) (y.^2)/(1 + t); % função a ser integrada
    tspan = [1 2]; % intervalo
    y0 = -1/log(2);
    [t,y] = ode45(f,tspan,y0) % integração


    % pós-processamento
    figure;
    plot(t,y,'o'); hold on;
    plot(t,(-1./(log(1 + t)))); %plota uma linha continua a partir da solução analítica da EDO apresentada a cima. A partir dela, podemos ver que a solução obtida anteriormente está correta
    title('y'' = (y^2)/(1 + t)')
end