Descrition of Code:
The code simulates a car moving along a predifiend track. The team began the script by specifying the parameters about the track (length, radius, width, and increments). It obtains the track points using the "trackinfo" function that generates the points ("xp" and "yp") based on the inputs. The script uses the generated track points to plot the path as a single animated line using "animatedline" function. The car patch is represented by "xc" and "yc" is initialized and animated to follow the track. The "rotate_car" function rotates the car based on the tangent angle at each point. To calculate the tangent angle, the function uses car coorinates ("x" and "y"), index ("k"), and track points ("xp" and "yp"). The main animation loop updates the car's position and rotation at each point and plots it on the line. The "drawnow" function is used to display the animation in real-time. 

To run the script:
Download Project_2_CODE.m

Make sure track data is what is desired, adjust length, radius, width, and interval between points on straights and curves, respectively delta_s and delta_theta.

execute script

Week2 Description 
We started with the provided demo simulink model and attempted to implement a driver function that accounts for path curvature and stays on course. The driver function generates a series of points coresponding to the path and calculates the closest point to the current location of the vehicle and then goes two points down the path and calculates the angle between the car and that next point and sets it equal to the steering angle. There were multiple problems that we noticed but could not account for. The first problem was the car starts turning before it is supposed to. The second problem is that the current implementation does not account for the drift angle of the vehicle and this results in a steering angle that takes the car further off course. 

We will be going to office hours this week so that we can resolve these issues.

## Week 1 Feedback (3.8/5)
The MATLAB script "Project2_CODE.m" was not uploaded correctly and cannot be opened. If you would like to resubmit it for better feedback, do so and email me that you did. For Week 2, start developing a lateral dynamic model of a vehicle that contains subsystems that are listed in the Week 2 document.
