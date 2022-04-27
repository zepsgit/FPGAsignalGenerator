x1=0:pi/10:2*pi;
x2=0:pi/20:pi;
x3=0:pi/5:4*pi;
y1=sin(x1);
y2=sin(2*x2);
y3=sin(0.5*x3);
figure
plot(x1,y1,'o','LineWidth',4)
hold on;

plot(x2,y2,'o','LineWidth',4)
hold on;

plot(x3,y3,'o','LineWidth',4)
hold on;
