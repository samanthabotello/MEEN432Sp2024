### Week1 Description 
Descrition of Code:
The code simulates a car moving along a predifiend track. The team began the script by specifying the parameters about the track (length, radius, width, and increments). It obtains the track points using the "trackinfo" function that generates the points ("xp" and "yp") based on the inputs. The script uses the generated track points to plot the path as a single animated line using "animatedline" function. The car patch is represented by "xc" and "yc" is initialized and animated to follow the track. The "rotate_car" function rotates the car based on the tangent angle at each point. To calculate the tangent angle, the function uses car coorinates ("x" and "y"), index ("k"), and track points ("xp" and "yp"). The main animation loop updates the car's position and rotation at each point and plots it on the line. The "drawnow" function is used to display the animation in real-time. 

To run the script:
Download Project_2_CODE.m

Make sure track data is what is desired, adjust length, radius, width, and interval between points on straights and curves, respectively delta_s and delta_theta.

execute script

### Week2 Description 
We started with the provided demo simulink model. We altered the alpha_r and alpha_f equations to match the equations from the slides for vehicle dynamics. These equations now are expressed as arctangents. We attempted to implement a driver function that accounts for path curvature and stays on course. The driver function generates a series of points coresponding to the path and calculates the closest point to the current location of the vehicle and then goes two points down the path and calculates the angle between the car and that next point and sets it equal to the steering angle. There were multiple problems that we noticed but could not account for. The first problem was the car starts turning before it is supposed to. The second problem is that the current implementation does not account for the drift angle of the vehicle and this results in a steering angle that takes the car further off course. 

We will be going to office hours this week so that we can resolve these issues.

NOTE: When you run the Simulink model set the stop time to 2 seconds otherwise the graph output will be wildly incorrect and unreadable. 

We also resubmitted the matlab file for week 1 and sent an email regarding the submission late last week. We apologize for the inconvenience and hope you can accept this new submission. Thanks!

### Week3 Description FINAL
We combined the animation code developed in Week 1 with the Simulink model developed in week 2 to provide visualization of the car going around the track. We used the pure pursuit alhorithim in the driver portion of the Simulink model. Our pure pursuit algorithim first generates a list containing the distance between the current location of the car and every point on the track. The smallest distance is identified and then a lookahead distance is added to that point. The steering angle is then calculated based on the angle between the desired point and the car minus the current heading. There is a compensation factor based on the speed and the wheel Base. Finally the current yaw rate is subtracted from the desired yaw rate. The track was generated using parameters given and hardcoded at the begining of the file. The parameters are read in and the track points are formed in a variable that can be rewriten for any path the car wants to run. When the track is read into the simulink it will read in the important points on the track and output the position of the car at various times. The bounds of the track are represented by black lines and an animation plays that shows the path of the car. The car stays on the track and completes a full lap in approximately 300s. 

NOTE: Please make sure to use the init file from this repository because we calculated the wheelbase length within the init file.

#### Instructions:
Download all files and ensure they are in the same directory\
Run the init file\
set desired stop time for simulation\
run Project2_CODE.m

## Week 1 Feedback (3.8/5)
The MATLAB script "Project2_CODE.m" was not uploaded correctly and cannot be opened. If you would like to resubmit it for better feedback, do so and email me that you did. For Week 2, start developing a lateral dynamic model of a vehicle that contains subsystems that are listed in the Week 2 document.

## Week 2 Feedback (4.4/5)
I went over the issues with the Simulink model for this team during our meeting on 2/28 so I'm hoping that was enough feedback for the team. For the final submission, continue to work through the Simulink model and tweaking it so that you are able to stay on track and go around the track as fast as possible. Now that you have the Simulink model, you can animate the rectangular patch from week 1 using the car simulation data and animate the vehicle going around the race track. The team will also need to utilize the raceStat function somewhere in the MATLAB script to see how many loops the vehicle is able to do and to see information regarding the vehicle leaving the track.
