#!/usr/bin/env python

import rospy
import random
import sys
from geometry_msgs.msg import Twist
from lab2_pkg.msg import rawTwist #custom message same format as Twist
from sensor_msgs.msg import LaserScan
import time
import math
from datetime import datetime
from std_msgs.msg import String

#------------------------------------------#
# Variables which can be modified later    #
# these hold the time to wait from teleop  #
# and distance to stay away from wall.     #
#------------------------------------------#
delayT = 2.0   #in seconds
distanceD = 1 # in meters

#Initial global variables
findWall = True #To make sure we find the closest wall first
currentTime = time.time()

#mapping of keys to velocity data
key_mapping = { 'w': [ 0, 1], 'x': [0, -1], 
                'a': [1, 0], 'd': [-1,  0], 
                's': [ 0, 0] }
g_last_twist = None 

#Function which takes in the laserScan message 
def scan_callback(msg):
	global min_range
	global max_range
	global complete_range
	global index
        global angle
        global rangeSize
        complete_range = msg.ranges
        rangeSize = len(complete_range)
        min_range = min(complete_range)
	max_range = max(complete_range)
	index = complete_range.index(min_range)
	angle = msg.angle_min + (msg.angle_increment*index)


#Function which will stop the wall following code
def key_callback(msg,twist_pub):
    #referencing global variables
    global currentTime
    global findWall
    global g_last_twist
    currentTime = time.time()
    findWall = True
    #Now check if the keypress was valid..
    if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
        return # unknown key.
    #act upon keypress...
    vels = key_mapping[msg.data[0]]
    g_last_twist.angular.z = vels[0]
    g_last_twist.linear.x  = vels[1]
    twist_pub.publish(g_last_twist)

#Control loop first finds closest wall, then drives to it
def control_loop(twist):
    global findWall #referencing global variable
    if time.time() > (currentTime + delayT) and findWall:
        findWall = False
        #Now to find the closest wall, take complete_range and
        #We have the index of the min, let's rotate and check blindspot
        if index > (rangeSize/2 - 1):
            #publish data to rotate at least Pi/2 but no more than 135*
            #rotate anti-clockwise
            while True:
                print "To dah' left"
                twist.linear.x = 0.0
                twist.angular.z = 3.0
                break
        else:
            #publish data to rotate at least Pi/2 but no more than 135*
            #rotate clockwise
             while True:
                twist.linear.x = 0.0
                twist.angular.z = -3.0
                print "To dah' right"
                break 
    return twist       


if __name__ == "__main__":

    try:
        #Callbacks are in
        #initiate node with name rand
        rospy.init_node("rand")
        #Subscibe to the laserScan messages
        rospy.Subscriber('/front/scan', LaserScan, scan_callback)
        #We want to publish to the velocity command so that we can command it 
        twist_pub = rospy.Publisher('rawTwist', Twist, queue_size=1)
        #We also want to subscribe to the Twist topics so if teleop is running we freeze
        rospy.Subscriber('keys', String, key_callback, twist_pub)
        currentTime = time.time()
        rate = rospy.Rate(10)#publish data to twist at 10 Hz
        lasermsg = LaserScan()
        g_last_twist = Twist()
        twist        = Twist()
        while not rospy.is_shutdown():
	    twist = control_loop(twist)
            if time.time() > (currentTime + delayT):
                twist_pub.publish(twist)
            rate.sleep()
            # print(max(LaserScan.ranges))
    except rospy.ROSInterruptException:
        pass

