clear vars;
beta=1;
p=0.00261;
q=0.21565;
Na=100;
N=0;
qt=q*power((N/Na),1+beta);
time=100;
step_size=0.001;
A_array=zeros(1,time/step_size);
rt=zeros(1,time/step_size);
j=1;
B_array=zeros(1,time/step_size);
C_array=zeros(1,time/step_size);
for i=0:step_size:time
    A_array(1,j)=N;
    B_array(1,j)=(p+qt)*(Na-N)*step_size;
    C_array(1,j)=(p+qt)*(Na-N);
    N=N+((p+qt)*(Na-N)*step_size);
    qt=q*power((N/Na),beta+1);
    
    rt(1,j)=i;
    j=j+1;
end
plot(rt,A_array);
hold on;