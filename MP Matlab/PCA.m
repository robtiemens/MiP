function [Tmatrix, Pmatrix, variance] = PCA(a)

[i,j]=size(a);
a = meancenter(a);

[U,D,V] = svd(a,'econ');
size(D);
Tmatrix = U*D;
Pmatrix = V;
D2 = D.^2;

for n = 1: length(D)
    variance(n) = D2(n,n);
end
