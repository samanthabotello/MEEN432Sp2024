% Samantha Botello
% 1/23
% Project 1 



% Initial Conditions 
w_0 = 4; % Initial Angular Velocity [rad/s]
J = 1; % Rotational Inertia [kg-m^2]
b = 1; % Damping Coefficient [N-m-s/rad]
A = 4; % Constant Applied Torque [N-m]

set_param('Project1', 'StopTime', '25')

%fixedstep_plot
variabletime_plot
count = 1


time = cpuTime()
cputime_output = [time(1)]
for w = 1:(length(time)-1)
    subval = time(w+1) - time(w)
    cputime_output(end+1) = subval
    
end

function time = cpuTime()
    time = []
    tstart = cputime;
    dT = [0.001, 0.1, 1]; % Time Step [s]
    solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]
    for i = 1:length(dT)
        t  = dT(1,i);
        for k = 1:length(solver)
            s = solver(k);
            fprintf('t = %.4f, s=%s ', t, s)
            simout = sim("Project1.slx","Solver",s,"FixedStep",string(t));
            W = simout.w.Data;
            W_DOT = simout.w_dot.Data;
            T = simout.tout;
            figure
            plot(T,W);
            title("Angular Velocity vs Time")
            ylabel("Angular velocity [rad/s]")
            xlabel("Time")
     
            tend = cputime-tstart
            time(end+1) = tend
            %plot(W_DOT,T);

        end
    end
end


function variabletime_plot()
    var_time_step_solver = ["ode45", "ode23tb"]; % variable time step

    for k = 1:length(var_time_step_solver)
        s = var_time_step_solver(k);
        simout = sim("Project1.slx","Solver",s);
        W = simout.w.Data;
        W_DOT = simout.w_dot.Data;
        T = simout.tout;
        figure
        plot(T,W);
        title("Angular Velocity vs Time")
        ylabel("Angular velocity [rad/s]")
        xlabel("Time")
        % plot(W_DOT,T);
    end
end
