%% Calculate Conflicts

function conflicts = calcConflicts(A,N)
% initialize conflicts matrix with zeros of NxN dimension
% each value at a grid gives number of conflicts
conflicts = zeros(N);

% right side ~ +ve direction, left side -ve direction

% check for conflicts in diagonal dirctions & row wise
for i=1:N
    for j=1:N
        
        % calculate first diagonal conflicts in +ve direction
        m=i+1;
        n=j+1;
        count=0;
        while m > 1 && m<=N && n >1 && n<=N
            if A(m,n) == 1
                count = count+1;
            end
            m=m+1; 
            n=n+1;
        end    
        
        % calculate first diagonal conflicts in -ve direction
        m = i-1;
        n=j-1;
        count2=0;
        while m>0 && n>0
                if A(m,n) == 1
                    count2 = count2+1;
                end
                m=m-1;
                n=n-1;
        end
        
        % calculate 2nd diagonal conflicts in +ve direction
        m =i-1;
        n=j+1;
        count3=0;
        while m>0 && n>0 && n<=N
                if A(m,n) == 1
                    count3 = count3+1;
                end
                m=m-1;
                n=n+1;
        end
        % calculate 2nd diagonal conflicts in -ve direction
        m =i+1;
        n=j-1;
        count4=0;
        while m>0 && n>0 && m<=N
                if A(m,n) == 1
                    count4 = count4+1;
                end
                m=m+1;
                n=n-1;
        end
        
        % calculate row conflicts in +ve direction
        m =i;
        n=j+1;
        count5=0;
        while m>0 && n>0 && n<=N
                if A(m,n) == 1
                    count5 = count5+1;
                end
                n=n+1;
        end
        % calculate row conflicts in -ve direction
        m =i;
        n=j-1;
        count6=0;
        while m>0 && n>0
                if A(m,n) == 1
                    count6 = count6+1;
                end
                n=n-1;
        end
        
     %sum up all the conflicts values at the grid point (excluding itself)   
     conflicts(i,j)= count+count2+count3+count4+count5+count6; 
            
    end
        
end

end

