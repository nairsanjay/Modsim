clear
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





x=0:step_size:0.8;
y=0:step_size:0.7;
[X,Y] = meshgrid(x,y);
R=(1-Y)*3.*(1-X);


contour(X,Y,R)




%plot(rt,A_array*N0);
hold on;
%plot(rt,B_array*N0);
%plot(rt,C_array*N0);
%plot(rt,D_array*N0);
%plot(rt,E_array*N0);
%plot(rt,F_array*N0);
%plot(rt,G_array*N0);
%plot(rt,(H_array+I_array)*N0);
%plot(rt,I_array*N0);

R0=k*b*(1-q)/(v+w+m)