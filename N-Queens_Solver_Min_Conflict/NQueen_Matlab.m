
clear all;
close all;
clc

% input number of queens (8 for 8 queens)
N=input('Enter Number of Queens:  ');
    
% initialize the problem, randomly assign a column to each queen
A = initializeEightQueen(N);

% storing the initial config. for later visualization
B=A;

tic

iter=0;
% run min conflict until solved
while 1
    
    % run minconflict function (returns new board config. & conflicts)
    [A, conflicts] = minConflict(A,N);
    
    %check variable for solution
    check=0;
    %loop through the configuration for checking
    % check conflicts of each queen position, if zero then check++
    for i=1:N
        for j=1:N
           if A(i,j)==1
               if  conflicts(i,j) ==0
               check = check+1;
               end
           end
           
        end
    end
    
    % if check == N, the puzzle is solved & break the loop
    if check == N
        fprintf('Yay !Solved  !  ')
        break;
    end
    
    iter=iter+1
    
    if iter > 100000
        break;
    end
end

toc

%plot the initial config. & solved versions
figure;
subplot(1,2,1)
boardPrint(B,N)
title('Initialized N-Queens')
set(gca,'FontSize',15)

subplot(1,2,2)
boardPrint(A,N)
title('Solved N-Queens w/o conflicts')
set(gca,'FontSize',15)





%%%% All the functions  Begin Here

%% Initializing the eight queen problem
function A = initializeEightQueen(N)
% initialize a matrix with zeros of NxN dimension
A = zeros(N);

% assign 1s randomly to each column (1 corresponds to a queen)
for i=1:N
    x = randi(N);
    A(x,i)=1;
end

end

