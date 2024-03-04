%% Track information Function to make track points


function [xp,yp,w] = trackinfo(L,R,w,delta_s,delta_theta);
    
    sx1 = linspace(0, L, (L - 0) / delta_s + 1);
    sx2 = linspace(L, 0, (L - 0) / delta_s + 1);

    sy1 = linspace(0, 0, (L - 0) / delta_s + 1);
    sy2 = linspace(R*2, R*2, (L - 0) / delta_s + 1);

    t1 = linspace( -pi/2, pi/2, (pi / (delta_theta*pi/180)));
    t2 = linspace( pi/2, 3*pi/2, (pi / (delta_theta*pi/180)));
 
    xp = [sx1 , R*cos(t1) + L , sx2, R*cos(t2)];
    yp = [sy1, R*sin(t1) + R , sy2 , R*sin(t2) + R];
end