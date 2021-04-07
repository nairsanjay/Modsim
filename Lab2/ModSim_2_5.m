a=0.21660849392;
plasma_vol=1;

interval=4;
rect_t=2;

A0=0; %in ug
absorb=1;
A=A0*absorb;
B=0;
amt_interval=0.5;



time=34;
step_size=0.001;
B_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;
bol=0;
k=1;
for i=0:step_size:time
  A_array(1,j)=A;
  A1=A;
  j=j+1;
  A=A1-((A1)*a*step_size);
 
if interval~=-1 && mod(i,interval)==0 
     kj=0;
     bol=1;
end

if bol==1
    A=A+(amt_interval*step_size);
    kj=kj+step_size;
    
    if kj>rect_t
        kj=0;
        bol=0;
    end
end

 
end


plot(rt,A_array);
xlabel('Time');
ylabel('Concentration in blood plasma');
hold on;




