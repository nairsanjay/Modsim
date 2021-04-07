r=0.05;
M=100;
A=50;
B=0;

A0=20;

time=100;
step_size=0.001;
B_array=zeros(1,time/step_size);
C_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;

for i=0:step_size:time
  death=(r*(A))*((A)/M);
  birth=(r*A);
  A=A+(birth-death)*step_size;
  A_array(1,j)=A;
  B_array(1,j)=death*step_size;
  C_array(1,j)=birth*step_size;
  j=j+1;
end

plot(rt,B_array,'--');
hold on;
plot(rt,C_array);
xlabel('Time');
ylabel('Population');
grid;
hold on;
