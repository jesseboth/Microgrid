pop = 100;
maxGen = 200;
xRate = .5;
mRate = .1;

userLoad = [25,20];
supplyParams = [1,0.5];
battParams = [0.25,0];
batChg = 15;

% large number
bestfit = 10000000;

% genDis=zeros(24,2);

costTotal = 0;
envTotal = 0;

% chg=zeros(24,1);

             %min max,len,w
pSupply = randi([10,30],pop,1);
pBat = randi([batChg],pop,1);
p = [pSupply,pBat];


%need time
t = randi([20,25],1,24);

%gen bound
for gen = 1:maxGen


    %xover
    Xpop = zeros(xRate*pop,size(p,2));
    for x = 1:(xRate*pop)
        p1 = randi(pop);
        p2 = randi(pop);
        Xpop(x,1) = p(p1,1);
        Xpop(x,2) = p(p2,2);
    end
    
    mutate(mRate, pop, batChg, p, Xpop, t);
end