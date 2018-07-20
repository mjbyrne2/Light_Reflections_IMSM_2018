% sphere = @(x,y,z) x^2 + y^2 + z^2 - 1;
%  h = Rfunc(sphere,'^',sphere);
%  h = @(x,y,z)-sqrt(2.0).*sqrt((x.^2+y.^2+z.^2-1.0).^2);
% figure; ezimplot3(h,100)
%cylinder = @(xls,y,z) x^2 + y^2 - 1;
 sphere = @(x,y,z) x^2 + y^2 + z^2 - 1;
 sphere1 = @(x,y,z) (x-1.5)^2 + y^2 + z^2 - 1;

 h1 = Rfunc(sphere,'\',sphere1);
 h2 = Rfunc(sphere,'v',sphere1);
 h3 = Rfunc(sphere,'^',sphere1);
 %figure; ezimplot3(h,200);
 H = chebfun3( @(x,y,z)h(x,y,z),'eps',1e-8, [-1 2.5 -2 2 -2 2]);
 figure('units','normalized','outerposition',[0 0 1 1])
 isosurface (H,0)
 axis equal
 %Difference of a sphere with itself:
%  f = @(x,y,z) x^2 + y^2 + z^2 - 1;
% h = Rfunc(f,'\',f);
% h = @(x,y,z)-sqrt(2.0).*sqrt((x.^2+y.^2+z.^2-1.0).^2);
% 
% %Union of two neighboring spheres
% g = @(x,y,z) (x-1.5).^2 + y.^2 + z.^2 - 1;
% h = Rfunc(f,'\',g);
% figure; ezimplot3(h,100);
 material dull