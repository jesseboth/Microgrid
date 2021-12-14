% function ga()
% 
% 
% 
% end

% Micro examp
clear
clc
close all

pop=100;
% chromosome format -------------------------------------------------------
power = 1;
cost = 2; 
emission = 3;
source_1 = [20, .02, .01];
source_2 = [120, .20, .05];
source_3 = [15, .01, .02];
source_4 = [50, .02, .04];
sources = [source_1; source_2; source_3; source_4];
% Optimizations:
%               lower emission is better
%               lower cost is better
sortrows(sources)
% define ranges
% format = zeros(3,2);
% for i=1:length(sources)
%     format(j,:) = [min(sources(:,j)), max(sources(:,j))]
% end


% chromosome format -------------------------------------------------------

maxGen=200;
xRate=.5;
mRate=.1;
userLoad=[25,20];       % even and off index match consumption
overShot=5;             % allow for excess generation of 5MW
supplyParams=[1,0.5];   % index 1= cost, index 2=enviromental
storageParams=[0.25,0];
storageCharge=15;       % initial charge
bestFit=10000000;
genDis=zeros(24,2);
costTotal=0;
envTotal=0;
chg=zeros(24,1);
%one caluculation:
%initialize pop
%need to do the supply and storage seperate due to different alleles
pSupply=randi([10,30],pop,1);
pStorage=randi([storageCharge],pop,1);
%combine
p=[pSupply, pStorage];
for hr=1:24
    t=mod(hr,2);
    if t==0
        t=2;
    end
    hr
    bestFit=10000000;
for gen=1:maxGen
    gen
    %crossover
    Xpop=zeros(xRate*pop,size(p,2));
    for x=1:(xRate*pop)
    p1=randi(pop);
    p2=randi(pop);
    Xpop(x,1)=p(p1,1);
    Xpop(x,2)=p(p2,2);
    end
    
    %mutation
    Mpop=zeros(mRate*pop,size(p,2));
for i=1:size(Mpop,1)
    ind=randi(pop);
    gene=randi(2);
    newVal=randi([1,5000]);
    newVal=newVal/5000;
    newSupply=newVal*30;
    newStorage=newVal*storageCharge;
    Mpop(i,:)=p(ind,:);
    if gene==1
        Mpop(i,gene)=newSupply;
    else
        Mpop(i,gene)=newStorage;
    end    
end
newPop=[p;Xpop;Mpop]; 
%feasibility- will take care of the blackout constraint
feas=zeros(size(newPop,1),size(newPop,2));
   
    feasCount=1;
    for f=1:size(newPop,1)
        %check load
        powerNeeded=userLoad(t);
        powerGenerated=sum(newPop(f,:));
        powDiff=powerGenerated-powerNeeded;
        if powDiff>=0
            if newPop(f,2)<=storageCharge
                if (storageCharge-newPop(f,2))>=0
            feas(feasCount,:)=newPop(f,:);
            feasCount=feasCount+1;
                end
            end
        end
    end
    %stopping condition check- we are going for the best this time! So no
    %stop, we do need a fitness check to find the best! 
    for q=1:(feasCount-1)
        f(q)=(feas(q,1)*supplyParams(1)+feas(q,1)*supplyParams(2))+(feas(q,2)*storageParams(1)+feas(q,2)*storageParams(2));
    end
    
    [B,I]=sort(f);
    
    if B(1)<bestFit
    best=feas(I(1),:);
    bestFit=B(1);
    end
    feas([feasCount:end],:)=[];
    %survival
    
    %lazy brain
    k=zeros(size(feas,1),1);
    sel=1;
    while sel<(pop+1)
        s=size(feas);
        if s>0
        l=randi(s(1));
        p(sel,:)=feas(l,:);
        feas(l,:)=[];
        end
        sel=sel+1;
        
    end
    
   
end
%need to update cost, env, and remaining storage
costTotal=costTotal+(best(1)*supplyParams(1))+(best(2)*storageParams(1));
envTotal=envTotal+(best(1)*supplyParams(2))+(best(2)*storageParams(2));
chg(hr)=storageCharge;
storageCharge=storageCharge-best(2);
genDis(hr,1)=best(1);
genDis(hr,2)=best(2);
end