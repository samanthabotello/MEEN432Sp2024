clear
set_param('Project1_Part2_Option1_MODEL', 'StopTime', '25')
k = 0;
J1 = 100; % Rotational Inertia [kg-m^2]
b1 = 1; % Damping Coefficient [N-m-s/rad]
J2 = 1; % Rotational Inertia [kg-m^2]
b2 = 1; % Damping Coefficient [N-m-s/rad]
k_values = [10,100,1000]; % spring constant
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
    for i = 1:length(k_values)
        k = k_values(i);
        simout = sim("Project1_Part2_Option1_MODEL.slx","Solver","ode1","FixedStep",step_size);
        W = simout.w2.Data;
        T = simout.tout;
        figure
        plot(T,W)
        title("Shaft speed vs time ode1 step size ="+step_size+" k = "+ k + " A = " + A)
        xlabel("Time")
        ylabel("Shaft speed")
    end
end
step_size = "1";
for j = 1:length(A_values)
    A = A_values(j);
    for i = 1:length(k_values)
        k = k_values(i);
        simout = sim("Project1_Part2_Option1_MODEL.slx","Solver","ode1","FixedStep",step_size);
        W = simout.w2.Data;
        T = simout.tout;
        figure
        plot(T,W)
        title("Shaft speed vs time ode1 step size ="+step_size+" k = "+ k + " A = " + A)
        xlabel("Time")
        ylabel("Shaft speed")
    end
end

%ODE4
step_size = ".1";
for j = 1:length(A_values)
    A = A_values(j);
    for i = 1:length(k_values)
        k = k_values(i);
        simout = sim("Project1_Part2_Option1_MODEL.slx","Solver","ode4","FixedStep",step_size);
        W = simout.w2.Data;
        T = simout.tout;
        figure
        plot(T,W)
        title("Shaft speed vs time ode4 step size ="+step_size+" k = "+ k + " A = " + A)
        xlabel("Time")
        ylabel("Shaft speed")
    end
end
step_size = "1";
for j = 1:length(A_values)
    A = A_values(j);
    for i = 1:length(k_values)
        k = k_values(i);
        simout = sim("Project1_Part2_Option1_MODEL.slx","Solver","ode4","FixedStep",step_size);
        W = simout.w2.Data;
        T = simout.tout;
        figure
        plot(T,W)
        title("Shaft speed vs time ode4 step size ="+step_size+" k = "+ k + " A = " + A)
        xlabel("Time")
        ylabel("Shaft speed")
    end
end

%ode45
for j = 1:length(A_values)
    A = A_values(j);
    for i = 1:length(k_values)
        k = k_values(i);
        simout = sim("Project1_Part2_Option1_MODEL.slx","Solver","ode45");
        W = simout.w2.Data;
        T = simout.tout;
        figure
        plot(T,W)
        title("Shaft speed vs time ode45 " +"k = "+ k + " A = " + A)
        xlabel("Time")
        ylabel("Shaft speed")
    end
end

T_Total = cputime - tstart

%function DOESNT WORK
%PROBABLY CURSED
% function fixed(step_size,A)
%     global J1
%     global b1
%     global J2
%     global b2
%     global k_values
%     A = A;
%     for i = 1:length(k_values)
%         k = k_values(i);
%         simout = sim("Project1_Part2_Option1_MODEL.slx","Solver","ode1","FixedStep",step_size);
%         W = simout.w2.Data;
%         T = simout.tout;
%         figure
%         plot(T,W)
%         title("Shaft speed vs time ode1 step size ="+step_size+" k = "+ k + " A = " + A)
%         xlabel("Time")
%         ylabel("Shaft speed")
%     end
% end