function plotit(data,i)
figure(i),hold on
for i=1:length(data)
    if data(i,3)==1
        plot(data(i,1),data(i,2),'b*');
    else
        plot(data(i,1),data(i,2),'ro');
    end
end
end