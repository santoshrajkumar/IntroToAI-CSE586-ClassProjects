function [J, params] = gradientDescent(params,C1,C2,modC1,modC2)

x1c = params(1) - C1(:,1);
y1c = params(3)-C1(:,2);
x2c = params(2)-C2(:,1);
y2c = params(4)-C2(:,2);

J = x1c'*x1c + y1c'*y1c + x2c'*x2c + y2c'*y2c

delJ = [2*sum(x1c) 2*sum(x2c) 2*sum(y1c)  2*sum(y2c)]';

Hinv = diag([1/(2*modC1) 1/(2*modC1) 1/(2*modC2) 1/(2*modC2)]);

params = params - Hinv*delJ;
end
