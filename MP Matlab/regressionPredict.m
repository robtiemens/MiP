function scores = regressionPredict(B,B0,data)

scores = B'*data' + B0;