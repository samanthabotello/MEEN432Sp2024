%% Obtain track points from trackinfo function
track_length = 900;
track_radius = 200;
track_width = 15;
delta_s = 1;
delta_theta = 1;
path.width = track_width;
path.l_st = track_length;
path.radius = track_radius;
P4init;
[xp,yp] = trackinfo(track_length,track_radius,0,delta_s,delta_theta);
set_param('Project4_MODEL', 'StopTime', '200')
simout = sim("Project4_MODEL.slx");
X = simout.X.data;
Y = simout.Y.data;
psi = simout.psi.data;
stats = raceStat(X,Y,simout.tout,path, simout);
disp(stats)
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
