function setupAxes(ax, ApplyLogScale,xLimits, yLimits )
     ax.Color = 'none';

    if ApplyLogScale
        ax.XTick = log([0.5 1 2 4 8 16 32 64]);
        ax.XTickLabel = {'0.5' '1' '2' '4' '8' '16' '32' '64'};
    end

    % Set axis limits
    if ~isempty(xLimits)
        ax.XLim = xLimits;
    end
    if ~isempty(yLimits)
        ax.YLim = yLimits;
    end    

end
