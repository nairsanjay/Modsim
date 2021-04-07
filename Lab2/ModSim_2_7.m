a=log(2)/22;
plasma_vol=-1;

interval1=24;
interval=interval1;

A0=300; %in ug
absorb=1;
A=A0*absorb;
B=0;
amt_interval=1;



time=150;
step_size=0.001;
B_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;

for i=0:step_size:time
  A_array(1,j)=A;
  A1=A;
  j=j+1;
 A=A1-((A1)*a*step_size);
 
if interval~=-1 && mod(i,interval)==0 && i~=0
     A=A+(amt_interval*A0*absorb);
     
end
 
end


plot(rt,A_array,'--');
xlabel('Time(Hours)');
ylabel('Concentration in blood plasma');
grid;
hold on;
