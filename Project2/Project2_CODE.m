%% Obtain track points from trackinfo function

track_length = 900;
track_radius = 200;
track_width = 15;
delta_s = 20;
delta_theta = 5;

[xp,yp,w] = trackinfo(track_length,track_radius,track_width,delta_s,delta_theta);

simout = sim("Project2_MODEL.slx");
plot(simout.X.data,simout.Y.data)


%% Plot the path as a single animated line


% 
% h = animatedline();
% 
% for k = 1:length(xp)
%     addpoints(h,xp(k),yp(k));
%     drawnow; axis equal;
% end
% 
% %% Make patch values x-car and y-car
% 
% xc = [10 -10 -10 10];
% yc = [5 5 -5 -5];
% 
% %patch( xc , yc,'r')
% 
% 
% %% animate the patch following the track
% 
% h = animatedline('Color','r');
% 
% patch(xc,yc,'r')                                % initialize patch at starting location
% 
% for k = 2:length(xp)
% 
%     delete(findall(gca, 'Type', 'Patch'));   % delete any previous patches on the track
% 
%     rotated_car = rotate_car(xc,yc,k,xp,yp);    % call the rotate function and get new car rotation
% 
%     xcm = xp(k)+rotated_car(1,:);            % modify rotated car location to be on track for both x and y
%     ycm = yp(k)+rotated_car(2,:);
% 
%     patch(xcm,ycm,'y')                     % plot the new car
%     drawnow;
% 
%     addpoints(h,xp(k),yp(k));
%     drawnow;
% 
%     %pause(.01)
% 
% end


%% Make car rotation function

function rotated_car = rotate_car(x,y,k,xp,yp)
    tangent_angle = atan2(yp(k)-yp(k-1), xp(k)-xp(k-1)); 
    rotation_matrix = [cos(tangent_angle), -sin(tangent_angle); sin(tangent_angle), cos(tangent_angle)];
    rect_points = [x; y];
    rotated_car = (rotation_matrix * rect_points);
end


%% Track information Function to make track points


function [xp,yp,w] = trackinfo(L,R,w,delta_s,delta_theta)
    
    sx1 = linspace(0, L, (L - 0) / delta_s + 1);
    sx2 = linspace(L, 0, (L - 0) / delta_s + 1);

    sy1 = linspace(0, 0, (L - 0) / delta_s + 1);
    sy2 = linspace(R*2, R*2, (L - 0) / delta_s + 1);

    t1 = linspace( -pi/2, pi/2, (pi / (delta_theta*pi/180)));
    t2 = linspace( pi/2, 3*pi/2, (pi / (delta_theta*pi/180)));
 
    xp = [sx1 , R*cos(t1) + L , sx2, R*cos(t2)];
    yp = [sy1, R*sin(t1) + R , sy2 , R*sin(t2) + R];
end