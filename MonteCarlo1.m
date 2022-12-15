shots = input('Please enter the number of shots N=');
distribution = input('Select the random distribution type\n(1 Uniform distribution, 2 Gaussian distribution):');
defensive = input('Choose a defensive preference\n(1.Standard, 2.Corners):');
%Highly intelligent program with multiple input ports
t=0:pi/60:pi*2;
x=sqrt(5)*cos(t);
y=sqrt(5)*sin(t);
plot(x,y,'-b');
%Draw Circle
hold on;
axis([-3, 3, -3, 3]);
axis equal;
grid on;
x=-2;
y=-1;
w=4;
h=2;
rectangle('Position',[x,y,w,h],'edgecolor','r');
%draw rectangle
score=0;
for i=0:shots
    t=rand(1)*2*pi;
    if distribution == 1
        r=sqrt(rand(1))*sqrt(5);
    else
        r=randn(1)*sqrt(5);
    end
    %Select Distribution Type
    x=r*cos(t);
    y=r*sin(t);
    if defensive == 1
        p=randi(5);
    else
        shoots=randi(100);
        if shoots<11
            p=randi(3);
        else
            p=randi(4:5);
        end
        %Use this method to approximate 90% probability
    end
    %Choose a gatekeeper preference
    if x > 2 || x < -2 || y > 1 || y < -1
        plot(x,y,'bo','MarkerSize',4);
    else
        switch p
            case 1
                if x<1&&x>-1&&y<1&&y>-1
                    plot(x,y,'bo','MarkerSize',4);
                else
                    score=score+1;
                    plot(x,y,'rx','MarkerSize',4);
                end
            case 2
                if x<-1&&x>-2&&y<1&&y>0||x<0&&x>-1&&y<0&&y>-1
                    plot(x,y,'bo','MarkerSize',4);
                else
                    score=score+1;
                    plot(x,y,'rx','MarkerSize',4);
                end
            case 3
                if x<2&&x>1&&y<1&&y>0||x<1&&x>0&&y<0&&y>-1
                    plot(x,y,'bo','MarkerSize',4);
                else
                    score=score+1;
                    plot(x,y,'rx','MarkerSize',4);
                end
            case 4
                if x < 2 && x > 0 && y < 0 && y > -1
                    plot(x,y,'bo','MarkerSize',4);
                else
                    score=score+1;
                    plot(x,y,'rx','MarkerSize',4);
                end
            case 5
                if x < 0 && x > -2 && y < 0 && y > -1
                    plot(x,y,'bo','MarkerSize',4);
                else
                    score=score+1;
                    plot(x,y,'rx','MarkerSize',4);
                end
                %Conditions of each type of gatekeeper
        end
    end
end
p=score/shots;
%Obtaining probability
title('The probability of scoring is', p);
text(2.7, 2.9, 'x: score', Color='r', FontSize=15);
text(2.7, 2.6, 'o: miss', Color='b', FontSize=15);
hold off;
