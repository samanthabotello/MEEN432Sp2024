# 4/7/2024 Final Submition
We chose to put the two drive cycles in seperate files. Run the project3 init file then run one of the drive cycle files then run the Project3_CODE. After the simulation completes reapeat the process with the other drive cycle. For the Urban drive cycle set the simulation stop time to 1369s and for the Highway cycle set the stop time to 765s. We made updates to the original model provided. We modeled the braking system for times when the angular velocity is/isn't equal to 0 rad/s. In addition, we added regenerative braking. We removed the powertrain system and added in an electric motor drive. The electric motor drive consists of an electric motor and batttery subsystem. The drive takes inputs of throttle and motor speed. The outputs include motor torque and motor inertia. The electric motor systems uses battery voltage, throttle (alpha), and motor speed and outputs current, motor torque, and motor inertia. The battery takes input current and outputs battery voltage. We followled the provided battery and electric motor slides to construct our model. 
*We all worked on project in a zoom call
## RUN ORDER
Project3_init.m\
initUrbanCycle.m\
Proect3_CODE.m\
initHighwayCycle.m\
Proect3_CODE.m\

# 3/24/2024 Submition 
We focused on changing the braking function and tuning the PID controller to make the car velocity always stay within the required drive cycle bounds. First we ran the provided file and observed the behaviour. The velocity of the car went outside of the bounds at multiple locations. We noticed that the car was not acclerating or braking fast enough. To achieve desired vehicle performance we increased the proportional constant in the PID controller to .4 and we added an integral constant of .25 to make the driver model continuously attempt to correct its velocity. We decided to use the exact sign function in the braking model.

We all worked on the project together in a zoom call.

Download all files and execute them in the following order.
## RUN ORDER
init.m\
initDriveCycle.m\
p3_runsim.m

## Week 1/2 Feedback (3.8/5)
The Highway and Urban drive cycles were not utilized for the simulation and the plot created does not correspond to either Highway or Urban cycle, please check the Project 3 deliverable document for the link to the EPA website with the drive cycles included. The final submission should have the P3 initialization file, some initialization files for each of the drive cycles, a script that is able to run the simulink model for both drive cycles and plots the simulated cycle with the respective drive cycle along with some +- 3 mph error band. Regarding the simulink model it doesn't look like there were any changes made to the demo model given so I am unable to provide good feedback for the model. For the final submission, I would advise the team to do the following: 1) In the driver subsystem, start adding/developing logic for regen braking. 2) In the braking subsystem, there are more things that needto be added regarding the logic of how the brake torque/brake force is calculated. 3) Start developing an Electric Motor Drive subsystem that has the components needed for the electric motor (battery, inverter, electric motor) and develop the logic that is needed to calculate the motor torque. The team should also add a Drive subsystem that takes in the outputs from the Electric Motor Drive Subsystem and multiplies the outputs by some Final Drive Gear Ratio (FDG) which will replace the current powertrain block. 4) 2 plots should be generated for that contains the drive cycle and the simulated velocity on the same plot for each Highway and Urban cycle. 
