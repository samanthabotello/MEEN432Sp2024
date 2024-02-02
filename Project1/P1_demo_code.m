% Initial Conditions 
w_0_values = [0,10]; % Initial Angular Velocity [rad/s]
J_values = [.01,100]; % Rotational Inertia [kg-m^2]
b_values = [.1,10]; % Damping Coefficient [N-m-s/rad]
A_values = [0,100]; % Constant Applied Torque [N-m]
time_step = [.001,.1,1];
w_0 = 0;
A = 0;
J = 0;
b = 0;
set_param('Project1', 'StopTime', '25')
cpu = [];
cpu1 = fixedstep("ode4",".001",w_0_values,J_values,b_values,A_values,cpu);
cpu2 = fixedstep("ode4",".1",w_0_values,J_values,b_values,A_values,cpu);
cpu3 = fixedstep("ode4","1",w_0_values,J_values,b_values,A_values,cpu);
cpu = [cpu1',cpu2',cpu3']
plot(time_step,cpu)
legend
xlabel("Step Size")
ylabel("Cpu Time")
%Plotting ODE 1 with each stepsize.


function [cpu] = fixedstep(solver,stepsize,w_0_values,J_values,b_values,A_values,cpu)

    for i = 1:length(w_0_values)
        w_0 = w_0_values(i);
        for j = 1:length(J_values)
            J = J_values(j);
            for k = 1:length(b_values)
                b = b_values(k);
                for l = 1:length(A_values)
                    A = A_values(l);
                  
                    tStart = cputime;
                    simout = sim("Project1.slx","Solver",solver,"FixedStep",stepsize);
                    tTotal = cputime - tStart;
                    cpu(end+1) = tTotal;
                end
            end
        end
    end
   
end
