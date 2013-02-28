function [autoscaled means devs] = autoscale(a)
%"autoscale" autoscales the input matrix. First the input matrix is
%meancenterd. Second all columns are divided by their column standard 
%deviations., this results in the new autoscaled matrix.
[i,j] = size(a);

[meancentered, means] = meancenter(a);

for n = 1:j
    devs(n) = std(a(:,n));
    autoscaled(:,n) = meancentered(:,n)./devs(n);
end
