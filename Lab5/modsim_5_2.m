clear vars;
R0=2.75;
in_rate=0.298;
A=[]



for s0=10:1:10000
    
i0=1;
N=s0+i0;
s=s0/N;
in=i0/N;
in2=i0/N;
r=0;
re_rate=(in_rate/R0);

ma=-1;
t212=0;
time=1000;
step_size=0.01;
%A_array=zeros(1,time/step_size);
%B_array=zeros(1,time/step_size);
%C_array=zeros(1,time/step_size);
j=1;
rt=zeros(1,time/step_size);

for i=0:step_size:time
    t1=(in_rate*s*in)*step_size;
    t2=(re_rate*in)*step_size;
    s=s-t1;
    in=in+t1-t2;
    if ma<in
    ma=in;
    t212=i;
    end
    in2=in2+t1;
    r=r+t2;
    %A_array(1,j)=s;
    %B_array(1,j)=in2;
    %C_array(1,j)=r;
    %rt(1,j)=i;
    j=j+1;
end    
A=[A in2];

end
plot(10:1:10000,A)