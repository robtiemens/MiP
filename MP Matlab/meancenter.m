function [meancentered, means] = meancenter(a)
%meancenter calculates all of the column means and saves these values in 
%the vector 'means'. Then, these means are substracted per column to create
%the meancentered matrix.

[i,j] = size(a);

means=mean(a);
B = repmat(means,i,1);

meancentered= a-B;



% for n=1:j
%     means(n) = mean(a(:,n));
%     meancentered(:,n) = a(:,n) - means(n);
% end