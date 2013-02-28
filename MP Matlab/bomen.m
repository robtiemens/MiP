function labels = bomen(train,trainlabs, test,n)
boom = TreeBagger(n,train,trainlabs);
labels = predict(boom,test);
labels = double(cell2mat(labels)) -48;