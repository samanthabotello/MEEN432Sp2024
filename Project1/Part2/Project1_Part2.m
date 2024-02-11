J1 = 100;
b1 = 1;
J2 = 1;
b2 = 1;
T_0_values = [1,100];
k_values = [10,100,1000];
time_step_values = [.1,1];
set_param('Project1_Part2', 'StopTime', '25')

function [cpu] = fixedstep(solver,w_0_values,A_values)
    cpu = [];
    for i = 1:length(w_0_values)
        w_0 = w_0_values(i);
            for k = 1:length(b_values)
                b = b_values(k);
                for l = 1:length(A_values)
                    A = A_values(l);

                    %CPU Time
                    tStart = cputime;
                    simout = sim("Project1_Part2.slx","Solver",solver);
                    tTotal = cputime - tStart;
                    cpu(end+1) = tTotal;
                end
            end
        end
end
