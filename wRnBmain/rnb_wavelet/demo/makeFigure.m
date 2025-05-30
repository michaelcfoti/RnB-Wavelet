function makeFigure(R,W,S,name)
% Plot figures 
%
% INPUTS:
%     - R: Structure containing the following fields:
%         - pw: power spectrum
%         - fr: frequency        
%
%     - W: Structure containing the following fields:
%         - wavelet: structure containing wavelet parameters
%         - beta: average beta        
%         - betas: beta acrosss all epochs        
%         - bMin: min beta        
%         - bMax: max beta        
%
%     - S: EEG Data (Nepocs X Nsample) 
%
%     - name: region

        figure('position',[400 260 800 340],'menu','none','name','RnB');
        colR = [161 22 50]/256;
        % Average spectral analysis of rhytmics signals
        subplot(1,2,2)
        hold on; ax0 = gca;
        plot(log(R.fr),smooth(R.pw),'-k','LineWidth',2,'color',colR);
        setupAxes(ax0,true,log([0.3 64]), []); 
        Y = 1.1*max(smooth(R.pw));
        text(log(0.47),Y,'RnB Spectroscopy','FontSize',14,'FontAngle','italic','FontWeight','bold');
        text(log(8),Y,sprintf('(%d epochs)',size(S,1)),'FontSize',14);
        xlabel('Frequency (Hz)','FontSize',14,'Interpreter','latex','FontWeight','bold')
        ylabel('Rhythmic Power Spectral Density (dB)','FontSize',14,'Interpreter','latex','FontWeight','bold')
        ylim([0 Y]);
        Y = max(smooth(R.pw));
        plot(log([4 4]),[0 Y],':k','LineWidth',1.8);   text(log(2),Y,'$\delta$','Interpreter','latex','FontSize',18,'HorizontalAlignment','center')
        plot(log([8 8]),[0 Y],':k','LineWidth',1.8);   text(log(6),Y,'$\theta$','Interpreter','latex','FontSize',18,'HorizontalAlignment','center')
        plot(log([16 16]),[0 Y],':k','LineWidth',1.8); text(log(12),Y,'$\sigma$','Interpreter','latex','FontSize',18,'HorizontalAlignment','center')
        plot(log([32 32]),[0 Y],':k','LineWidth',1.8); text(log(24),Y,'$\beta$','Interpreter','latex','FontSize',18,'HorizontalAlignment','center')
        % Beta distribution
        subplot(1,2,1)
        hold on; ax = gca; ax.Color = 'none';
        [a,b] = hist(W.betas,60);
        p = a/sum(a) / (b(2)-b(1));
        plot(b,p,'.');
        b = b(2:end-1);
       
        % Gaussina fit (here, one gaussian)
        Gauss = bestBetasGaussianFit(W.betas');
        plot(Gauss.x,Gauss.y,'-','LineWidth',2,'Color',colR);
        % print the modes:
        Y = 1.25*max(Gauss.y);
        X = 0.1+min(Gauss.x);
        text(X,Y,sprintf('Mixture of %d Gaussian(s):',numel(Gauss.mu)),...
            'FontSize',14,'HorizontalAlignment','left','FontWeight','bold')
        for u = 1:numel(Gauss.mu)
        text(X,(1-u*0.07)*Y,sprintf('beta = %3.1f (%3.1f%%)',Gauss.mu(u),100*Gauss.prop(u)),...
            'FontSize',14,'HorizontalAlignment','left','FontAngle','italic');
        end
        plot([2 2],[0 0.7*max(Gauss.y)],':k','LineWidth',2);
        xlabel('Spectral exponent $\beta$','FontSize',14,'Interpreter','latex','FontWeight','bold')
        ylabel(name,'FontSize',14,'Interpreter','latex','FontWeight','bold')
        ylim([0 1.25*max(Gauss.y)])
        hold off
        
fprintf('\n    The left figure displays the distribution of the scaling\n')
fprintf('    exponent across the epochs. The curve is an optimal fit\n')
fprintf('    (in terms of an optimal Akaike Index Criteria) with a mixture\n')
fprintf('    of Gaussians. The right figure shows the ''RnB spectroscopy''\n')
fprintf('    of the %s during NREM sleep.\n',name)
end
