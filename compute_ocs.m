function [ocs G] = compute_ocs(V, alpha)

I = [1; 0; 0];

N = @(theta, phi)([cos(theta).*sin(phi); sin(theta).*sin(phi); cos(phi)]);


%g = @(theta, phi)((dot(I + N(theta,phi), V).^2 ./ (dot(I+N(theta,phi), I+N(theta,phi)))) ...
%                  * (dot(N(theta, phi), V)) .* (cos(theta).*sin(phi))  .* sin(phi));

g = @(theta, phi)(dot(I + N(theta,phi), V).^alpha ./ (norm(I+N(theta,phi)).^alpha)...
                  * (dot(N(theta, phi), V)) .* (cos(theta).*sin(phi))  .* sin(phi));
  

nq = 128;
a1 = -pi/2;     b1 = pi/2; dx = (b1-a1)/nq; 
a2 =  0;        b2 = pi;   dy = (b2-a2)/nq;

x = [a1 : dx : b1]; nx = length(x);
y = [a2 : dy : b2]; ny = length(y);
w1 = get_trapz(x);
w2 = get_trapz(y);

ocs = 0;
for i = 1 : nx
   for j = 1 : ny
      G(i,j) = g(x(i), y(j));
      ocs = ocs + w1(i)*w2(j) * G(i, j); 
   end
end

% sub-functions
function w = get_trapz(xmesh)
dx = xmesh(2)-xmesh(1);
w = ones(size(xmesh))*2;
w(1) = 1;
w(end) = 1;
w = 0.5 * dx * w;
