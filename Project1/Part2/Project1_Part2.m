
clear
set_param('Project1_Part2', 'StopTime', '25')
J1 = 100; % Rotational Inertia [kg-m^2]
b1 = 1; % Damping Coefficient [N-m-s/rad]
J2 = 1; % Rotational Inertia [kg-m^2]
b2 = 1; % Damping Coefficient [N-m-s/rad]
w_0 = 5;
A = 0;
k = 0;
T_0_values = [1,100]; % Constant Applied Torque [N-m]
k_values = [10,100,1000]; % spring constant
time_step_values = [0.1,1]; % time steps [s]
fixed_solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]
variable_solver = ["ode45"] % variable Time Step Solver [Euler]
[fixed_plot, fixed_cpu] = fixedstep(T_0_values, k_values, fixed_solver, time_step_values, J1,J2,b1,b2)

[variable_plot, variable_cpu] = variablestep(T_0_values, k_values, variable_solver, time_step_values, J1,J2,b1,b2)


% function for fixed step

function [fixed_plot, fixed_cpu] = fixedstep(T_0_values, k_values, fixed_solver, time_step_values, J1,J2,b1,b2)

   fixed_cpu = [];
   for i = 1:length(k_values)
       k = k_values(i);
       for l = 1:length(T_0_values)
            A = T_0_values(l);
            for s = 1:length(fixed_solver)
                 solver = fixed_solver(s)
                 for t = 1:length(time_step_values)
                     timestep = time_step_values(t)
                     tStart = cputime;
                     simout = sim("Project1_Part2.slx","Solver",solver,"FixedStep",string(timestep));
                     tTotal = cputime - tStart;
                     fixed_cpu(end+1) = tTotal;
                     hold on
                     W = simout.w2.Data;
                     W_DOT = simout.w_dot2.Data;
                     T = simout.tout;
                     figure
                     fixed_plot = scatter(T,W)
                     title("Angular Velocity vs Time for " + solver + " ,K = " + k + " ,step size = " + timestep + " ,torque = " + A)
                     ylabel("Angular velocity [rad/s]")
                     xlabel("Time")
                 end
    
            end 
                
       end     
    end
end

%variable_solver = "ode45"
function [variable_plot,variable_cpu] = variablestep(T_0_values, k_values, variable_solver, time_step_values, J1,J2,b1,b2)
  
   variable_cpu = [];
   for i = 1:length(k_values)
       k = k_values(i);
       for l = 1:length(T_0_values)
            A = T_0_values(l);
            for s = 1:length(variable_solver)
                 solver = variable_solver(s);
              
                 tStart = cputime;
                 simout = sim("Project1_Part2.slx","Solver",solver);
                 tTotal = cputime - tStart;
                 variable_cpu(end+1) = tTotal;
                 hold on
                 W = simout.w2.Data;
                 W_DOT = simout.w_dot2.Data;
                 T = simout.tout;
                 figure
                 variable_plot = scatter(T,W)
                 title("Angular Velocity vs Time for " + solver + " ,K = " + k + " ,torque = " + A)
                 ylabel("Angular velocity [rad/s]")
                 xlabel("Time")
             end
    
           
                
       end     
    end
end
