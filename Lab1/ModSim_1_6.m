A=1;
B=0;
C=0;
rateA=0.00000117;
rateB=0.181;
a2b=1;%how many molecule of b created when one molecule of a disintegrates
b2c=1;
time=365*2;
step_size=0.1;


B_array=zeros(1,time/step_size);
C_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
time1=zeros(1,time/step_size);
j=1;

for i=0:step_size:time
    A_array(1,j)=A;
    B_array(1,j)=B;
    C_array(1,j)=C;
    time1(1,j)=i;
    j=j+1;
     C=C+b2c*(rateB*B)*step_size;
    B=B+a2b*(rateA*A)*step_size-(rateB*B)*step_size;;  
    A=A-(rateA*A)*step_size;
    
    
end

plot(time1,A_array);
hold on;
plot(time1,B_array);
legend('A','B');
xlabel('Time in days');
ylabel('Quantity');
