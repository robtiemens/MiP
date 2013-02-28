function labelVector = stringTOLabel(stringCell)

teller = 1;
lengte = length(stringCell);
labelVector = zeros(lengte,1);
labs = cell(0);
for i = 1: length(stringCell)
        notFound = 1;
        for j = 1: length(labs);
            if strcmp (stringCell{i}, labs{j})
                labelVector(i) = j;
                notFound = 0;
            end  
        end  
        if notFound
            labs{teller} = stringCell{i};            
            labelVector(i) = teller;    
            teller = teller+1;
        end
end

        
    
    
