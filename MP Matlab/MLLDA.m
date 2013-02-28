function [labs]= MLLDA(trainset,trainlabs,testdata)
[a,b] = size(testdata);
samples = a;    %samples is het aantal rijen 'testdata'.

pcv = poolcovar(trainset,trainlabs);    %de pooled covariance wordt gebruikt voor MLLDA

%Voor elk klassengemiddelde uit de trainingset wordt de mahalanobis
%distance matrix berekend.
for n = 1:max(trainlabs);
    class = find(trainlabs==n);                 %klasses zoeken in trainingset
    means(n,:) = mean(trainset(class,:));       %klassengemiddelde uit trainingset bepalen.
    md=mahala(testdata,means(n,:),pcv);     	%mahalanobis distancematrix berekenen.
    %In 'md' staan de afstanden tussen samples en het betreffende
    %klassencentrum ('mean') op de diagonaal. Daarom worden deze waarden
    %eruit gehaald en in een vector bewaard:
    dist2mean(:,n) = sum(eye(samples).*md,2);    %de afstanden van sample tot mean
    %In 'dist2mean' staan varieren de samples over de rijen en de 
    %klassengemiddelden over de kolommen.
end

%Nu alleen nog de minimale waarden zoeken.
dist2mean=abs(dist2mean');
[mins class] = min(dist2mean);

labs=class';