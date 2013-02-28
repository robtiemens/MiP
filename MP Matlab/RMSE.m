function [RMSE] = RMSE(Y,YP)
[a,b] = size(Y);
RMSE= sqrt((1/a)*sum((Y-YP).^2));
end