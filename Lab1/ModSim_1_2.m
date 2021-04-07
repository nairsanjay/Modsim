A=10;
B=0;
C=0;
rateB=0.5;
a2b=1;%how many molecule of b created when one molecule of a disintegrates
b2c=1;
time=5;
step_size=0.01;

time1=0.1:0.01:1;
j=1;
rt=0.1:0.01:1;

for rateA=0.1:0.01:1
max_A=-1;
A=10;
B=0;
C=0;
for i=0:step_size:time
    if max_A<rateB*B+rateA*A
        time1(1,j)=i;
        max_A=rateB*B+rateA*A;
    end
    C=C+b2c*(rateB*B)*step_size;
    B=B+a2b*(rateA*A)*step_size-(rateB*B)*step_size;;  
    A=A-(rateA*A)*step_size;
    
    
end
j=j+1;
end

plot(rt,time1);
xlabel('Rate of decay of A(a)');
ylabel('Time at which maximum radioactivity occurs');

