clc;
syms x;
y = input('Enter the equation: ', 's');    % Take equation as a string input
    % Convert the string to a symbolic expression
a = input('Enter initial guess = ');
b = input('Enter the second guess = ');
e = input('Tolerance error = ');

fa = eval(subs(y, x, a));
fb = eval(subs(y, x, b));

if fa * fb > 0
    disp('Given initial values do not bracket the root');
else
    c = a - ((a - b) * fa / (fa - fb));   % Initial guess for c
    fc = eval(subs(y, x, c));

    while abs(fc) > e
        fprintf('%f\t%f\t%f\t%f\n', a, b, c, fc);   % Print current values

        if fa * fc < 0
            b = c;     % Update b to c
            fb = eval(subs(y, x, b));
        else
            a = c;     % Update a to c
            fa = eval(subs(y, x, a));
        end

        c = a - ((a - b) * fa / (fa - fb));  % Recalculate c
        fc = eval(subs(y, x, c));            % Recalculate fc
    end

    fprintf('\nRoot is: %f\n', c);   % Output the root
end
