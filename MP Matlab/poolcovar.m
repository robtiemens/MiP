function [pooledcovar] = poolcovar(data,classes)
% [a,b]=size(data);
pool = 0;
for n= 1: max(classes)
%     class(n,:) =find(classes==n);
    class = find(classes==n);
%     cov(:,b*n-(b-1):b*n) = varcovar(data(class,:));
    cov = varcovar(data(class,:));
    pool = pool + cov/length(class);
end

pooledcovar = 1/length(data)*pool;