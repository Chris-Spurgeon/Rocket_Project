% WRITTEN BY CHRIS SPURGEON


% Calculate the trajectory in Cartesian coordinates
x = all_y(:, 1) .* cos(all_y(:, 2)); % x = r * cos(theta)
y_trajectory = all_y(:, 1) .* sin(all_y(:, 2)); % y = r * sin(theta)

% Plot trajectory
figure;
plot(x, y_trajectory, 'b', 'LineWidth', 2);
hold on;

% Adding Earth as a circle
theta = linspace(0, 2*pi, 100);
earth_x = r0 * cos(theta);
earth_y = r0 * sin(theta);
fill(earth_x, earth_y, [0.5, 0.8, 1], 'EdgeColor', 'none'); % Earth fill
plot(earth_x, earth_y, 'k', 'LineWidth', 1); % Earth's edge

% Adding orbit as a circle
orbit_x = params.ro * cos(theta);
orbit_y = params.ro * sin(theta);
plot(orbit_x, orbit_y, '--r', 'LineWidth', 1); % Orbit

% Adding orbit as a circle
%orbit_x = rTarget * cos(theta);
%orbit_y = rTarget * sin(theta);
%plot(orbit_x, orbit_y, '--r', 'LineWidth', 1); % Orbit


% Labels and visualization settings
axis equal;
xlabel('X (km)');
ylabel('Y (km)');
title('Rocket Trajectory from Launch to Orbit');
legend('Trajectory', 'Earth', 'Orbit');
grid on;

% Plot radial position vs. time
figure;
plot(all_t, all_y(:, 1), 'b', 'LineWidth', 2);
hold on;
yline(params.ro, '--r', 'LineWidth', 2, 'Label', 'Orbital Radius'); % Orbital radius
xlabel('Time (s)');
ylabel('Radial Position (km)');
title('Radial Position vs. Time');
%legend('Radial Position', 'Orbital Radius');
grid on;


% Calculate orbital velocity at r = ro
v_orbitLEO = sqrt(params.mu / params.ro);
% Calculate orbital velocity at r = ro
%v_orbitHO = sqrt(params.mu / rTarget);

% Plot radial and tangential velocity vs. time
figure;
plot(all_t, all_y(:, 3), 'r', 'LineWidth', 2); % Radial velocity
hold on;
yline(v_orbitLEO, '--r', 'LineWidth', 2, 'Label', 'Orbital Velocity LEO'); % Orbital velocity
plot(all_t, all_y(:, 4), 'g', 'LineWidth', 2); % Tangential velocity
%yline(v_orbitHO, '--r', 'LineWidth', 2, 'Label', 'Orbital Velocity Higher'); % Orbital velocity
xlabel('Time (s)');
ylabel('Velocity (km/s)');
title('Radial and Tangential Velocity vs. Time');
legend('Radial Velocity', 'Orbital Velocity LEO', 'Tangential Velocity');
grid on;



% Plot tangential velocity vs. time with orbital velocity
figure;
plot(all_t, all_y(:, 4), 'b', 'LineWidth', 2); % Tangential velocity
hold on;
yline(v_orbitLEO, '--r', 'LineWidth', 2, 'Label', 'Orbital Velocity'); % Orbital velocity
xlabel('Time (s)');
ylabel('Tangential Velocity (km/s)');
title('Tangential Velocity vs. Time');
legend('Tangential Velocity', 'Orbital Velocity');
grid on;

% Plot mass vs. time
figure;
plot(all_t, all_y(:, 5), 'b', 'LineWidth', 2); % Mass (5th state variable)
xlabel('Time (s)');
ylabel('Mass (kg)');
title('Rocket Mass vs. Time');
grid on;
%%
% Plot mass vs. time with a logarithmic y-axis
figure;
semilogy(all_t, all_y(:, 5), 'b', 'LineWidth', 2); % Mass (5th state variable)
xlabel('Time (s)');
ylabel('Mass (kg)');
title('Rocket Mass vs. Time (Log Scale)');
grid on;

%%
% Calculate speed (magnitude of the velocity vector)
speed = sqrt(all_y(:, 3).^2 + all_y(:, 4).^2); % speed = sqrt(vr^2 + vtheta^2)

% Plot speed vs. time with orbital velocity
figure;
plot(all_t, speed, 'b', 'LineWidth', 2); % Speed
hold on;
yline(v_orbitLEO, '--r', 'LineWidth', 2, 'Label', 'Orbital Velocity LEO'); % Orbital velocity
%yline(v_orbitHO, '--r', 'LineWidth', 2, 'Label', 'Orbital Velocity Higher'); % Orbital velocity
xlabel('Time (s)');
ylabel('Speed (km/s)');
title('Rocket Speed vs. Time');
%legend('Rocket Speed', 'Orbital Velocity');
grid on;