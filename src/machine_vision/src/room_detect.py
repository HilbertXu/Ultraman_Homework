#!/usr/bin/env python
#-*- coding: utf-8 -*-
import os 
import sys 
import gc 
import cv2
from face_keras import Model

import roslib
import rospy
from std_msgs.msg import String 
from std_msgs.msg import Int8
from sensor_msgs.msg import Image, CameraInfo
from cv_bridge import CvBridge, CvBridgeError
import numpy as np 

MODEL_PATH = '/home/kamerider/catkin_ws/src/machine_vision/model/keras_model.h5'
SENSOR_TOPIC = '/camera/rgb/image_raw'
cascade_path = '/home/kamerider/catkin_ws/src/machine_vision/haarcascade_frontalface_alt.xml'
IMAGE_SAVE_PATH = '/home/kamerider/catkin_ws/src/machine_vision/result.jpg'
IMAGE_PATH = '/home/kamerider/catkin_ws/src/machine_vision/'
INIT_IMG = cv2.imread('/home/kamerider/catkin_ws/src/machine_vision/DataBase/HOST/1.jpg')


class Detection:
    def __init__(self):
        print 'loading model'
        #加载训练好的模型
        self.model = Model()
        self.model.load_model()
        self.temp = self.model.face_predict(INIT_IMG)
        self.ROOM_NAME = 'NULL'
        
        #框的颜色
        self.color = (0,0,255)

        #加载cv_bridge
        self.flag = 0

        self.room_name = rospy.Subscriber("/room_name",String,self.nameCallback)
        #向语音节点发布消息的发布器
        self.sp_pub = rospy.Publisher('/img2speech',String,queue_size=1)
        self.nav_pub = rospy.Publisher('/img2nav',String,queue_size=1)
        self.photo_sub = rospy.Subscriber('/take_photo',String,self.photoCallback)


    def photoCallback(self,msg):
        if msg.data == 'saved':
            self.flag = 1
            print self.flag

    def nameCallback(self,msg):
        if self.flag == 1:
            self.ROOM_NAME = msg.data
            print self.ROOM_NAME
            if self.ROOM_NAME != 'NULL':
                frame = cv2.imread(IMAGE_PATH+self.ROOM_NAME+'.jpg')
                print IMAGE_PATH+self.ROOM_NAME+'.jpg'
            #person_recognition_with_model
            self.room_detect(frame)
            self.ROOM_NAME = 'NULL'

    def room_detect(self,frame):
        print 'Processing Image'
        #图像灰度化
        frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        #使用opencv的人脸分类器找出人脸，再用模型识别，加快识别速度
        cascade = cv2.CascadeClassifier(cascade_path)
        
        #使用分类器识别出人脸的部分
        faceRects = cascade.detectMultiScale(frame_gray, scaleFactor=1.2, minNeighbors = 3, minSize = (32,32))
        count = 0
        ifFirst = 0
        if len(faceRects)>0 :
            count=1
            for faceRect in faceRects:
                x, y, w, h = faceRect

                #截取脸部图像区域交给模型识别
                image = frame[y-20:y+h+20,x-20:x+w+20]
                print image.shape
                faceID = self.model.face_predict(image)

                #detect stranger
                if faceID == 3:                                                        
                    cv2.rectangle(frame, (x - 10, y - 10), (x + w + 10, y + h + 10), self.color, thickness = 2)
                    #文字提示是谁
                    cv2.putText(frame,'UNKNOWN', 
                                (x + 30, y + 30),                      #坐标
                                cv2.FONT_HERSHEY_SIMPLEX,              #字体
                                1,                                     #字号
                                (255,0,255),                           #颜色
                                2)                                     #字的线宽
                    print 'stranger'
                    self.sp_pub.publish('warning') 
                    print 'yaozonghaiSB'
                else:
                    self.nav_pub.publish('go_on')
        else:
            self.nav_pub.publish('go_on')
        cv2.imshow(self.ROOM_NAME,frame)
        cv2.waitKey(10)
if __name__ == '__main__':
    #INIT NODE
    rospy.init_node('room_detect')
    print '----------INIT----------'
    Detection()
    rospy.spin()




















