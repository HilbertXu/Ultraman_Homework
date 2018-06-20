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

const std::string PUBLISH_RET_TOPIC_NAME = "/take_photo";
const std::string RECEIVE_IMG_TOPIC_NAME = "/camera/rgb/image_raw";

//订阅传感器话题以获取图像信息
image_transport::Subscriber img_sub;
ros::Subscriber nav_sub;
ros::Publisher gPublisher;
ros::Subscriber room_name;


string name;
bool nav_flag=false;
int count1=0;

void navCallback(const std_msgs::String::ConstPtr& msg)
{
	if(msg->data == "arrived")
	{
		nav_flag = true;
	}
}
void nameCallback(const std_msgs::String::ConstPtr& msg)
{
	name=msg->data;
}

void imgCallback(const sensor_msgs::ImageConstPtr& msg)
{
	if(nav_flag == true)
	{
		count1++;
		cout<<name;
	  	ROS_INFO("IMAGE RECEIVED");
	  	std_msgs::String info;
	  	std::stringstream ss;
	  	ss<<"saved";
	  	info.data = ss.str();
	  	cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
	  	cv::Mat img = cv_ptr->image;
	  	cv::imwrite("/home/kamerider/catkin_ws/src/machine_vision/"+name+".jpg", img);
	  	cv::namedWindow("ROOM_IMAGE",CV_WINDOW_AUTOSIZE);
	  	cv::imshow("ROOM_IMAGE",img);
	  	if(count1==10)
	  	{
			cout<<count1;
			nav_sub.shutdown();
			img_sub.shutdown();
			gPublisher.publish(info);
	  	}
	}
}

int main(int argc, char **argv)

{

	//以下是ros部分
	ros::init(argc, argv, "take_photo");
	ROS_INFO("----------INIT----------");
	
	ros::NodeHandle nh;
	nav_sub = nh.subscribe("/nav2img",1,navCallback);
	gPublisher = nh.advertise<std_msgs::String>(PUBLISH_RET_TOPIC_NAME, 1);
	room_name=nh.subscribe("/room_name",1,nameCallback);


	image_transport::ImageTransport it(nh);
	img_sub = it.subscribe(RECEIVE_IMG_TOPIC_NAME,1 , imgCallback);
	
	ros::spin();
	return 0;
}
