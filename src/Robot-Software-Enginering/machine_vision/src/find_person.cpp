//OPENCV相关头文件
#include<opencv2/opencv.hpp>
#include<opencv2/core/core.hpp>
#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include<fstream>
#include<string>
#include<iostream>
#include<stdio.h>
#include<sstream>
#include<math.h>

//ROS相关头文件
#include<ros/ros.h>
#include<ros/package.h>
#include<std_msgs/String.h>
#include<image_transport/image_transport.h>
#include<sensor_msgs/image_encodings.h>
#include<geometry_msgs/Twist.h>
#include<cv_bridge/cv_bridge.h>

using namespace cv;
using namespace std;

//TOPIC NAME
bool flag = false;
const std::string RECEIVE_IMG_TOPIC_NAME="/usb_cam/image_raw";
string face_cascade_name = "/home/kamerider/catkin_ws/src/machine_vision/haarcascade_frontalface_alt.xml";
std_msgs::String voice_flag;
std_msgs::String vision_flag;

CascadeClassifier face_cascade;

ros::Subscriber nav_sub;
image_transport::Subscriber img_sub;
ros::Publisher sp_pub;
ros::Publisher nav_pub;
std::vector<Rect> faces;

void navCallback(const std_msgs::String::ConstPtr& msg)
{
	if(msg->data == "in_position")
	{
		flag = true;
	}
}


void imgCallback(const sensor_msgs::ImageConstPtr& msg)
{
	if(flag == true)
	{
		ROS_INFO("IMAGE_RECEIVED");
		cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
		cv::Mat img = cv_ptr->image;
		if(!face_cascade.load(face_cascade_name));
		{
			ROS_INFO("[OPENCV ERROR] Cannot load CLASSIFIER!\n");
		}	


		cv::Mat frame_gray;
		cvtColor(img,frame_gray,CV_BGR2GRAY);
		equalizeHist(frame_gray,frame_gray);
		face_cascade.detectMultiScale(frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
		if(faces.size()!=0)
		{
			voice_flag.data="found_person";
			sp_pub.publish(voice_flag);
			sleep(4);
			vision_flag.data="found_person";
			nav_pub.publish(vision_flag);
			sleep(3);
			cv::Mat res;
			for(int i=0;i<faces.size();i++)
			{
				Point rec1(faces[i].x,faces[i].y);
				Point rec2(faces[i].x+faces[i].width,faces[i].y+faces[i].height);
				res = img(Range(faces[i].y-50,faces[i].y + faces[i].height+50), Range(faces[i].x-50,faces[i].x + faces[i].width+50));
			}
			imwrite("/home/kamerider/catkin_ws/src/machine_vision/find_person.jpg",res);
			
			vision_flag.data="found_person";
			nav_pub.publish(vision_flag);
			sleep(3);
		}
	}
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "face_detection");
	ROS_INFO("----------INIT----------");

	ros::NodeHandle nh;
	nav_sub = nh.subscribe("/nav2img",1,navCallback);
	sp_pub = nh.advertise<std_msgs::String>("/img2sp",1);
	nav_pub = nh.advertise<std_msgs::String>("/img2nav",1);

	image_transport::ImageTransport it(nh);
	img_sub = it.subscribe(RECEIVE_IMG_TOPIC_NAME,1,imgCallback);
	ros::spin();
	return 0;
}
