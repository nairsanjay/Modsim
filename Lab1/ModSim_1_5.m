A=10;
B=0;
C=0;
rateA=1;
rateB=0.1;
a2b=1;%how many molecule of b created when one molecule of a disintegrates
b2c=1;
time=10;
step_size=0.01;


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

plot(time1,B_array./A_array);
xlabel('Time');
ylabel('B/A');