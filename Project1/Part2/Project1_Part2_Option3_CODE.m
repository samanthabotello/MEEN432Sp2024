clear
set_param('Project1_Part2_Option3_MODEL', 'StopTime', '25')
J1 = 100; % Rotational Inertia [kg-m^2]
b1 = 1; % Damping Coefficient [N-m-s/rad]
J2 = 1; % Rotational Inertia [kg-m^2]
b2 = 1; % Damping Coefficient [N-m-s/rad]
A_values = [1,100]; % Constant Applied Torque [N-m]
time_step_values = [0.1,1]; % time steps [s]
fixed_solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]
variable_solver = "ode45"; % variable Time Step Solver [Euler]

%CPU time to run full script is output to console.
tstart = cputime;

%ODE 1
step_size = ".1";
for j = 1:length(A_values)
    A = A_values(j);
    simout = sim("Project1_Part2_Option3_MODEL.slx","Solver","ode1","FixedStep",step_size);
    W = simout.w.Data;
    T = simout.tout;
    figure
    scatter(T,W)
    title("Shaft speed vs time ode1 step size ="+ step_size + " A = " + A)
    xlabel("Time")
    ylabel("Shaft speed")
end
step_size = "1";
for j = 1:length(A_values)
    A = A_values(j);
    simout = sim("Project1_Part2_Option3_MODEL.slx","Solver","ode1","FixedStep",step_size);
    W = simout.w.Data;
    T = simout.tout;
    figure
    scatter(T,W)
    title("Shaft speed vs time ode1 step size ="+ step_size + " A = " + A)
    xlabel("Time")
    ylabel("Shaft speed")
end

%ODE4
step_size = ".1";
for j = 1:length(A_values)
    A = A_values(j);
    simout = sim("Project1_Part2_Option3_MODEL.slx","Solver","ode1","FixedStep",step_size);
    W = simout.w.Data;
    T = simout.tout;
    figure
    scatter(T,W)
    title("Shaft speed vs time ode4 step size ="+step_size + " A = " + A)
    xlabel("Time")
    ylabel("Shaft speed")
end
step_size = "1";
for j = 1:length(A_values)
    A = A_values(j);
    simout = sim("Project1_Part2_Option3_MODEL.slx","Solver","ode1","FixedStep",step_size);
    W = simout.w.Data;
    T = simout.tout;
    figure
    scatter(T,W)
    title("Shaft speed vs time ode4 step size ="+step_size + " A = " + A)
    xlabel("Time")
    ylabel("Shaft speed")
end

%ode45
for j = 1:length(A_values)
    A = A_values(j);
    simout = sim("Project1_Part2_Option3_MODEL.slx","Solver","ode1","FixedStep",step_size);
    W = simout.w.Data;
    T = simout.tout;
    figure
    scatter(T,W)
    title("Shaft speed vs time ode45 step size =" + step_size + " A = " + A)
    xlabel("Time")
    ylabel("Shaft speed")
end
T_Total = cputime - tstart