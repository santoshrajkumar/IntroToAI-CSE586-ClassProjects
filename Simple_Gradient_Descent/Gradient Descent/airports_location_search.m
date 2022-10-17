clear all;
clc;

%reading coordinates of cities in i=1
C1=readtable('C1.csv');
C1 = table2array(C1);
%reading coordinates of cities in i=2
C2=readtable('C2.csv');
C2 = table2array(C2);

% randomly initialized coordinates of the airports x1,x2,y1,y2
params = [-5; 6.5; 66 ; -77];

%number of cities in A1 & A2
modC1 = length(C1);
modC2 = length(C2);

% store parameters at each iteration
coord=params;

% Iterations using gradient descent
for iter=1:20
    [J, params] = gradientDescent(params,C1,C2,...
        modC1,modC2);
    % storing Js and parameters
    Ji(iter)=J;
    i(iter)=iter;
    coord = [coord params];
end
Jp = [i' Ji'];
