function [ T_ ] = KNN( T )% The size of T is n*2
t=7;
T_=zeros(t,3);%T_?T
for i=1:t
    %随机选择t个数
    %r_index=floor(rand(1)*length(T)+1);
    %就取前几个数
    r_index=t;
    T_(i,:)=T(r_index,:);
    T(r_index,:)=[];
end

while true
    i=1;    flag=false;
    while i<=size(T,1)
        %找到T_中的距离T(i)的最小的那个点，或者多个点，之后再判断是不是同一类
        %m是返回的T_中的距离最小的下标值
        d=zeros(1,size(T_,1));
        for j=1:size(T_,1)
            x=T(i,:);
            y=T_(j,:);
            d(j)=sqrt((x(1)-y(1))^2+(x(2)-y(2))^2);
        end
        %tt 是距离排序之后前
        [~,tt]=sort(d);
        tt=tt(1:t);
        %res 里面应该只有1 和 0 来表示性别
        res=T_(tt,3);

        res=(res==T(i,3));
        %如果分类不正确，那么将这个值放到T_中，并且删除T中的这个值
        %原本是比较一个值的时候使用T(i,3)~=T_(m,3)来判断是不是相同的
        if sum(res)<(length(res)+1)/2
            T_=[T_;T(i,:)];
            T(i,:)=[];
            if isempty(T)
                flag=false;
                break;
            end
            flag=true;
        else
            %分类正确的情况下才将下表值加1
            i=i+1;
        end
    end
    if flag==false
        break;
    end
end
end