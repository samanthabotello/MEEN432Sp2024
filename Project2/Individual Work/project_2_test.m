
% Define oval track parameters
a = 5; % Major axis length
b = 2; % Minor axis length
theta = linspace(0, 2*pi, 100); % Angle range

% Parametric equations for oval track
x = a*cos(theta);
y = b*sin(theta);

% Plot oval track
figure;
plot(x, y, 'k', 'LineWidth', 2);
axis equal;
hold on;

% Define rectangle dimensions
rect_width = 1; % Width of the rectangle
rect_height = 0.5; % Height of the rectangle

% Initialize patch position and angle
patch_position = [x(1), y(1)]; % Starting position
tangent_angle = atan2(y(2)-y(1), x(2)-x(1)); % Angle of the tangent at the starting position

% Plot the initial patch
patch_handle = rectangle('Position', [patch_position(1)-rect_width/2, patch_position(2)-rect_height/2, rect_width, rect_height], 'FaceColor', 'r');

% Simulate patch movement along the oval track
for i = 2:length(x)
    % Update patch position
    patch_position = [x(i), y(i)];
    
    % Calculate tangent angle
    tangent_angle = atan2(y(i)-y(i-1), x(i)-x(i-1));
    
    % Rotate rectangle to align with the tangent
    rotation_matrix = [cos(tangent_angle), -sin(tangent_angle); sin(tangent_angle), cos(tangent_angle)];
    rect_points = [rect_width/2, rect_height/2; -rect_width/2, rect_height/2; -rect_width/2, -rect_height/2; rect_width/2, -rect_height/2];
    rotated_rect_points = (rotation_matrix * rect_points')';
    
    % Plot the rectangle at the new position and angle
    delete(patch_handle); % Delete the previous patch
    patch_handle = patch(rotated_rect_points(:,1)+patch_position(1), rotated_rect_points(:,2)+patch_position(2), 'r'); % Plot the new patch and update its handle
    
    pause(0.1); % Pause for visualization
    

end

hold off;