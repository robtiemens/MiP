function [labs g] = knn2(test,train,L1,k)
% Attempts to find the label all objects in objects by use of fuzzy k nearest
% neighboor approach. dists are the fuzzy distances to the training object,
%L1 are their labels and k is the ammount of neightboors taken into account
labs = zeros(size(test,1),1);
for i = 1: size(test,1)    
    [r,~] = size(train);
    dist=sum((train - repmat(test(i,:),r,1)).^2,2);
    [~, f] = sort(dist); %sets the indices of the k closest in f
    g = zeros(size(test,1),max(L1));
    for j = 1: k
        g(i,L1(f(j))) = g(i,L1(f(j))) + 1;   %counts the clusters
    end
    [maxi, lab] = max(g(i,:)); %determines the label
    if lab ~= find(g(i,:)==maxi,1,'last')    %checks for a tie
        lab = knn2(test(i,:),train, L1,k+1);   %recusively calls itself with k= k+1;
    end
    labs(i) = lab;
end