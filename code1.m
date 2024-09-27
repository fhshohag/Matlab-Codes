clc
syms x;
y= input ('Enter the equation=');
a=input ('Enter intial guess =');
b=input ('Enter the second guess=');
e= input ('Tolerance error =');
fa= eval(subs(y,x,a));
fb= eval(subs(y,x,b));
if fa*fb>0
    disp('Given intial value do not braket the root');
else
    c= a-((a-b)*fa/(fa-fb))
    fc = eval (subs(y,x,c));
    while abs (fc)>e
    f printf ('%f\t%f\t%f\t%f\n',a,b,c,fc);
    if fa*fc<0
        b=c;
        fb=eval(subs (y,x,b));
    else
        a=c;
        fa=eval(subs(y,x,a));
    end
    c= a-((a-b)*fa/(fa-fb));
    fc= eval(subs(y,x,c));
end
f printf ('\n Root is: %f\n',c);
end