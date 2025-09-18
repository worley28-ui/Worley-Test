%%Exponetial line fit test
%9/11/25

%% 1. Load data

Rahydro=readtable("Ra_hydro.csv");

%% 2. Plot data
figure;
errorbar(Rahydro.Distance,Rahydro.Ra_He,Rahydro.Ra_HeError,"o");
hold on;
scatter(Rahydro.Distance,Rahydro.Ra_He,"o","filled");
xlabel("Distance"); ylabel("Ra/He");

%% 3. Calculate fit
[f gof]=fit(Rahydro.Distance,Rahydro.Ra_He,"exp1")
figure;
plot(f,Rahydro.Distance,Rahydro.Ra_He);

%% 4. Recalculate fit
excluded=[8 9];
[f gof]=fit(Rahydro.Distance,Rahydro.Ra_He,"exp1","exclude",excluded)
figure;
plot(f,Rahydro.Distance,Rahydro.Ra_He,excluded);

%% 5. Recalculate with errors 
w=1./(Rahydro.Ra_HeError.^2);
excluded=[8 9];
[f gof]=fit(Rahydro.Distance,Rahydro.Ra_He,"exp1","exclude",excluded,"weights",w);
figure;
plot(f,Rahydro.Distance,Rahydro.Ra_He,excluded);

%% 7