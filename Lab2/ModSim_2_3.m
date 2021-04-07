a=0.21660849392;
plasma_vol=1;

interval=4;

A0=1; %in ug
absorb=1;
A=A0*absorb;
B=0;
amt_interval=1;



time=54;
step_size=0.001;
B_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;

for i=0:step_size:time
  A_array(1,j)=A;
  A1=A;
  j=j+1;
 A=A1-((A1)*a*step_size);
 
if interval~=-1 && mod(i,interval)==0 && i~=0
     A=A+(amt_interval*A0*absorb);
end
 
end


plot(rt,A_array);

hold on;

A=A0*absorb;
b=a;
a=100;



B_array=zeros(1,time/step_size);
A_array=zeros(1,time/step_size);
rt=0:step_size:time;
j=1;

for i=0:step_size:time
  A_array(1,j)=A;
  B_array(1,j)=B;
  A1=A;
  B1=B;
  j=j+1;
 A=A1-((A1)*a*step_size);
 B=B1+((A1)*a*step_size)-(B1*b*step_size);

 if interval~=-1 && mod(i,interval)==0 && i~=0
     A=A+(amt_interval*A0*absorb);
end

 
 
end

plot(rt,B_array,'--');
legend('One Compartment model','2 compartment model');
ylabel('Concentration');
xlabel('Time(hours)');
grid;









