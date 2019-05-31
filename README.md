#Simulating a Jackal in Gazebo

**Tasks to achieve**

1. Build a new world
2. Launch the world and Jackal
3. Jackal should navigate to the nearest wall and rotate to any random drection (Left/Right)
4. Follow the wall smoothly
5. When a tele-op interrupt is observed, pause the wall-following and start again

### Team

>Deepak Reddy(Team Lead)

>Sam Kysar

>Om Kukunuru


## Working of Project

A launch file ***lab2.launch*** is created which initializes the world ***lab2_jackal.world***, the wall following python file ***laser_scan.py*** and the jackal's movement control file ***twistBuffer.py***

To run the launch file:
***roslaunch lab2_pkg lab2.launch config:=front_laser***

When the launch file is launched, the gazebo brings up the world and  jackal is launched. Along with this, jackal navigates to the nearest wall and rotates perpendicular to the wall and starts following it. For the navigation, the jackal uses the laser scan data (range and angle). To control the jackal's movement, tele-op's functionality is modified

To interrupt the navigation:
***rosrun lab2_pkg key_publisher.py***

A file ***key_publisher.py*** is executed to pause the navigation of jackal. Once the navigation is paused for 10secs,the jackal automatically approaches the nearest wall and continues navigation. In the mean time, the jackal can be moved to elsewhere if required using the w,a,s,d,x keys.

## Working of the control loop

In order to filter out the impulse drives to the motors a simple moving average filter was implemented. This can be seen in the below rqt graph which shows the location of the teleop impulse filter block from running an rqt_graph in ROS. This shows the topics being published and who is the subscriber. The laser_based_control block is the main drive which takes in key input as well as laser input and passes on it's data to command the Jackal's velocity. The data is published as a Twist message and then filtered and passed out as a Twist message. This helps to avoid sudden jarring moves when tele-operating the Jackal.

![lab2_filter_graph.png](https://bitbucket.org/repo/EgRrjj8/images/1425464555-lab2_filter_graph.png)

The filter block was built by creating an array of zeros which has 15 indexes each new input from laser control is appended while the last one is popped. All are then summed and then divided by 15. The main reason for implementing the mid message filtering was that initially loops were tried but the computation and complexity quickly adds to the main control algorithm so it was thought best to implement a filter on the message data abstracting it away from the control. Also from past experience with this type of filter it was thought to be a good idea as it is just a basic FIR filter.


The results are present in the ***ScreenGrabs*** folder. A *video* and an *rqt graph* is displayed.
