


function dy = edp_neural_mass_bruit(t,y)
        % Parametres:
        fs = 256;
        n = round(t*fs);
        A = 3.25; 
        B = - 22;
        a = 100;
        b = 50;
        
        C1 = 135;
        C2 = 0.8*C1;
        C3 = 0.25*C1;
        C4 = 0.25*C1;
        
        % Bruit blanc gaussien
        br = 150 + 8000*noise1sf(n);
        if (t<2) || (t>4), br = noise1sf(n); end
        % Initialisation
        dy=zeros(6,1);
        % Equation Diff.
        dy(1)= y(4);
        dy(2)= y(5);
        dy(3)= y(6);
        dy(4)= A*a*SIGMA(y(2)+y(3))-2*a*y(4)-a^2*y(1);
        dy(5)= A*a*n+A*a*C2*SIGMA(C1*y(1))-2*a*y(5)-a^2*y(2);
        dy(6)= B*b*C4*SIGMA(C3*y(1))-2*b*y(6)-b^2*y(3);
end
    
    
   function y = SIGMA(x)
            x0     = 6;
            tauMax = 5;
            r      = 0.56;
            y = tauMax /(1+exp(-r*(x-x0)));
    end