close all;
sims=20000;
n=20;

y4=zeros(1,sims);
y5=[];
jk=1;

for j=1:sims
y=zeros(1,n);
y2=zeros(1,n);

y1=0;
j=1;
for i=1:n

    tmp=randi([0,2]);
    
    
    if(tmp==0)
        y1=y1-1;
    end
    if(tmp>0)
        y1=y1+1;
    end
      y(1,j)=y1;
    avg=sum(y)/j;
    y2(1,j)=avg;
    j=j+1;
  
    
end

y4(1,jk)=y1;
y5=[y5;y];
jk=jk+1;
%figure(1)
%plot(1:(n),y);
%hold on;
%figure(2);

%plot(1:(n),y2);
%hold on;
end
figure(1);
h = histogram(y4,'Normalization','probability');
hold on;

x=0:n;

y = binopdf(x,n,2/3);
stem(-n:2:n,y);
legend('From simulation','Actual Binomial');


%figure(4);
%heatmap(corrcoef(y5),'Colormap',hot);
