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

% Plotting ODE with each stepsize.
% ode 4
cpu_ode4_001,error_ode4_001 = fixedstep("ode4",".001",w_0_values,J_values,b_values,A_values);
cpu2_ode4_01,error_ode4_01 = fixedstep("ode4",".1",w_0_values,J_values,b_values,A_values);
cpu3_ode4_1,error_ode4_1 = fixedstep("ode4","1",w_0_values,J_values,b_values,A_values);

figure(1)
cpu = [cpu_ode4_001',cpu2_ode4_01',cpu3_ode4_1'];
plot(time_step,cpu)
legend
xlabel("Step Size")
ylabel("Cpu Time")
title("Cpu vs Step Size Ode 4")

figure(2)
error = [error_ode4_001',error_ode4_01',error_ode4_1'];
plot(time_step,error)
xlabel("Step Size")
ylabel("Max Error")
title("Error vs Step Size Ode 4")

figure(3)
plot(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Error vs CPU time Ode 4")

% ode 1
cpu_ode1_001,error_ode1_001 = fixedstep("ode1",".001",w_0_values,J_values,b_values,A_values);
cpu2_ode1_01,error_ode1_01 = fixedstep("ode1",".1",w_0_values,J_values,b_values,A_values);
cpu3_ode1_1,error_ode1_1 = fixedstep("ode1","1",w_0_values,J_values,b_values,A_values);

figure(4)
cpu = [cpu_ode1_001',cpu2_ode1_01',cpu3_ode1_1'];
plot(time_step,cpu)
legend
xlabel("Step Size")
ylabel("Cpu Time")
title("Cpu vs Step Size Ode 1")

figure(5)
error = [error_ode1_001',error_ode1_01',error_ode1_1'];
plot(time_step,error)
xlabel("Step Size")
ylabel("Max Error")
title("Error vs Step Size Ode 1")

figure(6)
plot(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Error vs CPU time Ode 1")


% ode 45
cpu,error = variabletime("ode45",w_0_values,J_values,b_values,A_values);

figure(7)
plot(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Error vs CPU time Ode45")


% ode 23tb
cpu,error = variabletime("ode23tb",w_0_values,J_values,b_values,A_values);

figure(8)
plot(cpu,error)
xlabel("Cpu time")
ylabel("Max Error")
title("Error vs CPU time Ode23tb")

% function for fixed step
function [cpu,error] = fixedstep(solver,stepsize,w_0_values,J_values,b_values,A_values)
    cpu = [];
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

                    %Error Calculation
                    T = simout.tout;
                    true_val = [];
                    for t = 1:length(T)
                        true_val(end+1) = model(b,J,A,T(t),w_0);
                    end
                    W = simout.w.Data;
                    max_error = 0;
                    for q = 1:length(W)
                        error = (abs(true_val(q)-W(q)));
                        if (error> max_error)
                            max_error = error;
                        end
                    end
                    
                    error(end+1) = max_error;

                end
            end
        end
    end
   
end

% function for variable time
function [cpu] = variabletime(solver,w_0_values,J_values,b_values,A_values)
    cpu = [];
    for i = 1:length(w_0_values)
        w_0 = w_0_values(i);
        for j = 1:length(J_values)
            J = J_values(j);
            for k = 1:length(b_values)
                b = b_values(k);
                for l = 1:length(A_values)
                    A = A_values(l);
                  
                    tStart = cputime;
                    simout = sim("Project1.slx","Solver",solver);
                    tTotal = cputime - tStart;
                    cpu(end+1) = tTotal;

                   

                end
            end
        end
    end
   
end

%Math Model
function [angular_v] = model(b,J,T_0,t,w_0)
    angular_v = T_0/b*(1-exp(-b*t/J))+w_0*exp(-b*t/J);
end
