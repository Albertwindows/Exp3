function [res]=confirm(B,Test)
n=size(Test,1);
m=size(B,1);
dis=zeros(n,m);
%res 是 用来储存通过压缩的样本来计算获得的结果.0/1
res=zeros(n,1);
ts=7;

for i=1:n
    fn=0;mn=0;
    x=Test(i,:);
    for j=1:m
        y=B(j,:);
        dis(i,j)=sqrt((x(1)-y(1))^2+(x(2)-y(2))^2);
    end
    [~,b]=sort(dis(i,:));
    for j=1:ts
        if  B(b(j),3)==1
            fn=fn+1;
        else
            mn=mn+1;
        end
    end
    if  fn > mn
        res(i)=1;
    else
        res(i)=0;
    end
end
end