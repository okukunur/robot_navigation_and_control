#!/usr/bin/env python

import rospy
import sys
import random
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from std_msgs.msg import String
import time
import math
from datetime import datetime
Pi = math.pi

#------------------------------------------#
# Variables which can be modified later    #
# these hold the time to wait from teleop  #
# and distance to stay away from wall.     #
#------------------------------------------#
delayT     = 10   # Time delay in seconds
distanceD  = 1.5  # Distance from wall in meters

#mapping of keys to velocity data
key_mapping = { 'w': [ 0, 1], 'x': [0, -1], 
                'a': [1, 0], 'd': [-1,  0], 
                's': [ 0, 0] }
g_last_twist = None 
#teleop = True
teleopTime = (delayT + time.time())
global angle
angle = 0
 
#list to hold random number, negative and positive are
#used for steering angles
items = [-1, 1]

#Function which takes in the laserScan message
def scan_callback(msg):
    global closest_range
    global maximum_range
    global complete_range
    global angle
    closest_range = min(msg.ranges)
    length = len(msg.ranges)
    complete_range = msg.ranges
    maximum_range = max(msg.ranges)
    index = msg.ranges.index(min(msg.ranges))
    angle = msg.angle_min + (msg.angle_increment*index)
    angle = angle*180/Pi


#Function which will stop the wall following code
def key_callback(msg,twist_pub):
    global teleop
    global teleopTime
    global g_last_twist
    #Now check if the keypress was valid..
    if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
        return # unknown key.
    teleop = True
    teleopTime = (delayT + time.time())
    #act upon keypress...
    vels = key_mapping[msg.data[0]]
    g_last_twist.angular.z = vels[0]
    g_last_twist.linear.x  = vels[1]
    twist_pub.publish(g_last_twist)
    return


if __name__ == "__main__":
    closest_range = 2.0
    complete_range = []
    global teleop
    global angle
    orientation = 1
    teleop = True
    try:
        #initiate node with name rand, It is overwritten in the launch file
	rospy.init_node("rand")
	#Subscribe to appropriate topics
	pub = rospy.Publisher('rawTwist', Twist, queue_size=1)
	rospy.Subscriber('/front/scan', LaserScan, scan_callback)
	rospy.Subscriber('keys', String, key_callback, pub)
	rate = rospy.Rate(10)
	twist = Twist()
	g_last_twist = Twist()

	while not rospy.is_shutdown():
	    #if a recent teleop occurred we need to find closest wall again
	    if teleop and (teleopTime < time.time() - 1):
	        g_last_twist.linear.x = 0.0
	        g_last_twist.angular.z = 0.0

            if teleop and teleopTime < time.time():
   	        #We start with zero after teleop has been dead for a time                				
	        if (closest_range > 1):
		    g_last_twist.angular.z = (angle)/150
		    g_last_twist.linear.x = 0.25
			
		elif (closest_range < distanceD):
                    print "Should be stoping......"
	    	    g_last_twist.linear.x = 0.0
		    g_last_twist.angular.z = 0.0
		    #we made it to the wall so set teleop to False
		    teleop = False
	            pub.publish(g_last_twist)
		    direction = random.random()*10   # Pick a random item from the list
                    print "Direction is ", direction
		    orientation = direction*(-1)	
		
            #if setup is done and we are near a wall we can now follow it			
            if (not teleop) and (teleopTime < time.time()):
                if closest_range < distanceD:
                    angleOffset = (distanceD + closest_range)/(70*distanceD)
                elif closest_range > distanceD:
                    angleOffset = (-1)*(distanceD + closest_range)/(70*distanceD) 		
		
                if direction > 5: #Rotate right
		    if angle < 75: 
                        g_last_twist.angular.z = (angle - 90)/100 - angleOffset
		        g_last_twist.linear.x = 0.0
                    #If there is nothing right in front, drive fast!
                    elif (complete_range[359] > 2): 
                        g_last_twist.angular.z = (angle - 90)/200 - angleOffset
		        g_last_twist.linear.x = 0.5
                    else:
                        g_last_twist.angular.z = (angle - 90)/150 - angleOffset
		        g_last_twist.linear.x = 0.2
                else:#Rotate left
		    if angle > -75: 
                        g_last_twist.angular.z = (angle + 90)/100 + angleOffset
		        g_last_twist.linear.x = 0.0
                    #If there is nothing right in front, drive fast!
                    elif (complete_range[359] > 2): 
                        g_last_twist.angular.z = (angle + 90)/200 + angleOffset
		        g_last_twist.linear.x = 0.5
                    else:
                        g_last_twist.angular.z = (angle + 90)/150 + angleOffset
		        g_last_twist.linear.x = 0.2

	
            pub.publish(g_last_twist)
	    rate.sleep()					

    except rospy.ROSInterruptException:
	print "Exception caught...exiting"
        pass











