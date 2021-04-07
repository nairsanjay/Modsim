close all;
clear vars;
sims=2000;
n=20;

x5=[];
y5=[];
t5=[];

for j=1:sims
    
x2=zeros(1,n);
y2=zeros(1,n);
av=zeros(1,n);
j=1;
x=0;
y=0;
for i=1:n

      tmp1=randi([1,100]);
    
    if(tmp1<=19)
       y=y+1; 
    end
    if(tmp1>19&&tmp1<=43)
        y=y+1;
        x=x+1;
    end
    if(tmp1>43&&tmp1<=60)
        x=x+1;
    end
    if(tmp1>60&&tmp1<=70)
        y=y-1;
        x=x+1;
    end
    if(tmp1>70&&tmp1<=72)
        y=y-1;
    end
    if(tmp1>72&&tmp1<=75)
        y=y-1;
        x=x-1;
    end
    if(tmp1>75&&tmp1<=85)
        x=x-1;
    end
    if(tmp1>85)
        x=x-1;
        y=y+1;
    end
    
    
    
      y2(1,j)=y;
      x2(1,j)=x;
      av(1,j)=sqrt((sum(x2)/j)*(sum(x2)/j)+(sum(y2)/j)*(sum(y2)/j));
    j=j+1;
  
    
end

%figure(1)
%stem3(1:n,x2,y2);
%hold on;

x5=[x5,x2];
y5=[y5,y2];
t5=[t5,1:n];


%[tmp,tmp2]=size(x2);
%for i=2:tmp2
%quiver(x2(i-1),y2(i-1),(x2(i)-x2(i-1)),y2(i)-y2(i-1),1)
%pause(1);
%hold on;
%end
%figure(2);
%plot(1:n,av);
%hold on;
end

xv = linspace(min(x5), max(x5),  1000);
yv = linspace(min(y5), max(y5),  1000);
[X,Y] = meshgrid(xv, yv);
Z = griddata(x5,y5,t5,X,Y);
figure
contourf(X, Y, Z)
colorbar
hold on;

xlabel('x');
ylabel('y');
zlabel('Steps(n)');


