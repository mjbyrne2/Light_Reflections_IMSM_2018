close all;
%  h = Rfunc(sphere,'^',sphere);
%  h = @(x,y,z)-sqrt(2.0).*sqrt((x.^2+y.^2+z.^2-1.0).^2);
% figure; ezimplot3(h,100)
%cylinder = @(xls,y,z) x^2 + y^2 - 1;

shape1 = @(x,y,z) (x/2)^2 + (y/2)^2 + 30*z^2 - 1;
%shape2 = @(x,y,z) x^2 + y^2 - 1;
shape2 = @(x,y,z) (x-1.5)^2 + y^2 + z^2 - 1;



h1 = Rfunc(shape1,'\',shape2);
h2 = Rfunc(shape1,'v',shape2);
h3 = Rfunc(shape1,'^',shape2);


%range = [-5 5 -5 5 -2 2];
%H1 = chebfun3( @(x,y,z)h1(x,y,z),'eps',1e-8, range);
%H2 = chebfun3( @(x,y,z)h2(x,y,z),'eps',1e-8, range);
%H3 = chebfun3( @(x,y,z)h3(x,y,z),'eps',1e-8, range);

%figure;
%isosurface(H1,0)
%material dull
%axis equal tight
%
%figure;
%isosurface (H2,0)
%material dull
%axis equal tight
%
%figure;
%isosurface (H3,0)
%material dull
%axis equal tight
%


figure;
ezimplot3(shape1,100)
view(-40, 30)
alpha .6;
axis off
print('-depsc', 'shape1');

figure;
ezimplot3(shape2,100)
view(-40, 30)
alpha .6;
axis off
print('-depsc', 'shape2');

figure;
ezimplot3(h1,100)
view(-40, 30)
alpha .6;
axis off
print('-depsc', 'diff');

figure;
ezimplot3(h2,100)
view(-40, 30)
alpha .6;
axis off
print('-depsc', 'union');

figure;
ezimplot3(h3,100)
view(-40, 30)
alpha .6;
axis off
print('-depsc', 'intersect');

