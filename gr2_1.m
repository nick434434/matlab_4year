%1
f1=ezplot('sin(x)');
set(f1,'color',[0.2 0.9 0.2])
hold on
f2=ezplot('cos(x)');
set(f2,'color',[0.2 0.2 0.9])
title('sin(x) & cos(x)')

%2
clear 
f1=ezplot('sin(x)'); 
set(f1,'color',[0.2 0.2 0.9])
hold on
x=[-2*pi:0.3:2*pi];
y=sin(x);
f2=plot(x,y,'r*');
title('sin(x)')

%3
clear
f1=ezplot('sin(x)') 
set(f1,'color',[0.2 0.2 0.9])
hold on
x=[-2*pi:0.3:2*pi]
y=sin(x)
f2=plot(x,y,'*')
set(f2,'color',[0.9 0.2 0.2], 'Marker','o')
title('sin(x)')
clear
f1=ezplot('sin(x)') 
set(f1,'LineWidth',2)
title('sin(x)')
clear
f1=ezplot('sin(x)')
set(gca, 'FontSize', 16, 'LineWidth',0.7)
set(f1,'LineWidth',2)
title('Function sin(x)')
clear
hAxes = gca;
f1=ezplot('sin(x)') 
set(f1,'LineWidth',2)
title('sin(x)')
set(gca,'Color',[0.9,0.9,0.9])
set(hAxes,'xtick',[ -4, 0, 4 ],'ytick',[-1, 0, 1 ])
clear
f1=ezplot('sin(x)')
gtext('Лабораторная работа #3. Задание #7')
clear
figure
x = 0:30;
y = [1.5*cos(x);4*exp(-.1*x).*cos(x);exp(.05*x).*cos(x)]';
h = stem(x,y);
set(h,{'Marker'},...
    {'o';'square';'*'})
clc
clear
get(gca)
clear
f1=ezplot('sin(x)')
clear
hfig = hgload('graph.fig')
haxe=get(hfig,'Children')
hline=get(haxe,'Children')
x=get(hline,'XData')
y=get(hline,'YData')
figure(112)
plot(x,y)
title('Восстановленный из fig')
clear
hfig = hgload('graph.fig')
haxe=get(hfig,'Children')
hline=get(haxe,'Children')
x=get(hline,'XData')
y=get(hline,'YData')
dlmwrite('xdata.txt',x)
dlmwrite('ydata.txt',y)
clear
clc
figure
x=load('xdata.txt')
y=load('ydata.txt')
plot(x,y)
title('График, построенный по данным, считанным из текстовых файлов')
clear
clc
figure
[X,Y]=meshgrid([ -2 : 0.1 : 2 ]);
Z = X .* exp(-X .^ 2 -Y .^ 2);
plot3(X, Y, Z)
clear
[X,Y]=meshgrid([ -2 : 0.1 : 2 ]);
Z = X .* exp(-X .^ 2 -Y .^ 2);
surf(X,Y,Z)
colorbar
clear
[X, Y] = meshgrid(-3 : 1/8 : 3);
Z = peaks(X, Y);
surfl(X, Y, Z)
shading interp
clear
x = 1900:10:2000;
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(x,y)
clear
x = 1:10:100;
y = [20 30 45 40 60 65 80 75 95 90];
err = 8*ones(size(y));
errorbar(x,y,err)
clear
x = randn(1000,3); 
hist(x)

clear
figure
X = linspace(0,2*pi,50)';
Y = [cos(X), 0.5*sin(X)];
stem(Y)

clear
X = linspace(0,4*pi,50)';
Y = [0.5*cos(X), 2*cos(X)];
figure
stairs(Y)

clear
theta = [0.4 1.4 3.1 2.3 0.4 2.5 3.9 2.8 2.3 1.6 4.6 4.5 6.1 3.9 5.1];
rose(theta,10)

clear
rng(0,'twister') % initialize random number generator
M = randn(20,20);
Z = eig(M);
figure
compass(Z)

clear
theta = -pi/2:pi/16:pi/2;
r = 2*ones(size(theta));
[u,v] = pol2cart(theta,r);
feather(u,v)

clear
[x,y] = meshgrid(0:0.2:2,0:0.2:2);
u = cos(x).*y;
v = sin(x).*y;

figure
quiver(x,y,u,v)

clear
t = 0:.01:2*pi;
x = cos(2*t).*(cos(t).^2);
y = sin(2*t).*(sin(t).^2);
comet(x,y);