close all;
clear all;

f1 = @(x,y,z) x^2 + 30*y^2 + z - 8;
f2 = @(x,y,z) (z+4);
h1 = Rfunc(f2, '\', f1);

shape1 = @(x,y,z) x^2 + y^2 + z - 1/2;
shape2 = @(x,y,z) x^2 + y^2  - 3;
shape3 = @(x,y,z) (z-20);
shape4 = @(x,y,z) (x^2 + y^2 + (z-20)^2 - 3);
shape5 = @(x,y,z) (x^2 + y^2 + (z-21)^2 - 2);
shape6 = @(x,y,z) (x^2 + y^2 + (z-22)^2 - 1);
shape7 = @(x,y,z) (z+8);

%figure;
%ezimplot3(shape1,[-5 5 -5 5 -10 25], 250)


h2 =  Rfunc(shape2,'v',shape1);
h2 =  Rfunc(h2, '^', shape3); 
h2 =  Rfunc(h2, 'v', shape4); 
h2 =  Rfunc(h2, 'v', shape5); 
h2 =  Rfunc(h2, 'v', shape6); 
h2 =  Rfunc(shape7, '\', h2); 

figure; 
subplot(121)
ezimplot3(h1,[-5 5 -5 5 -10 25], 250)
subplot(122)
ezimplot3(h2,[-5 5 -5 5 -10 25], 250)


%figure; 
%ezimplot3(h2,[-5 5 -5 5 -10 25], 250)

figure;
h =  Rfunc(h1, '^', h2);
ezimplot3(h,[-5 5 -5 5 -10 25], 250)
material dull


