r=0.05;
M=100;
A=23.6;
B=0;
time=500;
step_size=0.001;
B_array=zeros(1,time/step_size);
interval=1;
h =0.0025;
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;
for i=0:step_size:time
  death=(r*A)*(A/M);
  birth=(r*A);
  harvesting=h*A;
  if A>0
      A=A+(birth-death-harvesting)*step_size;
  else
      A=0;
  end
  A_array(1,j)=A;
  j=j+1;
end
plot(rt,A_array,'-.');
xlabel('Time');
ylabel('Population');
grid;
hold on;