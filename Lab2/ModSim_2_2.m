a=0.5;
b=0.21660849392;
plasma_vol=3;

interval=4;

A0=100; %in ug
absorb=0.12;
A=400;
B=0;
amt_interval=2;



time=54;
step_size=0.001;
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
     A=A+(300);
 end
 if  i==4
     A=A+(300);
 end
 if i>=24 && mod(i,8)==0
     A=A+(100);
 end
 
end


plot(rt,A_array/plasma_vol);
hold on;
plot(rt,B_array/plasma_vol,'--');
legend('A','B');
ylabel('Concentration');
xlabel('Time(hours)');
grid;
legend('Concentration in Gut','Concentration in blood');






