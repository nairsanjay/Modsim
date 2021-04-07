clear vars;
R0=2;
in_rate=0.298;
s0=1040;
i0=1;
N=s0+i0;
s=s0/N;
in=i0/N;
in2=i0/N;
r=0;
re_rate=(in_rate/R0);

in_final=in_rate/3;





vac_frac=0.15;
lo_r=0.01;
lo_r2=0.05;
time=250;
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
    
    in_rate=in_rate+(lo_r*in_rate*(1-in_rate/in_final)*step_size);
    
    if i==100
        in_final=in_rate*3;
        lo_r=lo_r2;
    end
        
    
    in=in+t1-t2;
    in2=in2+t1;
    r=r+t2;
    A_array(1,j)=s;
    B_array(1,j)=in2;
    C_array(1,j)=r;
    rt(1,j)=i;
    j=j+1;
end    

plot(rt,B_array*N);
hold on;