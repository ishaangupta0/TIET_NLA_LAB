% GAUSS SEIDEL ITERATIVE METHOD

clear;
clc;

fprintf("GAUSS SEIDEL METHOD:\n\n");

A  = input('Enter coefficient matrix A: ');
b  = input('Enter constant vector b: ');
x  = input('Enter initial guess vector x: ');
tol = 1e-6;

n = length(b);

while true
    x_old = x;
    
    for i = 1:n
        Sum1 = A(i, 1:i-1) * x(1:i-1);
        Sum2 = A(i, i+1:n) * x_old(i+1:n);
        x(i) = (b(i) - Sum1 - Sum2) / A(i,i);
    end

    if norm(x - x_old, inf) < tol
        break;
    end
end

disp('Solution vector x = ');
disp(x);
