close all;
clear vars;
sims=1;
n=20;
for j=1:sims
x2=zeros(1,n);
y2=zeros(1,n);
av=zeros(1,n);
j=1;
x1=0;
y1=0;
for i=1:n

          y2(1,j)=y1;
      x2(1,j)=x1;
      av(1,j)=sqrt((sum(x2)/j)*(sum(x2)/j)+(sum(y2)/j)*(sum(y2)/j));
    j=j+1;
    
    tmp1=randi([0,3]);
    tmp2=randi([0,3]);
    
    if(tmp1==0)
        y1=y1-1;
    end
    if(tmp1>0)
        y1=y1+1;
    end
    
    if(tmp2==0)
        x1=x1-1;
    end
    if(tmp2>0)
        x1=x1+1;
    end
    

  
    
end


scatter(x2,y2);
hold on;
[tmp,tmp2]=size(x2);
for i=2:tmp2
quiver(x2(i-1),y2(i-1),(x2(i)-x2(i-1)),y2(i)-y2(i-1),1)
pause(1);
hold on;
end
figure(2);
plot(av);
hold on;
end