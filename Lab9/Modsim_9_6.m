sims=1000;
arr1=[];
for jk=1:sims


cold_temp=0;
amb_temp=25;
hot_temp=50;

check=0.000001;
tmp123=[];
r=0.125;

m=20;
n=20;
lat=zeros(m+2,n+2);
lat2=zeros(m+2,n+2);
lat3=zeros(m+2,n+2);
for i=1:(m+2)
    for j=1:(n+2)
        lat(i,j)=amb_temp;
    end
end
hot=[[5,2]];
cold=[4,2];

time=20;
ctr=1;
    while(ctr<=length(hot))
        lat(hot(ctr),hot(ctr+1))=hot_temp;
        lat3(hot(ctr),hot(ctr+1))=-1;
        
        ctr=ctr+2;
    end
     ctr=1;
    while(ctr<=length(cold))
        lat(cold(ctr),cold(ctr+1))=cold_temp;
        lat3(cold(ctr),cold(ctr+1))=-1;
        ctr=ctr+2;
    end
time_till_applied=time;
boundary_temp=50;
    
    for j=2:(n+1)
        lat(1,j)=boundary_temp;
        lat(m+2,j)=boundary_temp;
    end
    for j=2:(m+1)
        lat(j,1)=boundary_temp;
        lat(j,n+2)=boundary_temp;
    end

 lat(1,1)=boundary_temp;
 lat(m+2,n+2)=boundary_temp;
 lat(m+2,1)=boundary_temp;
 lat(1,n+2)=boundary_temp;
   
for i=1:time
tic
    

    
    lat2=lat;
     for jk=2:(m+1)
        for j=2:(n+1)
             if(lat3(jk,j)~=-1||i>time_till_applied)
             r=normrnd(0,0.5,1,8);
             r=r+1;
             r=r/sum(r);
             lat2(jk,j)=(lat(jk-1,j-1)*r(1,1)+lat(jk-1,j)*r(1,2)+lat(jk-1,j+1)*r(1,3)+lat(jk,j-1)*r(1,4)+lat(jk,j+1)*r(1,5)+lat(jk+1,j-1)*r(1,6)+lat(jk+1,j)*r(1,7)+lat(jk+1,j+1)*r(1,8));
             end
         end
     end
    % flag=0;
     
     %for j=1:n+2
      %   for jk=1:m+2
       %    if(abs(lat(jk,j)-lat2(jk,j))>check)
        %       flag=1;
         %      break;
          % end
         %end
         %if flag==1
          %   break;
         %end
     %end
     

     
     
        lat=lat2;
       % figure(1);
       % h=heatmap(lat,'Colormap',jet);
        %caxis([cold_temp,hot_temp])
        %grid off
       % Ax = gca;
        %Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
        %Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
        %title("time="+string(i));
        toc
        %pause(0.01);
      %if flag==0
       %  break;
     %end
end
arr1=[arr1 lat(ceil((m+2)/2),ceil((n+2)/2))];
end
figure(2);
histogram(arr1)


