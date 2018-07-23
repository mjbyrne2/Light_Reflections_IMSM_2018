%% Plot Approximations to a Cube

n = [2,4,8];   % Exponents of variables x, y, and z
dom = 2*[-1 1 -1 1 -1 1];   % Domain of the chebfun

figure('units','normalized','outerposition',[0 0 1 1])
for j = 1:length(n)
    C = chebfun3(@(x,y,z) x.^n(j) + y.^n(j) + z.^n(j) - 1, dom,...
        'vectorize', 'eps',1e-6);
    subplot(1,3,j)
    isosurface(C,0)
    view(-40, 30)
    alpha 0.6
    axis equal
    axis off
end

print('-depsc', 'cubes');
