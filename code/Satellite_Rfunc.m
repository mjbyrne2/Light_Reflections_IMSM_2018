%% Satellite_Rfunc.m
% Build satellite body

C = @(x,y,z) x.^2 + z.^2 - 1;
p1 = @(x,y,z) y - 4;
p2 = @(x,y,z) y + 4;
B = Rfunc(p1,'^',C);
B = Rfunc(p2,'\',B);  % Cylindrical body
C2 = @(x,y,z) (x-1).^6 + y.^6 + z.^6 - 0.1;
C3 = @(x,y,z) (x+1).^6 + y.^6 + z.^6 - 0.1;
B = Rfunc(C2,'\',B);
B = Rfunc(C3,'v',B);  % Body with cube-like attachments

figure
ezimplot3(B,[-5 5 -5 5 -5 5], 100)
rotate3d on

%% Build two panels

% Two planes:
sL = @(x,y,z) z + y + 0.25; % Lower angled plane
sT = @(x,y,z) z + y - 0.25; % Top angled plane

% y-slices:
yR = @(x,y,z) y - 2;
yL = @(x,y,z) y + 2;

% z-slices:
zT = @(x,y,z) z - 2;
zL = @(x,y,z) z + 2;

% x-slices:
x1 = @(x,y,z) x + 4;
x2 = @(x,y,z) x + 1.25;
x3 = @(x,y,z) x - 1.25;
x4 = @(x,y,z) x - 4;

S = Rfunc(sT,'^',x4);   
S = Rfunc(x1,'\',S);    
S = Rfunc(S,'\',yR);    
S = Rfunc(yL,'v',S);    
S = Rfunc(S,'v',sL);    
R = Rfunc(S,'\',x2);    % Right panel
L = Rfunc(x3,'v',S);    % Left panel

%%  Construct complete satellite

Satellite = Rfunc(B,'\',R);   % Add right panel
Satellite = Rfunc(Satellite,'\',L);   % Add left panel

figure
ezimplot3(Satellite,[-5 5 -5 5 -5 5], 100)
axis equal
axis([-5 5 -5 5 -5 5])
axis off
rotate3d on
