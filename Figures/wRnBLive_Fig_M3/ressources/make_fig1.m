function fig1 = make_fig1(t,neural_mass_response)
fig1 = figure('Position',[100 100 1000 300]);
hold on
ax = gca; ax.Color = 'none';
plot(t,neural_mass_response,'LineWidth',2);
xlim([0 8]); ylim([-0.05 0.2])
grid on
title('Neural Mass Model (Jansen & Rit,1995)','FontSize',14);
xlabel('time (sec)','FontSize',16);
ylabel('Potential (mV)','FontSize',16);
end