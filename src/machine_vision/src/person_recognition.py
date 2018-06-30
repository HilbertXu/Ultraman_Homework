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
SENSOR_TOPIC = '/usb_cam/image_raw'
cascade_path = '/home/kamerider/catkin_ws/src/machine_vision/haarcascade_frontalface_alt.xml'
IMAGE_SAVE_PATH = '/home/kamerider/catkin_ws/src/machine_vision/result.jpg'

INIT_IMG = cv2.imread('/home/kamerider/catkin_ws/src/machine_vision/DataBase/HOST/1.jpg')


class Recognition:
    def __init__(self):
        print 'loading model'
        #加载训练好的模型
        self.model = Model()
        self.model.load_model()
	self.temp = self.model.face_predict(INIT_IMG)
        
        #框的颜色
        self.color = (0,0,255)

        #加载cv_bridge
        self.bridge = CvBridge()

        #订阅传感器话题的订阅器 
        self.img_sub = rospy.Subscriber("/usb_cam/image_raw",Image,self.imageCallback)
        #向语音节点发布消息的发布器
        self.sp_pub = rospy.Publisher('/img2speech',String,queue_size=1)
        rospy.loginfo("Waiting for image topics...")


    def imageCallback(self,msg):
        print 'Image Received Start to find Person'
        #首先将ros类型的图像信息转换成opencv支持的类型
        try:
            frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except CvBridgeError, e:
            print e
        
        # Convert the image to a Numpy array since most cv2 functions 
        # require Numpy arrays.
        frame = np.array(frame, dtype=np.uint8)
        
        #person_recognition_with_model
        self.person_recognition(frame)

    def person_recognition(self,frame):
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

                #如果识别到JACK
                #如果是“我”
                if faceID == 0:                                                        
                    cv2.rectangle(frame, (x - 10, y - 10), (x + w + 10, y + h + 10), self.color, thickness = 2)
		    print faceID
                    
                    #文字提示是谁
                    cv2.putText(frame,'TOM', 
                                (x + 30, y + 30),                      #坐标
                                cv2.FONT_HERSHEY_SIMPLEX,              #字体
                                1,                                     #字号
                                (255,0,255),                           #颜色
                                2)                                     #字的线宽
		    if ifFirst == 0:
	                ifFirst=1
			cv2.imwrite('/home/kamerider/catkin_ws/test.jpg',frame)                
		if faceID == 1:
		    cv2.rectangle(frame, (x - 10, y - 10), (x + w + 10, y + h + 10), self.color, thickness = 2)
		    cv2.putText(frame,'HOST', 
                                (x + 30, y + 30),                      #坐标
                                cv2.FONT_HERSHEY_SIMPLEX,              #字体
                                1,                                     #字号
                                (255,0,255),                           #颜色
                                2)                                     #字的线宽
		else:
		    print 'Stranger'    
        if count==0:
            self.sp_pub.publish('NOT_FOUND')

        cv2.imshow("FIND_PERSON",frame)
        cv2.waitKey(10)



if __name__ == '__main__':
    #INIT NODE
    rospy.init_node('person_recognition')
    print '----------INIT----------'
    Recognition()
    rospy.spin()




















