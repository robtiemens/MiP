function X = toAbsencepresence(labs)

numberLabs = max(labs);
X = zeros(length(labs),numberLabs);
for i = 1: numberLabs
    X(:,i) = labs== i;
end
