 %% Print board with eight queens
function boardPrint(A,N)
board=zeros(N)+0.55;
for i=1:N
    for j=1:N
        if rem(i+j,2)==0
            board(i,j)=0.8;
        end
    end
end
h=imshow(board,'InitialMagnification',5000);
axis equal

for i=1:N
    for j=1:N
    if A(j,i)==1;
    queen(i,j)=text(i,j,char(9819),...
        'HorizontalAlignment','center',...
        'FontSize',25);
    end
    end
end
end