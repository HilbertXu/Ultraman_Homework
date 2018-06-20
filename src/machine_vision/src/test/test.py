#!/usr/bin/env python
#-*- coding: utf-8 -*-

import cv2
import sys
import gc
from face_keras import Model

import roslib
import rospy
from std_msgs.msg import String 
from std_msgs.msg import Int8
from sensor_msgs.msg import Image, CameraInfo
from cv_bridge import CvBridge, CvBridgeError
import numpy as np 


SENSOR_TOPIC = '/camera/rgb/image_raw'
#人脸识别分类器本地存储路径
cascade_path = "/home/kamerider/catkin_ws/src/machine_vision/haarcascade_frontalface_alt.xml"    

#框住人脸的矩形边框颜色       
color = (0, 255, 0)

test = cv2.imread('/home/kamerider/catkin_ws/src/machine_vision/DataBase/HOST/1.jpg')
#加载模型
model = Model()
model.load_model() 
y = model.face_predict(test)  

#加载cv_bridge
bridge=CvBridge() 
    


def predict(frame):    
    #循环检测识别人脸
    while True:
        #图像灰化，降低计算复杂度
        frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        #使用人脸识别分类器，读入分类器
        cascade = cv2.CascadeClassifier(cascade_path)                

        #利用分类器识别出哪个区域为人脸
        faceRects = cascade.detectMultiScale(frame_gray, scaleFactor = 1.1, minNeighbors = 3, minSize = (32, 32)) 
	print type(frame)  
        count1=0     
        if len(faceRects) > 0:                 
            for faceRect in faceRects: 
                x, y, w, h = faceRect
                
                #截取脸部图像提交给模型识别这是谁
                image = frame[y - 20: y + h + 20, x - 20: x + w + 20]
		cv2.imshow('predict',image)
                faceID = model.face_predict(image)   
                
                #如果是“我”
                if faceID == 0:                                                        
                    cv2.rectangle(frame, (x - 10, y - 10), (x + w + 10, y + h + 10), color, thickness = 2)
		    print faceID
                    
                    #文字提示是谁
                    cv2.putText(frame,'TOM', 
                                (x + 30, y + 30),                      #坐标
                                cv2.FONT_HERSHEY_SIMPLEX,              #字体
                                1,                                     #字号
                                (255,0,255),                           #颜色
                                2)                                     #字的线宽
		    if count1 == 0:
	                count1=1
			cv2.imwrite('/home/kamerider/catkin_ws/test.jpg',frame)                
		if faceID == 1:
		    cv2.rectangle(frame, (x - 10, y - 10), (x + w + 10, y + h + 10), color, thickness = 2)
		    cv2.putText(frame,'HOST', 
                                (x + 30, y + 30),                      #坐标
                                cv2.FONT_HERSHEY_SIMPLEX,              #字体
                                1,                                     #字号
                                (255,0,255),                           #颜色
                                2)                                     #字的线宽
		else:
		    pass                    
                            
        cv2.imshow("test", frame)
        
        #等待10毫秒看是否有按键输入
        k = cv2.waitKey(10)
        #如果输入q则退出循环
        if k & 0xFF == ord('q'):
            break

    #释放摄像头并销毁所有窗口
    cap.release()
    cv2.destroyAllWindows()
          

def imageCallback(msg):
    try:
        frame = bridge.imgmsg_to_cv2(msg, "bgr8")
    except CvBridgeError, e:
        print e
        
    # Convert the image to a Numpy array since most cv2 functions 
    # require Numpy arrays.
    frame = np.array(frame, dtype=np.uint8)
    predict(frame)




if __name__ == '__main__':
    rospy.init_node('test')
    print '----------INIT----------'
    
    
    
    img_sub = rospy.Subscriber("/camera/rgb/image_raw",Image,imageCallback)
    #捕获指定摄像头的实时视频流
    #cap = cv2.VideoCapture(int(sys.argv[1]))
    rospy.spin()


    
