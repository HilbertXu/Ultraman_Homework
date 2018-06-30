#!/usr/bin/env python
# -*- coding: utf-8 -*-
from wxpy import *
#ROS相关
import roslib
import rospy
import matplotlib.pyplot as plt 
from std_msgs.msg import String 
from std_msgs.msg import Int8



class send_wechat:
    def __init__(self):
        self.bot = Bot(cache_path=True)
        self.friend = ensure_one(self.bot.search(u'马艨'))
        self.sp_sub = rospy.Subscriber('/voice2email',String,self.spCallback)
    
    def spCallback(self,msg):

        if msg.data == 'send':
            self.friend.send("Warning!!!Warning!!!Someone has invaded your room")  
            self.friend.send_image('/home/kamerider/catkin_ws/src/machine_vision/bedroom.jpg')
        

if __name__=="__main__":
    rospy.init_node('send_wechat')
    send_wechat()
    rospy.spin()