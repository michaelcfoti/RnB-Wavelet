function fig2 = make_fig2(time,signal,freq,Pow)
fig2 = figure('position',[100 200 900 240]); hold on; ax = gca; ax.Color = 'none';
subplot(1,3,[1 2]);  hold on; ax = gca; ax.Color = 'none';
plot(time,signal,'LineWidth',1.8); 
xlabel('time (s)');
mess = sprintf('Neural Mass Model (Jansen-Rit, 1995)');
text(2.9,0.055,mess,'HorizontalAlignment','left','FontSize',14,'FontWeight','bold')
mess = sprintf('Average excitatory synaptic gain = 3.25 mV');
text(2.9,0.045,mess,'HorizontalAlignment','left','FontSize',14)
mess = sprintf('Average inhibitory synaptic gain = 22.0 mV');
text(2.9,0.035,mess,'HorizontalAlignment','left','FontSize',14)
mess = sprintf('Time constant (excit. post. potential) = 10 ms');
text(2.9,0.025,mess,'HorizontalAlignment','left','FontSize',14)
mess = sprintf('Time constant (inhib. post. potential) = 20 ms');
text(2.9,0.015,mess,'HorizontalAlignment','left','FontSize',14)



subplot(1,3,3);  hold on; ax = gca; ax.Color = 'none';
plot(log(freq),Pow,'LineWidth',1.8);
ax.XTick = log([1 2 4 8 16 32 64]);
ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64'};
text(log(10.5),6.8*10^-5,'10.48 Hz','FontSize',12);
xlabel('frequency (Hz)')
end