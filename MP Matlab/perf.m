function performance = perf(crt,second)

if nargin == 2
    crt = crosstable(crt,second);
end

%perf(crt) calculates the 'performance' of a classification in terms of the
%fraction of labels that was assigned correctly.

samples = sum(sum(crt));    %'samples' is het totaal aantal labels.

%De juist toegewezen labels staan op de diagonaal, dus eerst worden alle
%andere cijfers 0 gemaakt:
[rij, kolom] = size(crt);
right = crt.*eye(rij,kolom);
performance = sum(sum(right))/samples;
