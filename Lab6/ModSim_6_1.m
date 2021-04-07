clear;
%close all;
time=1500;
step_size=0.01;
A_array=zeros(1,time/step_size);
B_array=zeros(1,time/step_size);
C_array=zeros(1,time/step_size);
D_array=zeros(1,time/step_size);
E_array=zeros(1,time/step_size);
F_array=zeros(1,time/step_size);
G_array=zeros(1,time/step_size);
H_array=zeros(1,time/step_size);
I_array=zeros(1,time/step_size);
j=1;
rt=zeros(1,time/step_size);


un_human=300;
ho_human=1;
im_human=0;
dead_human=0;

vector=0;
un_mosq=300;

prob_bit=0.05;
prob_vector=0;
prob_bite_human=0.3;
prob_host=0;
reco_rate=0.3;
death_rate=0.005;
immune_rate=0.01;

birth_rate=0.01;
death_mosq_rate=0.5;
total=0;
for i=0:step_size:time
    prob_vector=vector/(vector+un_mosq);
    prob_host=ho_human/(ho_human+im_human+un_human);
    t1=(reco_rate*ho_human)*step_size;
    t2=(prob_bit)*(prob_vector)*un_human*step_size;
    t3=(immune_rate*ho_human)*step_size;
    t4=(death_rate*ho_human)*step_size;
    

    t5=(vector+un_mosq)*birth_rate*step_size;
    t6=vector*death_mosq_rate*step_size;
    t7=un_mosq*death_mosq_rate*step_size;
    t8=un_mosq*prob_bite_human*prob_host*step_size;
    
    total=total+t2;
    
    
    un_mosq=un_mosq+t5-t7-t8;
    vector=vector-t6+t8;
    
    un_human=un_human+t1-t2;
    ho_human=ho_human+t2-t3-t4-t1;
    im_human=im_human+t3;
    dead_human=dead_human+t4;
    
    A_array(1,j)=total;
    B_array(1,j)=vector;
    C_array(1,j)=un_human;
    D_array(1,j)=ho_human;
    E_array(1,j)=im_human;
    F_array(1,j)=dead_human;
    rt(1,j)=i;
      j=j+1;
    
    
end

plot(rt,A_array);
hold on;
%hold on;
%plot(rt,B_array);
%legend('un-infected mosq','vector mosq') 
%figure;
%plot(rt,C_array);
%hold on
%plot(rt,D_array);
%plot(rt,E_array);
%plot(rt,F_array);
grid;
%legend('un-infected mosq','vector mosq','un-infected human', 'host','Immune Human','Death');