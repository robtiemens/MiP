function [B,b0, SCX,SCY,LX,LY] = PLS(X,Y,LV)
% X is de datamatrix waarmee matrix Y voorspeld gata worden. LV is het
% aantal eigenvecoten ('PC's') dat hiervoor gebruikt zal worden


E=meancenter(X);    % E is de gemeancenterde datamatrix X
F = Y;              % F is de datamatrix Y

for i =1:LV
S=E'*F;

[U,D,V] = svd(S,'econ');

w=U(:,1);       % dit is de eerste linker eigenvector
t=E*w;          % dit is de scorevector van X voor deze 'PC'
p=E'*t./(t'*t); % dit is de loadingvector van de matrix X voor deze 'PC'
q=F'*t./(t'*t); % dit is de loadingvector van de matrix Y voor deze 'PC'

W(:,i) = w;     % dit wordt de matrix met eigenvectoren
T(:,i) = t;     % dit wordt de scorematrix voor X
P(:,i) = p;     % dit wordt de loadingmatrix voor X
Q(:,i) = q;     % dit wordt de loadingmatrix voor Y

E = E - t*p';   % omdat de zojuist aangemaakte 'PC' al een deel van de data verklaard, wordt deze info ervan af getrokken.
F = F - t*q';   % hetzelfde geldt voor F.
end

if LV>0
    R = W*inv(P'*W);    
    B = R*Q';           % B bevat de coefficienten van de originele variabelen.
    SCX = T;            % Dit is de scorematrix van X
    SCY = Y*Q;          % dit is de scorematrix van Y
    LX = P;             % dit is de loadingmatrix van X
    LY = Q;             % dit is de loadingmatrix van Y
else
    [rij, kolom] = size(X);
    [rij, kolom2] = size(Y);
    B=zeros(kolom,kolom2);
end

b0=mean(Y)-mean(X*B);   % dit is het referentiepunt van de regressie

% B=[b0; B];