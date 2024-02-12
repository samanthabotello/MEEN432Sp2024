% Parameters
radius = 200; % Radius of curved sections
straight_length = 900; % Length of straight sections
track_width = 15; % Width of the track

% Generate curved sections
theta1 = linspace(pi/2, 3*pi/2, 100); % First curved section (pi/2 to 3pi/2 radians)
x1 = radius * cos(theta1);
y1 = -radius * sin(theta1); % Negative sign to flip the curve vertically

theta2 = linspace(3*pi/2, pi/2, 100); % Second curved section (3pi/2 to pi/2 radians)
x2 = -radius * cos(theta2) + straight_length; % Shifted by the length of the straight section
y2 = -radius * sin(theta2); % Negative sign to flip the curve vertically

% Generate straight sections
x3 = linspace(straight_length, straight_length, 100); % First straight section
y3 = linspace(-200, -200, 100);

x4 = linspace(straight_length, 0, 100); % Second straight section, modified end point
y4 = linspace(-200, -200, 100); % Connect to the point (0, -200)


% Combine all sections into a continuous line
x = [x1, x2, x3, x4];
y = [y1, y2, y3, y4];

% Plot the race track
figure;
plot(x, y, 'red', 'LineWidth', track_width);
hold on;


title('Race Track');
xlabel('X (meters)');
ylabel('Y (meters)');
axis equal; % Equal scaling for x and y axes
grid on;



