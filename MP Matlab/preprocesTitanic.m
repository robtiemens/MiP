load data)Raw.mat
filterVect = isnan(titanicData(:,2));
titanicData(filterVect,2) = mean (titanicData(~filterVect,2));
survived = survived +1;
filteredTitanic = titanicData;
scaledTitanic = [filteredTitanic(:,1) titanicData(:,2:end)];
%scaledTitanic = [filteredTitanic(:,1) filteredTitanic(:,2:end)];
scaledTitanicComplete = [scaledTitanic sex embark];
filteredSurvive = survived(filterVect)+1;
varNames = {'class', 'age', 'siblings','parents','S','C','Q','sex','no inf'};
%scaledTitanicComplete(:,3:4) = (scaledTitanicComplete(:,3:4));


scaledTitanicComplete = scaledTitanicComplete(:,1:8);
%
% kFoldValidate(@(x,y,z) bomen(x,y,z,70),scaledTitanicComplete,filteredSurvive,10); 
[r,c] = size(scaledTitanicComplete);

for i = 1: r
    for j = 8 : 10
        if isempty(textdata{i,j})
            addition(i,j-7) = 0;
        else
            addition(i,j-7) = 1;
        end
    end
end
scaledTitanicComplete = [scaledTitanicComplete addition];
blaab = toAbsencepresence(scaledTitanicComplete(:,1))*0.5;

%autoscaledTianic = autoscale(scaledTitanicComplete);
%kFoldValidate(@(x,y,z) bomen(x,y,z,40),scaledTitanicComplete,filteredSurvive,10) 
%loo(scaledTitanicComplete,filteredSurvive,1,5)
%scaledTitanicComplete(:,3:4) = sqrt(scaledTitanicComplete(:,3:4)+2);
scaledTitanicComplete(:,[1 3:end]) = autoscale(scaledTitanicComplete(:,[1 3:end]));
[B, B0] = PLS(scaledTitanicComplete(~filterVect,[1 3:end]),scaledTitanicComplete(~filterVect,2),2);
scaledTitanicComplete(filterVect,2) = regressionPredict(B,B0,scaledTitanicComplete(filterVect,[1 3:end]));
scaledTitanicComplete = autoscale(scaledTitanicComplete);
scaledTitanicComplete(:,1) = scaledTitanicComplete(:,1)*1.5; 
scaledTitanicComplete(:,8) = scaledTitanicComplete(:,8)*1.2; 
scaledTitanicComplete(:,5:7) = scaledTitanicComplete(:,5:7)*0.8;
scaledTitanicComplete(:,3:4) = scaledTitanicComplete(:,3:4)*0.8;
scaledTitanicComplete(:,2) = scaledTitanicComplete(:,2)*1.5;
scaledTitanicComplete(:,9:11) = scaledTitanicComplete(:,9:11)*0.5;

[S,L,V] = PCA(scaledTitanicComplete);
%biplotChem(S,L,1,2,V,survived,varNames)

%scaledTitanicComplete(:,1) = sqrt(scaledTitanicComplete(:,1)+2);

%scaledTitanicComplete= [scaledTitanicComplete(:,2:end) blaab];

%perf(loo(scaledTitanicComplete,filteredSurvive,1,7))
% [B,b0] = PLS(scaledTitanicComplete,filteredSurvive,3);
% predicts = round(regressionPredict(B,b0,scaledTitanicComplete));
% perf(predicts,filteredSurvive)
% @(train,trainLabs,test) knn2(test,train,trainLabs,5),@(train,trainLabs,test) logReg(train,trainLabs, test,@(a,b) PLS(a,b,2)) 
funcCell = {@(train,trainLabs,test) logReg(train,trainLabs, test,@(a,b) PLS(a,b,4)), @(x,y,z) bomen(x,y,z,35),@(train,trainLabs,test) knn2(test,train,trainLabs,7)};
kFoldValidate(funcCell,scaledTitanicComplete,survived,10)