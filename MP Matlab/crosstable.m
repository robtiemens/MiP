function tabel = crosstable(LAB1,LAB2)
    a=max(LAB1);
    b=max(LAB2);
    tabel=zeros(max([a b]));
    for a = 1: length(LAB1)
       tabel(LAB1(a),LAB2(a))= tabel(LAB1(a),LAB2(a))+1;
    end
end