function [hp,hptab,Wcoef_select] = display_time_scale_boxes(Wcoef,wavelet) 
% ==============================================   
% Copyright (C) 2011 - LATIS Team
%
%  Authors: LATIS team, 2011
% -------------------------------------------------------------------------   
% parametres: hp , Tmin, Tmax, J, N et boites
% hp : panel handle
% Tmin : time(0)
% Tmax : time(end)
% J : levels
% N : nomber of samples
% TFboxes is a structure .k ans .j are (j,k) coordinates

warning('off','all');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hp    = figure;               %
hptab = uitabgroup; drawnow;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Parametres temporels %%%%%%%%
t0 = wavelet.time(1);             %
tf = wavelet.time(end);           %
fs = 1/(wavelet.time(2)-t0);      %
[Nc,Nt] = size(Wcoef);            %
T = tf - t0;                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre d'echelle:               %
J = length(wavelet.scales_j);     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parametre de selection %%%%%%%%%%%%
pc_power = 99;                      %
if isfield(wavelet,'pc_power')      %
    pc_power = wavelet.pc_power;    %
end                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Initialisation %%
selected_jk = [];    %
i_kept = [];         %
j_kept = [];         %
k_kept = [];         %
t_kept = [];         %
Wgfp   = [];         %
Wcoef_select = [];   %
%%%%%%%%%%%%%%%%%%%%%%
for j = 1:J
    deb    = 1+Nt/2^j + 2;
    fin    = Nt/2^(j-1)-2;
    Wgfp   = [Wgfp (sum(abs(Wcoef(:,deb:fin)).^2,1)/Nc)];
    i_kept = [i_kept deb:fin];
    j_kept = [j_kept j*ones(1,length(deb:fin))];
    k_kept = [k_kept (deb-Nt/2^j):(fin-Nt/2^j)];
    t_kept = [t_kept t0+(2^(j-1))*(2*((deb-Nt/2^j):(fin-Nt/2^j))-1)/fs ];
end

[Wgfp_sorted, I] = sort(Wgfp,'descend');
Ic = find(cumsum(Wgfp_sorted)>=(pc_power/100)*sum(Wgfp_sorted),1,'first');
i_kept = i_kept(I(1:Ic));
j_kept = j_kept(I(1:Ic));
k_kept = k_kept(I(1:Ic));
t_kept = t_kept(I(1:Ic));
e_kept = 100*Wgfp(I(1:Ic))/sum(Wgfp(I(1:Ic)));
    
    % what we finally keep: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    selected_jk     = [i_kept ; j_kept ; k_kept ; t_kept];  %
    selected_values = [Wgfp_sorted(1:Ic) ; e_kept];         %
    MMM = colormap(gray(size(selected_values,2)));          %
    Wcoef_select = zeros(1,Nt);                             %
    Wcoef_select(i_kept) = Wcoef(i_kept);                   %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % percentage of coeff:
    fprintf(' --- we kept %d wavelet coeff among %d\n',numel(i_kept),Nt);
    
    
%%%%%% FIGURE TEMPS-FREQUENCE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e = 0.05;                                                    %
le_titre = ...
    sprintf(' Time-frequency boxes (%d %%), fs = %3.1f', ... %
    round(pc_power),fs);
onglet{1} = uitab(hptab,'title','Wavelet Coef.');            %
hpc = uipanel('Parent', onglet{1}, ...                       %
              'Units', 'Normalized', ...                     %
              'Position', [0.01 0.01 0.98 0.98], ...         %
              'FontWeight','demi');                          %
 set(hpc,'Title',...                                         %
     le_titre,...                                            %
     'FontSize',14);                                         %
ax = axes('parent',hpc, ...                                  %
'outerPosition',[0.01 0.01 0.98 0.98], ...                   %
'YTick',0.5:J-0.5, ...                                       %
'YTickLabel',num2cell(1:J));                                 %
                                                             %
axis(ax,'fill');                                             %
box(ax,'on');                                                %
xlim(ax,[t0 tf]);                                            %
ylim(ax,[0 J]);                                              %
xlabel(ax,'time (s)','fontsize',12);                         %
ylabel(ax,'scale j','fontsize',12);                          %
hold on                                                      %
                                                             %
for b = 1:length(selected_jk)                                %
                                                             %
    l = T/Nt*2^selected_jk(2,b);                             %
    p = [t0+(selected_jk(3,b)-1)*l, ...                      %
             selected_jk(2,b)-1+e,l,1-2*e];                  %
                                                             %
    rectangle('parent',ax, ...                               %
              'Position',p,...                               %
              'LineWidth',1, ...                             %
              'LineStyle','-', ...                           %
              'edgecolor','k', ...                           %
              'FaceColor',MMM(b,:));                         %
pause(0.015)                                                 %
end                                                          %
hold off                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for scl = 1:J
	titre = [' scale ' num2str(wavelet.scales_j(scl)) ' '];
	hhh = uitab(hptab,'title',titre);
	hpc = uipanel('Parent', hhh, ...
	'Units', 'Normalized', ...
	'Position', [0.01 0.01 0.98 0.98], ...
	'FontWeight','demi');
% 
	set(hpc,'Title',[' Wavelet coefficients (% of power) '],'FontSize',14);
	ax = axes('parent',hpc, 'outerPosition',[0.01 0.01 0.98 0.98]);
	sj = wavelet.scales_j(scl);
	bj = selected_jk(2,:)==sj;
	tt = selected_jk(4,bj);
	vv = selected_values(2,bj);
	stem(tt,vv,'xk');
    pause(0.05);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    
end
