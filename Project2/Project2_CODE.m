%% Obtain track points from trackinfo function
track_length = 900;
track_radius = 200;
track_width = 15;
delta_s = 1;
delta_theta = 1;
path.width = track_width;
path.l_st = track_length;
path.radius = track_radius;

[xp,yp] = trackinfo(track_length,track_radius,0,delta_s,delta_theta);
set_param('Project2_MODEL', 'StopTime', '310')
simout = sim("Project2_MODEL.slx");
X = simout.X.data;
Y = simout.Y.data;
psi = simout.psi.data;
stats = raceStat(X,Y,simout.tout,path);

%% Plot the bounds of the track
[xp_i,yp_i]=trackinfo(track_length,track_radius,-7.5,delta_s,delta_theta);
[xp_o,yp_o]=trackinfo(track_length,track_radius,7.5,delta_s,delta_theta);
plot(xp_i,yp_i,"k")
hold on
plot(xp_o,yp_o,"k")


%% Make patch values x-car and y-car
xc = [4 -4 -4 4];
yc = [2 2 -2 -2];

%% animate the patch following the path

h = animatedline('Color','r');
axis([-300,1200,-100,500])
pause(1)
patch(xc,yc,'r')                                % initialize patch at starting location

for k = 1:length(X)

    delete(findall(gca, 'Type', 'Patch'));   % delete any previous patches on the track

    rotated_car = rotate_car(xc,yc,psi(k));    % call the rotate function and get new car rotation

    xcm = X(k)+rotated_car(1,:);            % modify rotated car location to be on track for both x and y
    ycm = Y(k)+rotated_car(2,:);

    patch(xcm,ycm,'y')                     % plot the new car
    drawnow limitrate;
    
    addpoints(h,X(k),Y(k));
    drawnow limitrate;


end


%% Make car rotation function

function rotated_car = rotate_car(x,y,angle)

    tangent_angle = angle;
    rotation_matrix = [cos(tangent_angle), -sin(tangent_angle); sin(tangent_angle), cos(tangent_angle)];
    rect_points = [x; y];
    rotated_car = (rotation_matrix * rect_points);
end


%% Track information Function to make track points


function [xp,yp] = trackinfo(L,R,offset,delta_s,delta_theta)
    R = R+offset;
    sx1 = linspace(0, L, (L - 0) / delta_s + 1);
    sx2 = linspace(L, 0, (L - 0) / delta_s + 1);

    sy1 = linspace(-offset, -offset, (L - 0) / delta_s + 1);
    sy2 = linspace(400+offset, 400+offset, (L - 0) / delta_s + 1);

    t1 = linspace( -pi/2, pi/2, (pi / (delta_theta*pi/180)));
    t2 = linspace( pi/2, 3*pi/2, (pi / (delta_theta*pi/180)));

    xp = [sx1 , R*cos(t1) + L , sx2, R*cos(t2)];
    yp = [sy1, R*sin(t1) + R-offset , sy2 , R*sin(t2) + R-offset];
end

function raceStats = raceStat(X,Y,t,path)
%========================================================
% 
% Usage: rs = raceStat(X,Y,t,path)
%
% Inputs:   X, Y are coordinates from your vehicle simulations. 
%           t is the set times corresponding to X and Y
%           path is a structure with fields "width" (width of the 
%                  track), "l_st" (length of the straight away), and 
%                  "radius" (radius of the curved section)
%
% Outputs: raceStats is a structure with the following fields:
%
%   loops - this is an integer that tells how many loops around
%              the track the vehicle has gone around
%   tloops - this is an array that tells you the time(s) that the
%              start line was crossed 
%   lefftTrack - this has the X,Y and t values when the vehicle
%              went outside the track
%   
%========================================================

prev_section = 6;
loops = -1;
j = 0;
k = 0;
Xerr = [];
Yerr = [];
terr = [];
for i = 1:length(X)
    if X(i) < path.l_st
        if X(i) >= 0
            if Y(i) < path.radius
                section = 1;
            else
                section = 4;
            end
        else
            if Y(i) < path.radius
                section = 6;
            else
                section = 5;
            end
        end
    else
        if Y(i) < path.radius
            section = 2;
        else
            section = 3;
        end
    end
    if ((prev_section == 6) && (section == 1))
        loops = loops  + 1;
        j = j+1;
        tloops(j) = t(i);
    end
    prev_section = section;
    if ~insideTrack(X(i),Y(i),section,path)
        k = k+1;
        Xerr(k) = X(i);
        Yerr(k) = Y(i);
        terr(k) = t(i);
    end
end
raceStats.loops = loops;
raceStats.tloops = tloops;
raceStats.leftTrack.X = Xerr;
raceStats.leftTrack.Y = Yerr;
raceStats.leftTrack.t = terr;
end

function yesorno = insideTrack(x,y,section,path)
switch section
    case 1
        if ((y < (0.0 + path.width)) && (y > (0.0 - path.width))) 
            yesorno = 1;
        else
            yesorno = 0;
        end
    case {2, 3}
        rad = sqrt((x - path.l_st)^2 + (y - path.radius)^2);
        if ((rad < path.radius + path.width) && ...
                (rad > path.radius - path.width))
            yesorno = 1;
        else
            yesorno = 0;
        end
    case 4
        if ((y < (2 * path.radius + path.width)) && ...
                (y > (2 * path.radius - path.width))) 
            yesorno = 1;
        else
            yesorno = 0;
        end        
    case {5, 6}
        rad = sqrt((x - 0.0)^2 + (y - path.radius)^2);
        if ((rad < path.radius + path.width) && ...
                (rad > path.radius - path.width))
            yesorno = 1;
        else
            yesorno = 0;
        end
    otherwise
        print("error");
end
end