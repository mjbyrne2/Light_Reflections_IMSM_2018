%% Blinn-Phong MRDF Plots
% (Similar to Blinn_Phong_Plotter, but with different slightly different 
% functions)
%
% Here I and V are taken to be the same, so the dot(N,I) = dot(N,V) in the
% Blinn-Phong BRDF. In the following set-up, N is still [0;1] but I = V
% range for theta from 0 to pi.

N = [0;1];  % Fixed normal vector
n = 81; % Number of angles considered
theta = linspace(0,pi,n);   % n angles between 0 and pi
V = [cos(theta);sin(theta)];    % Vectors for each theta
A = [0 1 2 4 8 16 32];    % Range of alphas
B = zeros(length(A),length(theta));   % Storage of scalings
maroon = [0.635,0.078,0.184];
orange = [1,0.6471,0];
c = ['m','b','c','g','y',orange,maroon]; % Colors to be used for plots

% Angles between N and each vector in V (aspect angles) are calculated:
relTheta = acos(dot(repmat(N,[1,n]),V));  

% Next half of the angles are made negative to represent when the polar 
% angles of the vectors V are greater than N:
relTheta(1:floor(n/2)) = -relTheta(1:floor(n/2));   

blinn_phong_MRDF = @(V,alpha) ((dot(V+V,N)./norm(V+V)).^alpha);   % Simplified since I = V

figure('units','normalized','outerposition',[0 0 1 1])
grid on
hold on
for j = 1:length(A)
    
    for k = 1:length(theta)
        B(j,k) = blinn_phong_MRDF(V(:,k),A(j))*((A(j)+2)/(2*pi));
    end
    
    if A(j) == 16
        plot(relTheta,B(j,:),'Color',orange,'Linewidth',3)
    elseif A(j) == 32
        plot(relTheta,B(j,:),'Color',maroon,'Linewidth',3)
    else
        plot(relTheta,B(j,:),c(j),'Linewidth',3)
    end
    
end
% axis equal
axis([-pi/2 pi/2 0 5.5])
xticks(-pi/2:pi/6:pi/2)
xticklabels({'-\pi/2','-\pi/3','-\pi/6','0','\pi/6','\pi/3','\pi/2'})
xlabel('Aspect angle (radians)')
ylabel('MRDF')
legend({'\alpha = 0','\alpha = 1','\alpha = 2','\alpha = 4',...
    '\alpha = 8','\alpha = 16','\alpha = 32'},'Location','Northeast')
set(gca,'Fontsize',20)
print('-depsc', 'MRDFs2')    % Save figure

%% Blinn-Phong BRDF Plots
% Here I and V can have differing directions, though N remains fixed at
% [0;1]. 

N = [0;1];
theta_I = (pi)/4;
I = [cos(theta_I);sin(theta_I)];

% Number of angles. n should be chosen so that pi/4 is one of the
% angles in the vector theta_V (n = 5, 9, 13, ...)
n = 21; 

theta_V = linspace(0,pi,n);
V = [cos(theta_V);sin(theta_V)];    % Vectors V for each theta_V
A = [0 2 4 8];    % Range of alphas
B = zeros(length(A),length(theta_V));   % Storage of scalings
S = zeros(size(V)); % Storage of scaled vectors
c = ['m','c','g','y'];    % Storage of some colors for the vectors

figure('units','normalized','outerposition',[0 0 1 1])
hold on
Q(5) = quiver(0,0,I(1),I(2),'r','Linewidth',2);   % Light vector
Q(6) = quiver(0,0,N(1),N(2),'k','Linewidth',2);   % Normal vector
% Added for loop to range over alphas:
for j = length(A):-1:1

%     % Blinn-Phong BRDF (check scaling):
%     blinn_phong = @(V) ((dot(I+V,N)./norm(I+V)).^A(j))...
%         .*dot(N,V).*dot(N,I)*((A(j)+2)/(2*pi));   

    % Scaled <H,V> only:
    blinn_phong = @(V) ((dot(I+V,N)./norm(I+V)).^A(j))*((A(j)+2)/(2*pi));

    for k = 1:length(theta_V)
        B(j,k) = blinn_phong(V(:,k));
    end
    S(:,:,j) = B(j,:).*V;   % Scale vectors by the values of the BRDF

    Q(j) = quiver(zeros(1,n),zeros(1,n),S(1,:,j),S(2,:,j),...
        c(j),'Linewidth',3); % Scaled viewing vectors

end
axis equal
axis([-0.75 0.75 0 1])
set(gca,'xtick',[]) % Remove x-axis scale
set(gca,'ytick',[]) % Remove y-axis scale
xlabel('Reflecting Surface')
legend([Q(5) Q(6) Q(1) Q(2) Q(3) Q(4)],...
    {'Light vector \bf{I}','Normal vector \bf{N}',...
    'BRDF-scaled viewing vector \bf{V} (\alpha = 0)',...
    'BRDF-scaled viewing vector \bf{V} (\alpha = 2)',...
    'BRDF-scaled viewing vector \bf{V} (\alpha = 4)',...
    'BRDF-scaled viewing vector \bf{V} (\alpha = 8)'},...
    'Location','Northeast')
set(gca,'Fontsize',20)
print('-depsc', 'BRDF_Vectors2') % Save figure
