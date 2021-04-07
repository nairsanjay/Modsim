r=0.05;
M=100;
A=50;
B=0;
time=100;
step_size=0.001;
B_array=zeros(1,time/step_size);
interval=1;
h =0.0025;
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;
for i=0:step_size:time
  A_array(1,j)=r*(i*(1-i/M))-(h*i);
  j=j+1;
end
plot(rt,A_array,'-.');
xlabel('Population');
ylabel('dP/dt');
grid;
hold on;
