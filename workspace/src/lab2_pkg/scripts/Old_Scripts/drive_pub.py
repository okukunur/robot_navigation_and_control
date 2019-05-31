#!/usr/bin/env python
# license removed for brevity
# Python Script to drive Jackal, publishes to command velocity topic

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
import curses

#Since the max velocity of the Jackal is 2.0 m/s
#we limit the linear magnitude to 2.0 angular to 3.0
def speedLimits(x,z):
    if x > 2.0:
       x = 2.0
    elif x < -2.0:
        x = -2.0

    if z > 3.0:
        z = 3.0
    elif z < -3.0:
        z = -3.0
    return x,z

def vel_commander():
    #Keyblock, adapted from codehaven.co.uk
    #get the curses screen window
    screen = curses.initscr()
    #turn of input echo
    curses.noecho()
    #don't wait for enter keypress
    curses.cbreak()
    #special values for arrows
    screen.keypad(True)
    #No delay, nonblocking    
    screen.nodelay(True)

    #variables to hold local twist values
    localz = 0.0 #zero angular velocity initially
    localx = 0.0 #zero linear velocity initally
    screen.addstr("Use the arrow keys to navigate with the robot\n q or ctrl c to quit\n")

    try:
        #creating twist message
        twist = Twist()
        pub = rospy.Publisher('/jackal_velocity_controller/cmd_vel', Twist, queue_size=10)
        rospy.init_node('vel_driver', anonymous=True)
        rate = rospy.Rate(10) # refreshes at 5hz
        decelRate = rospy.Rate(50)
        while not rospy.is_shutdown():
            #Checking for a keypress to get the speed
            char = screen.getch()
            if char == ord('q'):
                break
            elif char == curses.KEY_RIGHT:
                localz = localz - 0.2 # 0.1 increase
            elif char == curses.KEY_LEFT:
                localz = localz + 0.2
            elif char == curses.KEY_UP:
                localx = localx + 0.2
            elif char == curses.KEY_DOWN:
                localx = localx - 0.2
            else:
                #If no key is pressed we want to decel the robot
                while localz > 0:
                    localz = localz - 0.1
                    twist.angular.z = localz
                    pub.publish(twist)
                    decelRate.sleep()
                while localz < 0:
                    localz = localz + 0.1
                    twist.angular.z = localz
                    pub.publish(twist)
                    decelRate.sleep()

                while localx > 0:
                    localx = localx - 0.1
                    twist.linear.x = localx
                    pub.publish(twist)
                    decelRate.sleep()
                while localx < 0:
                    localx = localx + 0.1
                    twist.linear.x = localx
                    pub.publish(twist)
                    decelRate.sleep()
                localx = 0.0
                localz = 0.0

            #limiting velocity of linear and angular
            localx,localz = speedLimits(localx,localz)
            
            #writing the speeds to our message
            twist.linear.x = localx
            twist.angular.z = localz
            #rospy.loginfo(twist)
            pub.publish(twist)
            #if a key was held down, clear the buffer
            char = screen.getch()
            while char > 0:
                char = screen.getch()
            rate.sleep()
            

    finally:
        curses.nocbreak(); screen.keypad(0);curses.echo(); curses.endwin()


if __name__ == '__main__':
    try:
        vel_commander()
    except rospy.ROSInterruptException:
        pass
