All files are labled at the end with either CODE if they are a Matlab script or MODEL if it is a Simlink model.

For part 1 we chose to display all of the initial condition combinations on the same graph.
The graphs are grouped by solver.

For part 2 option 1 the script will generate 30 individual graphs and all graphs are titled according to the conditions they
represent.
For options 2 and 3 the graphs are individual graphs, 10 total.

## Week 1 Feedback (5/5): 
Great job! Keep it up for week 2, you're on the right track! 
The one thing I want to say is to consider adding some sort of logic (either in MATLAB script or Simulink model) to determine whether the applied torque is constant or sinusoidal as this will change inputs to determine applied torque. 
Also, make sure to use proper axis in the future (aka Having Time on the x axis) in your plots

## Week 2 Feedback (5/5)
There are some issues regarding the MATLAB script that is not allowing the script to run. There is a specific error occuring saying that there is an Unrecognized function or variable on Line 15. Regarding how to implement sinusoidal torque there are multiple ways to do so. There is the option of adding logic to the Simulink model that checks if the applied torque is constant or sinusoidal. A new variable can be created called "isSin" which contains the values 0 and 1 and depending on what the value of isSin, then the applied torque would be either constant or sinusoidal. This is one option however there are other ways to do so using a MATLAB function in your script but this is something for your team to talk about and decide. If the MATLAB script does run for you guys and it populates plots, then I would suggest saving the figures and adding it to the submission. Regarding Part 2, the team will need to create different simulink models for the 3 options on how to connect System 2 to System 1. I would suggest copying the model you have now for Part 1(once updated) for each of the 3 options and adding onto it based on the option. Once the entire project is complete, make sure to commit Part 1 and Part 2 files with the commit message "Project 1 Final"

## Final Week Feedback
Great Job Team! I have no comments
