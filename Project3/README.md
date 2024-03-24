# 3/24/2024 Submition 
We focused on changing the braking function and tuning the PID controller to make the car velocity always stay within the required drive cycle bounds. First we ran the provided file and observed the behaviour. The velocity of the car went outside of the bounds at multiple locations. We noticed that the car was not acclerating or braking fast enough. To achieve desired vehicle performance we increased the proportional constant in the PID controller to .4 and we added an integral constant of .25 to make the driver model continuously attempt to correct its velocity. We decided to use the exact sign function in the braking model.

We all worked on the project together in a zoom call.

Download all files and execute them in the following order.
## RUN ORDER
init.m\
initDriveCycle.m\
p3_runsim.m
