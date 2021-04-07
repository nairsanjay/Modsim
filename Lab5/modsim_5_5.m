clear vars
k=10;
b=0.06;
p=1/5.0;
v=0.040;
w=0.0625;
u=0.1;
q=0.2;
m=0.0975;

N0=10000000;
infect_ud=1000/N0;
sus=(N0-1000)/N0;
sus_quar=0;
expo=0;
expo_quar=0;
infect_quar=0;
infect_iso=0;
recover=0;
death=0;

time=700;
step_size=0.001;
j=1;
A_array=zeros(1,time/step_size);
B_array=zeros(1,time/step_size);
C_array=zeros(1,time/step_size);
D_array=zeros(1,time/step_size);
E_array=zeros(1,time/step_size);
F_array=zeros(1,time/step_size);
G_array=zeros(1,time/step_size);
H_array=zeros(1,time/step_size);
I_array=zeros(1,time/step_size);


rt=zeros(1,time/step_size);


for i=0:step_size:time
    t1=k*q*(1-b)*infect_ud*sus;
    t2=k*q*b*infect_ud*sus;
    t3=k*(1-q)*b*infect_ud*sus;
    t6=u*sus_quar;
    t4=p*expo;
    t5=p*expo_quar;
    t7=v*infect_quar;
    t8=v*infect_ud;
    t9=v*infect_iso;
    t10=m*infect_quar;
    t11=m*infect_ud;
    t12=m*infect_iso;
    t13=w*infect_ud;
    t14=w*infect_quar;
    
    t14=t14*step_size;
    t1=t1*step_size;
    t2=t2*step_size;
    t3=t3*step_size;
    t4=t4*step_size;
    t5=t5*step_size;
    t6=t6*step_size;
    t7=t7*step_size;
    t8=t8*step_size;
    t9=t9*step_size;
    t10=t10*step_size;
    t11=t11*step_size;
    t12=t12*step_size;
    t13=t13*step_size;
    
 
    
    sus=sus-t1-t2-t3+t6;
    sus_quar=sus_quar+t1-t6;
    expo=expo+t3-t4;
    expo_quar=expo_quar+t2-t5;
    infect_ud=infect_ud+t4-t8-t11-t13;
    infect_quar=infect_quar+t5-t7-t10-t14;
    infect_iso=infect_iso+t13-t12-t9+t14;
    recover=recover+t7+t8+t9;
    death=death+t10+t11+t12;
    
    
    if i==125
      q=1-0.99*(v+m+w)/(k*b);
    end
    
    
    A_array(1,j)=sus;
    B_array(1,j)=sus_quar;
    C_array(1,j)=expo;
    D_array(1,j)=expo_quar;
    E_array(1,j)=infect_ud;
    F_array(1,j)=infect_quar;
    G_array(1,j)=infect_iso;
    H_array(1,j)=recover;
    I_array(1,j)=death;
    rt(1,j)=i;
      j=j+1;
end

%plot(rt,A_array*N0);
hold on;
%plot(rt,B_array*N0);
%plot(rt,C_array*N0);
%plot(rt,D_array*N0);
%plot(rt,E_array*N0);
%plot(rt,F_array*N0);
%plot(rt,G_array*N0);
plot(rt,(H_array+I_array)*N0);
%plot(rt,I_array*N0);

R0=k*b*(1-q)/(v+w+m)