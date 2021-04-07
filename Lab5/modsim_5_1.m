clear vars;
in_rate=0.00218;
s0=762;
i0=1;
N=s0+i0;
s=s0;
in=i0;
r=0;
re_rate=0.5;
time=15;
step_size=0.001;
A_array=zeros(1,time/step_size);
B_array=zeros(1,time/step_size);
C_array=zeros(1,time/step_size);
j=1;
rt=zeros(1,time/step_size);

for i=0:step_size:time
    t1=(in_rate*s*in)*step_size;
    t2=(re_rate*in)*step_size;
    s=s-t1;
    in=in+t1-t2;
    r=r+t2;
    A_array(1,j)=s;
    B_array(1,j)=in;
    C_array(1,j)=r;
    rt(1,j)=i;
    j=j+1;
end    
plot(rt,A_array);
hold on;
plot(rt,B_array);
hold on;
plot(rt,C_array);
hold on;