N = 10;         % Number of nodes
M = 10;         % Number of frequencies
quota = 1;
N_trial = 1;

received_power_MCA = zeros(N_trial, N);
received_power_WCA = zeros(N_trial, N);

for i = 1:N_trial
    channel_gain = exprnd(1, N, M);
    power = rand(1, N);
    
    [~, nodes_pref] = sort(channel_gain, 2, 'descend');
    [~, index] = sort(power, 2, 'descend');
    
    channel_pref = zeros(M, N);
    for j = 1:M
        channel_pref(j, :) = index;
    end
    
    MCA_pairs = one_to_many_MCA(quota, N, nodes_pref, channel_pref);
    MCA_pairs = sort(MCA_pairs, 'descend');
    MCA_pairs = MCA_pairs(1:quota, :);
    
    WCA_pairs = one_to_many_MCA(quota, N, channel_pref, nodes_pref);
    WCA_pairs = sort(WCA_pairs, 'descend');
    WCA_pairs = WCA_pairs(1:quota, :);
    
    for j = 1:M
        received_power_MCA(i, j) = power(MCA_pairs(j)) * channel_gain(MCA_pairs(j), j);
    end
    
    for j = 1:N
        received_power_WCA(i, WCA_pairs(j)) = power(j) * channel_gain(j, WCA_pairs(j));
    end
end

avg_power_MCA = sum(sum(received_power_MCA) / N_trial);
avg_power_WCA = sum(sum(received_power_WCA) / N_trial);

fprintf('Average power received in MCA: %.2f\n', avg_power_MCA);
fprintf('Average power received in WCA: %.2f\n', avg_power_WCA);
disp('MCA pairs:');
disp(MCA_pairs);
disp('WCA pairs:');
disp(WCA_pairs);
