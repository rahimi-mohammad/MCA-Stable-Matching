clc
close all
N=10;       % number of nodes
M=10;       % number of frequencies
N_trial=1;
%% stable one-to-many matching
receiver_average_power=zeros(5,1);
for quota=1:1
    
    received_power=zeros(N_trial,M);
    for i=1:N_trial
      channel_gain=exprnd(1,N,M);
      power=rand(1,N);
      [~,nodes_pref] = sort(channel_gain,2,'descend');
      [~,index]=sort(power,2,'descend');
       channel_pref=zeros(M,N);
        for j=1:M
            channel_pref(j,:)=index;    
        end
      MCA_pairs=one_to_many_MCA(quota,N,nodes_pref,channel_pref);
      MCA_pairs=sort(MCA_pairs,'descend');
      MCA_pairs=MCA_pairs(1:quota,:);
        for j=1:M
           for k=1:quota
                if(MCA_pairs(k,j)~=0)
                received_power(i,j)=received_power(i,j)+power(MCA_pairs(k,j))*channel_gain(MCA_pairs(k,j),j);
                end
           end
        end
    
    end
    receiver_average_power(quota)=sum(sum(received_power)/N_trial)/M;
end
%% curves
figure
bar(1:5,receiver_average_power,0.3)
title('Stable Matching')
xlabel('quota')
ylabel('receiver average power')
figure
plot(1:5,receiver_average_power)
title('Stable Matching')
xlabel('quota')
ylabel('receiver average power')

