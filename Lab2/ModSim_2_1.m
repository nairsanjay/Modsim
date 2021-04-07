a=2;
b=0.21660849392;
plasma_vol=1;

interval=2;

A0=1; %in ug
absorb=1;
A=A0*absorb*3;
B=0;
amt_interval=2;



time=24;
step_size=0.0001;
B_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;

for i=0:step_size:time
  A_array(1,j)=A;
  B_array(1,j)=B;
  A1=A;
  B1=B;
  j=j+1;
 A=A1-((A1)*a*step_size);
 B=B1+((A1)*a*step_size)-(B1*b*step_size);
 if  i==2
     A=A+(amt_interval*A0*absorb);
 end
end

plot(rt,A_array/plasma_vol);
hold on;
plot(rt,B_array/plasma_vol,'--');
legend('A','B');
xlabel('Time(hours)');
ylabel('Concentration');
grid;
legend('Concentration in Gut','Concentration in blood');