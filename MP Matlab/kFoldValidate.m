function perfor = kFoldValidate(func,data,labs,k)
[r,c] = size(data);

splits = ones(1,k) *floor(r/k);
remainder = rem(r,k);
splits(1:remainder) = splits(1:remainder)+1;

indices = [0 cumsum(splits)];
randoms = randperm(r);
dataRandom = data(randoms,:);
labsRandom = labs(randoms);


for i = 1: k  
    train = dataRandom([1:indices(i) indices(i+1):end],:);
    test = dataRandom(indices(i)+1:indices(i+1),:);
    trainLabs = labsRandom([1:indices(i) indices(i+1):end]);
    testLabs = labsRandom(indices(i)+1:indices(i+1));
    clear lab
    if iscell(func)
        for j = 1: length(func)
            lab(:,j) = func{j}(train,trainLabs,test);            
        end
    else        
        testBepaald = func(train,trainLabs,test);
    end
    
    if iscell(func)
        testBepaald = mode(lab')';
    end    
    performance(i) = perf(testBepaald,testLabs);
end

perfor = sum(splits.*performance)/r;

    
