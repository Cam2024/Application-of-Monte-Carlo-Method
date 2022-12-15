n=input('N=');
t=0:pi/60:pi*2;
x=cos(t);
y=sin(t);
plot(x,y,'-k');
%Draw Circle
hold on;
x=-1;
y=-1;
w=2;
h=2;
rectangle('Position',[x,y,w,h],'edgecolor','k');
%draw rectangle
count=0;
for i=0:n
    x=rand(1);
    y=rand(1);
    %Use uniform distribution
    if x*x+y*y<1
        count=count+1;
        plot(x,y,'.r','MarkerSize',1);
    else
        plot(x,y,'.b','MarkerSize',1);
    end
    %Draw scatter points and get record probability
end
p=count/n;
title('The probability is', p);
axis([-1, 1, -1, 1]);
axis equal;
grid on;
hold off;
