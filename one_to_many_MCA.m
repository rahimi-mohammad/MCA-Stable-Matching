function stablematch = one_to_many_MCA(quote, N, nodes_pref, channel_pref)
    %#codegen  

    M = N;
    acceptance = zeros(N, 1);
    Buffer = zeros(N, N);
    iter = 0;
    
    while sum(acceptance) ~= N
        iter = iter + 1;
        
        for j = 1:N
            if acceptance(j) == 0
                Buffer(j, :) = 0;
                Buffer(j, nodes_pref(j, 1)) = j;
                nodes_pref(j, :) = [nodes_pref(j, 2:end), 0];
            end
        end
        
        acceptance = zeros(N, 1);
        cap = quote * ones(M, 1);

        for j = 1:M
            for k = 1:N
                if channel_pref(j, k) == Buffer(channel_pref(j, k), j)
                    cap(j) = cap(j) - 1;
                    acceptance(channel_pref(j, k)) = 1;
                end
                if cap(j) == 0
                    break;
                end
            end
        end
    end
    
    stablematch = Buffer;
end
