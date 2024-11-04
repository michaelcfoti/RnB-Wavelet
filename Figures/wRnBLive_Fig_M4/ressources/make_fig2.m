function f2 = make_fig2(time,psi)
f2 = figure('Position',[100 100 300 300]);

hold on; ax = gca; ax.Color = 'none';
hold on; ax = gca; ax.Color = 'none'; ax.FontSize = 14;
plot(time,-psi,'k','LineWidth',2)
osc = -1.20*sin(2*pi*(time+0.185)/1.2);
plot(time,osc,'k','LineWidth',1.2,'color',[0.6 0.6 0.6])
text(+5,+0.75,'$\psi^{(4)}_{0,0}(t)$','Interpreter','latex','Fontsize',28,'HorizontalAlignment','center','FontWeight','bold')
xlabel('t (sec)');
axis off
fprintf('  -- This is a wavelet at scale 2^0 = 1 and centered at\n')
fprintf('     time = 0. Here, the regularity parameter is alpha = 4 and\n')
fprintf('     the assymetry parameter is tau = 0. This wavelet is\n')
fprintf('     built from the ''FracSpline'' package developped by \n')
fprintf('     T. Blu and M. Unser (2000).\n')
fprintf('     The plot also display the sine function corresponding to\n')
fprintf('     the central frequency of the wavelet (here 5/6 Hz)\n\n')
end