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
		self.email_pub = rospy.Publisher('/voice2email', String, queue_size=15)
		self.loc_pub = rospy.Publisher('/speech2nav', String, queue_size=15)
		self.cam_pub = rospy.Publisher('/voice2cam', String, queue_size=15)
		self.soundhandle.stopAll()
		self.soundhandle.say("ready",self.voice)
		self.if_heard=0
		self.if_dect=0
                rospy.Subscriber('/nav2speech',String, self.navcallback)
                rospy.Subscriber('say',String, self.img2speech)
		rospy.Subscriber('recognizer_output',String,self.follow)
		rospy.Subscriber('/camera2speech',String,self.camcallback)

	def camcallback(self,msg):
		msg.data=msg.data.lower()
		if msg.data=="done":
			self.soundhandle.say("i will take photos to the master",self.voice)
			self.loc_pub.publish("return")
			rospy.sleep(1)

	def follow(self,msg):
		msg.data=msg.data.lower()
		if msg.data.find('dawson') > -1 and self.if_dect == 0:
			if msg.data.find('good') > -1 and self.if_dect ==0 :
				self.soundhandle.say("ok i will start patrol",self.voice)
				self.loc_pub.publish("starting_patrolling")
				rospy.sleep(3)
				msg.data=''

			if msg.data.find('fire') > -1 and self.if_dect ==0 :
				self.loc_pub.publish('start')
				self.soundhandle.say('on fire',self.voice)
				rospy.sleep(1.5)
				self.soundhandle.say('i will help guests leave the house',self.voice)
				self.loc_pub.publish("start")
				self.if_dect=1	
				os.system("/home/kamerider/catkin_ws/src/speech/kill_pocketsphinx.sh")
				msg.data=''
			if msg.data.find('welcome') > -1 and self.if_dect ==0 :
				self.soundhandle.say("welcome", self.voice)
				rospy.sleep(0.5)
				self.soundhandle.say("have a good time",self.voice)
				rospy.sleep(1)
				msg.data=''
			if msg.data.find('goodbye') > -1 and self.if_dect ==0 :
				self.soundhandle.say("ok bye I will check the house around",self.voice)
				self.loc_pub.publish("start")
				rospy.sleep(2)
				msg.data=''
			if msg.data.find('today') > -1 and self.if_dect ==0 :
				self.soundhandle.say("it is a peaceful day",self.voice)
				rospy.sleep(3)
				msg.data=''
			if msg.data.find('living room') > -1 and self.if_dect ==0 :
				self.soundhandle.say("i will go checking the living room",self.voice)
				self.loc_pub.publish("go to the living room")
				rospy.sleep(4)
				msg.data=''
			if msg.data.find('dining table') > -1 and self.if_dect ==0 :
				self.soundhandle.say("i will go checking the dining table",self.voice)
				self.loc_pub.publish("go to the dining table")
				rospy.sleep(5)
				msg.data=''
			if msg.data.find('baby room') > -1 and self.if_dect ==0 :
				self.soundhandle.say("i will go checking the baby room",self.voice)
				self.loc_pub.publish("go to the baby room")
				rospy.sleep(6)
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
			if msg.data.find('study room') > -1 and self.if_dect ==0 :
				self.soundhandle.say("i will go checking the study room",self.voice)
				self.loc_pub.publish("go to the study room")
				rospy.sleep(10)
				msg.data=''

			#if msg.data.find('dawson') > -1 and self.if_dect ==0 :
				#self.soundhandle.say("let me check out for you",self.voice)
				#self.loc_pub.publish("start")
				#rospy.sleep(5)
			if msg.data.find('guest') > -1 and self.if_dect ==0 :
				self.soundhandle.say("let me check out for you",self.voice)
				self.loc_pub.publish("start")
				rospy.sleep(5)
				msg.data=''

	def navcallback(self,msg):
		msg.data=msg.data.lower()
		if msg.data=="returned":
			self.soundhandle.say("i am back. here are the photos",self.voice)
			rospy.sleep(4)
		if msg.data=="arrived dining table":
			self.soundhandle.say("i am checking the dining table",self.voice)             
  			rospy.sleep(4)
		if msg.data=="takepics dining table":
			self.soundhandle.say("i am taking photos of the dining table,please wait a minute",self.voice)
  			rospy.sleep(4)
		if msg.data=="arrived living room":
			self.soundhandle.say("i am checking the living room",self.voice)
			rospy.sleep(5)
		if msg.data=="takepics living room":
			self.soundhandle.say("i am taking photos of the living,please wait a minute",self.voice)
  			rospy.sleep(5)
		if msg.data=="arrived baby room":
			self.soundhandle.say("i am checking the baby room",self.voice)
			rospy.sleep(6)
		if msg.data=="takepics baby room":
			self.soundhandle.say("i am taking photos of the baby room,please wait a minute",self.voice)
  			rospy.sleep(6)
		if msg.data=="arrived kitchen":
			self.soundhandle.say("i am checking the kichen",self.voice)
			rospy.sleep(7)
		if msg.data=="takepics kitchen":
			self.soundhandle.say("i am taking photos of the kitchen,please wait a minute",self.voice)
  			rospy.sleep(7)
		if msg.data=="arrived entrance":
			self.soundhandle.say('i am checking the entrance',self.voice)
			rospy.sleep(8)
		if msg.data=="takepics entrance":
			self.soundhandle.say('i am taking photos of the entrance,please wait a minute',self.voice)
  			rospy.sleep(8)
		if msg.data=="arrived bed room":
			self.soundhandle.say('i am checking the bed room',self.voice)
			rospy.sleep(9)
		if msg.data=="takepics bed room":
			self.soundhandle.say('i am taking photos of the bed room,please wait a minute',self.voice)
  			rospy.sleep(9)
		if msg.data=="arrived study room":
			self.soundhandle.say('i am checking the study room',self.voice)
			rospy.sleep(10)
		if msg.data=="takepics study room":
			self.soundhandle.say('i am taking photos of the study room,please wait a minute',self.voice)
  			rospy.sleep(10)

		if msg.data=="exit":
			self.soundhandle.say('you are safe now,please keep away from the house',self.voice) 
  			rospy.sleep(1)
			self.soundhandle.say('i will go back to check if there is anyone left in the house',self.voice)                       
  			self.speech2nav_pub.publish('start')
		if msg.data=="nobody_left":
			self.soundhandle.say('the house is clear',self.voice)
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
				
		if self.if_followme ==0:
 
			if msg.data=="find_guests":
				self.soundhandle.say("i want to take a picture of you",self.voice) 
				rospy.sleep(0.5)
				self.soundhandle.say("please wait a minute",self.voice)    
				self.cam_pub.publish("take_photos")                   
  				rospy.sleep(11)
				
                if self.if_followme ==0:

			if msg.data=="find_people_invade":
				self.soundhandle.say("found someone invade the house",self.voice)
				rospy.sleep(0.5)
				self.soundehandle.say("sending messages to the master")
				self.email_pub.publish("invade")
				rospy.sleep(12)

	def cleanup(self):
		rospy.loginfo("shuting down navsp node ....")

if __name__=="__main__":
	rospy.init_node('img')
	try:
		img()
		rospy.spin()
	except:
		pass





