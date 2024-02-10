clc
close all

N = 10;             % Number of nodes
M = 10;             % Number of frequencies
N_trial = 1;        % Number of trials

receiver_average_power = zeros(5, 1);

for quota = 1:1:5     % Varying quota values
    
    received_power = zeros(N_trial, M);
    
    for i = 1:N_trial
        % Generate random channel gains and power levels
        channel_gain = exprnd(1, N, M);
        power = rand(1, N);
        
        % Sort preferences
        [~, nodes_pref] = sort(channel_gain, 2, 'descend');
        [~, index] = sort(power, 2, 'descend');
        
        % Generate channel preferences
        channel_pref = zeros(M, N);
        for j = 1:M
            channel_pref(j, :) = index;
        end
        
        % Perform stable matching
        MCA_pairs = one_to_many_MCA(quota, N, nodes_pref, channel_pref);
        MCA_pairs = sort(MCA_pairs, 'descend');
        MCA_pairs = MCA_pairs(1:quota, :);
        
        % Calculate received power
        for j = 1:M
            for k = 1:quota
                if MCA_pairs(k, j) ~= 0
                    received_power(i, j) = received_power(i, j) + power(MCA_pairs(k, j)) * channel_gain(MCA_pairs(k, j), j);
                end
            end
        end
    end
    
    % Calculate average receiver power
    receiver_average_power(quota) = sum(sum(received_power) / N_trial) / M;
end

%% Plotting
figure
bar(1:5, receiver_average_power, 0.3)
title('Stable Matching')
xlabel('Quota')
ylabel('Receiver Average Power')

figure
plot(1:5, receiver_average_power)
title('Stable Matching')
xlabel('Quota')
ylabel('Receiver Average Power')
