%% Function Min Conflict
function [A, conflicts] = minConflict(A,N)
    % calculate conflicts matrix
    conflicts = calcConflicts(A,N);
    %randomly select a column number
    p=randi(N);
    %find index of minimum conflict/s in that column
    fminCp = find(conflicts(:,p)==min(conflicts(:,p)));
    %randomly select the index of minimum conflict if there is more than
    %one, else select the only one
    fminCp = fminCp(randi(length(fminCp)));
    % if the queen is at minimum conflict grid of the selected column
    if A(fminCp,p)==1
        % move the queen randomly to a new position
        A(:,p) = 0;
        A(randi(N),p)=1;
       % else assign the queen to the minimum conflict position
    else
        A(:,p) = 0;
        A(fminCp,p)=1;
    end
end
    
