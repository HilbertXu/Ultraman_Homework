#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    navigation.py - Say back what is heard by the pocketsphinx recognizer.
"""
import roslib; roslib.load_manifest('speech')
import rospy
import re
import os

from std_msgs.msg import String
from std_msgs.msg import Int8
import time
from sound_play.libsoundplay import SoundClient
class img:
    def __init__(self):
        rospy.on_shutdown(self.cleanup)
        self.voice = rospy.get_param("~voice", "voice_cmu_us_clb_arctic_clunits")
        self.soundhandle=SoundClient()
        rospy.sleep(2)
        self.email_pub = rospy.Publisher('/voice2email', String, queue_size=1)
        self.loc_pub = rospy.Publisher('/speech2nav', String, queue_size=1)
        self.cam_pub = rospy.Publisher('/voice2cam', String, queue_size=1)
        self.img_pub = rospy.Publisher('/speech2img',String,queue_size=1)

        self.guest_name = rospy.Publisher('/guest_name',String,queue_size=1)
        self.soundhandle.stopAll()
        self.soundhandle.say("ready",self.voice)
        self.if_heard=0
        self.if_dect=0
        rospy.Subscriber('/nav2sp',String,self.navcallback)
        rospy.Subscriber('say',String, self.img2speech)
        self.img_sub = rospy.Subscriber('/img2sp',String, self.imgCallback)
        rospy.Subscriber('recognizer_output',String,self.follow)
        rospy.Subscriber('/camera2speech',String,self.camcallback)
    def imgCallback(self,msg):
        if msg.data == "found_person":
            self.soundhandle.say("i have found TOM",self.voice)
            rospy.sleep(3)
            self.soundhandle.say("Now i start to guide him to the entrance",self.voice)
            rospy.sleep(5)

    def camcallback(self,msg):
        msg.data=msg.data.lower()
        if msg.data=="done":
            self.soundhandle.say("i will take photos to the master",self.voice)
            self.loc_pub.publish("return")
            rospy.sleep(1)

    def follow(self,msg):
    	msg.data=msg.data.lower()
        if msg.data.find('jack') > -1 and self.if_dect == 0:
            if msg.data.find('patrol') > -1 and self.if_dect ==0 :
                self.soundhandle.say("ok i will start patrol and check out every room",self.voice)
                self.loc_pub.publish("starting_patrolling")
                rospy.sleep(4)
                msg.data=''

            if msg.data.find('fire') > -1 and self.if_dect ==0 :
                self.soundhandle.say('we are on fire',self.voice)
                rospy.sleep(2)
                if msg.data.find('living') > -1 and self.if_dect ==0 :
                    self.soundhandle.say("i will go to the living room and guide tom",self.voice)
                    self.loc_pub.publish("go to the living room")
                    rospy.sleep(4)
                    msg.data=''

                if msg.data.find('bedroom') > -1 and self.if_dect ==0 :
                    self.soundhandle.say("i will go to the bedroom and guide tom",self.voice)
                    self.loc_pub.publish("go to the bedroom")
                    rospy.sleep(4)
                    msg.data=''

                if msg.data.find('kitchen') > -1 and self.if_dect ==0 :
                    self.soundhandle.say("i will go to the kitchen and guide tom",self.voice)
                    self.loc_pub.publish("go to the kitchen")
                    rospy.sleep(4)
                    msg.data=''    
                    #os.system("/home/kamerider/catkin_ws/src/speech/kill_pocketsphinx.sh")
                

            if msg.data.find('guest') > -1 and self.if_dect ==0 :
                self.soundhandle.say("welcome tom", self.voice)
                rospy.sleep(2)
                self.soundhandle.say("have a good time",self.voice)
                rospy.sleep(2)
                self.soundhandle.say("Please look at me and smile",self.voice)
                rospy.sleep(3)
                self.soundhandle.say("i will take a photo to remember you",self.voice)
                self.guest_name.publish("TOM")
                msg.data=''

            if msg.data.find('stop') > -1 and self.if_dect ==0 :
                self.soundhandle.say("ok I will go back to the enterance",self.voice)
                self.loc_pub.publish("end")
                rospy.sleep(3)
                msg.data=''

            if msg.data.find('living room') > -1 and self.if_dect ==0 :
                self.soundhandle.say("i will go checking the living room",self.voice)
                self.loc_pub.publish("go to the living room")
                rospy.sleep(4)
                msg.data=''

            if msg.data.find('kitchen') > -1 and self.if_dect ==0 :
                self.soundhandle.say("i will go checking the kitchen",self.voice)
                self.loc_pub.publish("go to the kitchen")
                rospy.sleep(7)
                msg.data=''

            if msg.data.find('entrance') > -1 and self.if_dect ==0 :
                self.soundhandle.say("i will go checking the entrance",self.voice)
                self.loc_pub.publish("go to the entrance")
                rospy.sleep(8)
                msg.data=''

            if msg.data.find('bedroom') > -1 and self.if_dect ==0 :
                self.soundhandle.say("i will go checking the bedroom",self.voice)
                self.loc_pub.publish("go to the bedroom")
                rospy.sleep(9)
                msg.data=''


    def navcallback(self,msg):
        msg.data=msg.data.lower()
        if msg.data=="returned":
            self.soundhandle.say("i am back. here are the photos",self.voice)
            rospy.sleep(4)

        

        
        if msg.data=="arrived living room":
            self.soundhandle.say("i am checking the living room",self.voice)
            rospy.sleep(4)

        if msg.data=="takepics living room":
            self.soundhandle.say("i am taking photos of the living,please wait a minute",self.voice)
            rospy.sleep(7)
            self.soundhandle.say('i am going to the kitchen',self.voice)
            rospy.sleep(3)

        
        if msg.data=="arrived kitchen":
            self.soundhandle.say("i am checking the kitchen",self.voice)
            rospy.sleep(4)

        if msg.data=="takepics kitchen":
            self.soundhandle.say("i am taking photos of the kitchen,please wait a minute",self.voice)
            rospy.sleep(7)
            self.soundhandle.say('i am going to the bedroom',self.voice)
            rospy.sleep(3)

        if msg.data=="arrived entrance":
            self.soundhandle.say('i am checking the entrance',self.voice)
            rospy.sleep(4)

        if msg.data=="takepics entrance":
            self.soundhandle.say('i am taking photos of the entrance,please wait a minute',self.voice)
            rospy.sleep(7)
            self.soundhandle.say('i am going to the living room',self.voice)
            rospy.sleep(3)

        if msg.data=="arrived bedroom":
            self.soundhandle.say('i am checking the bed room',self.voice)
            rospy.sleep(4)

        if msg.data=="takepics bedroom":
            self.soundhandle.say('i am taking photos of the bed room,please wait a minute',self.voice)
            rospy.sleep(7)

        if msg.data=="start_find":
            self.soundhandle.say('i start to find TOM',self.voice)
            rospy.sleep(5)


        if msg.data=="warning":
            self.soundhandle.say('warning warning please leave this room right now',self.voice)
            rospy.sleep(5)
            self.soundhandle.say('or i will call the police',self.voice)
            rospy.sleep(2)
            self.email_pub.publish('send')

        if msg.data=="exit":
            self.soundhandle.say('you are safe now,please keep away from the house',self.voice) 
            rospy.sleep(4)
            self.soundhandle.say('i will go back to check if there is anyone left in the house',self.voice)                       
            self.speech2nav_pub.publish('end')

        if msg.data=="end":
            self.soundhandle.say('task finished',self.voice)
            rospy.sleep(1)


    def img2speech(self,msg):
        print 1111111
        self.if_followme =0
        msg.data=msg.data.lower()
        print msg.data
        
        if self.if_followme ==0:
            print msg.data

        if msg.data=="find_people_in_accident": 
            self.soundhandle.say("please follow me to the entrance",self.voice)
            rospy.sleep(10)
            self.loc_pub.publish('go to the entrance')
                
      
        if msg.data=="find_guests":
            self.soundhandle.say("i want to take a picture of you",self.voice) 
            rospy.sleep(0.5)
            self.soundhandle.say("please wait a minute",self.voice)    
            self.cam_pub.publish("take_photos")                   
            rospy.sleep(11)

        if msg.data=="find_people_invade":
            self.soundhandle.say("found someone invade the house",self.voice)
            rospy.sleep(0.5)
            self.soundehandle.say("sending messages to the master")
            self.email_pub.publish("invade")
            rospy.sleep(12)

    def cleanup(self):
        rospy.loginfo("shuting down navsp node ....")

if __name__=="__main__":
    rospy.init_node('BigHomeWork')
    try:
        img()
        rospy.spin()
    except:
        pass





