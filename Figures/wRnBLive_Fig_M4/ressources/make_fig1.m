function f1 = make_fig1(time,s500)
f1 = figure('Position',[100 100 500 300]);
hold on; ax = gca; ax.Color = 'none';
plot(time,s500,'-k','LineWidth',0.75)
xlim([0 20]);
xlabel('time (sec)','FontSize',14);
fprintf('  -- This signal is one epoch (30 seconds) of a series\n')
fprintf('     of 520 epochs recorded in the hippocampus (human).')
end