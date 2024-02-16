Descrition of Code:
The code simulates a car moving along a predifiend track. The team began the script by specifying the parameters about the track (length, radius, width, and increments). It obtains the track points using the "trackinfo" function that generates the points ("xp" and "yp") based on the inputs. The script uses the generated track points to plot the path as a single animated line using "animatedline" function. The car patch is represented by "xc" and "yc" is initialized and animated to follow the track. The "rotate_car" function rotates the car based on the tangent angle at each point. To calculate the tangent angle, the function uses car coorinates ("x" and "y"), index ("k"), and track points ("xp" and "yp"). The main animation loop updates the car's position and rotation at each point and plots it on the line. The "drawnow" function is used to display the animation in real-time. 

To run the script:
Download Project_2_CODE.m

Make sure track data is what is desired, adjust length, radius, width, and interval between points on straights and curves, respectively delta_s and delta_theta.

execute script
