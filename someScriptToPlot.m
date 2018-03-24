% create vector of time values

t = 0.0 : 0.01 : 5.0;

% evaluate function at time points

f = 22*cos(15*pi*t).*exp(-0.5*t);

% plot t vs f(t)

figure(1)

plot(t,f);

xlabel('t (sec)');

ylabel('f(t)');