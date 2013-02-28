function biplotChem(SCR, LDS,C1, C2,var, classvector,varNames)

for a = 1:length(var)
    perc(a) = (var(a)/ sum(var))*100;
end

xlab= sprintf('pc %1.0f (%1.0f procent variance explained)', C1, perc(C1));
ylab= sprintf('pc %1.0f (%1.0f procent variance explained)', C2, perc(C2));
titel= sprintf( 'biplot pc %1.0f vs pc %1.0f',C1,C2);
xlabel(xlab)
ylabel(ylab)
title(titel)

if nargin > 5
    x=NaN(length(classvector));
    y=NaN(length(classvector));
    for n = 1:max(classvector)
        class = find(classvector==n);
        x(1:length(class),n) = SCR(class,C1)';
        y(1:length(class),n) = SCR(class,C2)';
    end
    plot(x,y,'.')
else
    plot(SCR(:,C1),SCR(:,C2),'.' )
end


%kleurtje geven aan assen en tweede as creeeren:
ax1 = gca;
set(ax1,'XColor','k','YColor','k')
xlabel(xlab)
ylabel(ylab)

%de tweede as creeeren, deze krijgt een andere kleur en heeft de x-as boven
%en de y-as rechts zitten.
ax2 = axes('Position',get(ax1,'Position'),...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none',...
    'XColor','b','YColor','b');
xlabel('PC1 (loadings)')
ylabel('PC2 (loadings)')
hold on
for a = 1: size(LDS,2)
    plotx = [0 LDS(a,C1)];
    ploty = [0 LDS(a,C2)];
    plot(plotx,ploty,'-b','parent',ax2)
    if nargin == 7
        if ischar(varNames)
            varNames = cellstr(varNames);
        end        
        text(LDS(a,C1),LDS(a,C2),varNames(a))
    else
        text(LDS(a,C1),LDS(a,C2),num2str(a))
    end
end
hold off