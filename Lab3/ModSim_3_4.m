r=0.00001;
M=100;
m=20;
A=19.99;
B=0;
time=250;
step_size=0.001;
B_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;
A0=20;
for i=0:step_size:time
  A=A+r*A*(A-A0)*(1-(A/M));
  A_array(1,j)=A;
  j=j+1;
end
 



plot(rt,A_array);
xlabel('Time');
ylabel('Population');
grid;
hold on;
