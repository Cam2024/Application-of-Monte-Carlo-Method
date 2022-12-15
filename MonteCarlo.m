functions = input("1:Scatter Plot, 2:Probability Statistics\nSelect:");
distribution = input('Select the random distribution type\n(1 Uniform distribution, 2 Gaussian distribution):');
%This is a highly automated program, so there will be more input
if functions == 1
    shots = input('Please enter the number of shots N=');
    scatterPlot(shots,distribution);
    %If you want to draw a scatter plot, you only need the number of spot shots and call the drawing function
else
    %The following sections are used to generate probability line graphs
    typeStatistics = input('Select data type for statistics\n(1 shots, 2 repeats):');
    count = [0,0,0,0];
    probability = [0,0,0,0];
    if typeStatistics == 1
        %Take the number of spot shots as the x label
        repeats = input('Please enter the repetitions R=');
        for i = 1:4
            shots = input('Please enter the number of shots N=');
            Y = probabilityStatistics(shots, repeats, distribution);
            probability(i) = Y;
            count(i) = shots;
            %Record the probability and input to facilitate the production coordinate axis
            hold on;
        end       
        xlabel('Random Penalty Shots');
    else
        %Take the number of repeatitions as the x label
        shots = input('Please enter the number of shots N=');
        for i = 1:4
            repeats = input('Please enter the repetitions R=');
            Y = probabilityStatistics(shots, repeats, distribution);
            probability(i) = Y;
            count(i) = repeats;
            hold on;
        end
        xlabel('Repetitions');
    end
    plot(1:4,probability,'.-b');
    axis([0,5,0.47,0.53]);
    grid on;
    set(gca,'XTick',0:1:5);
    set(gca,'YTick',0.47:0.005:0.53);
    set(gca,'XTicklabel',{0,count(1),count(2),count(3),count(4),' '});
    ylabel('Probability');
    text(1:4,probability-0.003,num2str(probability.','%.4f'))
    hold off;
    %Some operations for coordinates
end

function [] = scatterPlot(shots,distribution)
%This function is used to plot a scatter plot
t=0:pi/60:pi*2;
x=sqrt(5)*cos(t);
y=sqrt(5)*sin(t);
plot(x,y,'-b');
%Draw a circle using parametric equations
hold on;
axis([-3, 3, -3, 3]);
axis equal;
grid on;
x=-2;
y=-1;
w=4;
h=2;
rectangle('Position',[x,y,w,h],'edgecolor','r');
%Draw a rectangle
score=0;
for i=0:shots
    t=rand(1)*2*pi;
    if distribution==1
        r=sqrt(rand(1))*sqrt(5);
    else
        r=randn(1)*sqrt(5);
    end
    %Select different distribution types
    x=r*cos(t);
    y=r*sin(t);
    if x<2&&x>-2&&y<1&&y>-1
        score=score+1;
        plot(x,y,'rx','MarkerSize',4);
    else
        plot(x,y,'bo','MarkerSize',4);
    end
    %Select different distribution types
end
p=score/shots;
title('The probability of scoring is', p);
text(2.7, 2.9, 'x: score', Color='r', FontSize=15);
text(2.7, 2.6, 'o: miss', Color='b', FontSize=15);
hold off;
end

function Y = probabilityStatistics(shots, repeats, distribution)
%This function is used to plot a statistical graph
P=0;
for i=1:repeats
    score=0;
    for j=0:shots
        t=rand(1)*2*pi;
        if distribution==1
            r=sqrt(rand(1))*sqrt(5);
        else
            r=randn(1)*sqrt(5);
        end
        %Select Distribution Type
        x=r*cos(t);
        y=r*sin(t);
        %Parametric equation
        if x<2&&x>-2&&y<1&&y>-1
            score=score+1;
        end
    end
    p=score/shots;
    P=P+p;
    %Obtaining probability
end
Y=P/repeats;
end
