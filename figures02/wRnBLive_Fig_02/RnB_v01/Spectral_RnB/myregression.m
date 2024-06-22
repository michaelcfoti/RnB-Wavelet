function R = myregression(fr,pw,param)
% 
% Compute linear regression on power data over a specified frequency range.
%
% INPUTS:
%     - fr: Frequency
%
%     - pw: Power
%
%     - param: frequency range for regression
%
% OUTPUTS:
%     - R: Structure containing the following fields:
%         - R.beta: Slope
%         - R.b: Intercept

    selection = (fr>param.frange(1) & fr<param.frange(2));
    fr = fr(selection);
    pw = pw(:,selection);
    
    x = log(fr(pw~=0));
    y = log(pw(pw~=0)); 

    mx  = mean(x);
    my  = mean(y);
    sxx = (x-mx)*(x-mx)';
    sxy = (x-mx)*(y-my)';
    slope = sxy / sxx;
    
	R.beta = -slope;
    R.b = my - mx*slope;
    
end
