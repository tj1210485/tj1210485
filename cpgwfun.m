function dx=cpgwfun(t,x)
global tr;
global ta;
global e;
global f1;
dx=[(1/tr)*(-x(1)-x(3)*x(2)+e*f1);
    (1/ta)*(-x(2)+x(3)*x(1));
    sign(x(1))*(e*f1*x(2))/(sqrt(x(1)*x(1)+x(2)*x(2)))];
return

