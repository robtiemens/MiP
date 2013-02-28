function labs = logReg(train, trainLabs, test,func)
[B B0] = func(train,trainLabs);
labs = round(regressionPredict(B, B0,test));

