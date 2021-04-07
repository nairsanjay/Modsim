r=0.00001;
M=100;
A=15;
B=0;



time=5000;
step_size=0.001;
B_array=zeros(1,time/step_size);

interval=5;
h =0.1;
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;

for i=0:step_size:time
    
  death=(r*A)*(A/M);
  birth=(r*A);
  if i~=0 && mod(i,interval)==0
      A=A-h*A;
  end
  A=A+birth-death;
  A_array(1,j)=A;
  j=j+1;
end
 



plot(rt,A_array);
xlabel('Time');
ylabel('Population');
grid;
hold on;
