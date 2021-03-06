function [alpha nuy sigma] = init_em(fv, cluster, K)
% INIT_EM: init for EM
% TuanND
% 03/23
[num_pixel dim] = size(fv);
alpha = zeros(K,1);
nuy = zeros(K, dim);
sigma = cell(K, 1);
for k = 1:K
    k_index = find(cluster==k);
    size_group_k = length(k_index);
    alpha(k) = size_group_k/num_pixel;
    k_fv = fv(k_index,:);
    nuy(k,:) = mean(k_fv);
    temp_sigma = 0;
    for j = 1:size_group_k        
        diff = k_fv(j,:) - nuy(k,:);
        temp_sigma = temp_sigma + diff'*diff;
    end
    sigma{k} = temp_sigma/size_group_k;
end
end