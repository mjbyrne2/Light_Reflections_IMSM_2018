close all;
clear all;
gamma = 0 : .05 : pi;

n = length(gamma);

for i = 1 : n
   disp(i/n)
   V = [cos(gamma(i)); sin(gamma(i)); 0];

   ocs0(i) = compute_ocs(V, 0);
   ocs2(i) = compute_ocs(V, 2);
   ocs3(i) = compute_ocs(V, 3);
   ocs4(i) = compute_ocs(V, 4);

end

figure;
hold on;
plot(gamma, ocs0, '-o', 'linewidth',2);
plot(gamma, ocs2, '-o', 'linewidth',2);
plot(gamma, ocs3, '-o', 'linewidth',2);
plot(gamma, ocs4, '-o', 'linewidth',2);
xlabel('\gamma');
ylabel('ocs(\gamma)');
set(gca, 'fontsize', 20);
legend({'\alpha = 0', '\alpha = 2', '\alpha = 3', '\alpha = 4'});
axis tight;
