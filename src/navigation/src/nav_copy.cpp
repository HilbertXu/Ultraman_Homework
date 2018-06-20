//标准头文件
#include<ros/ros.h>
#include<iostream>
#include<std_msgs/String.h>
#include<string.h>
//navigation中需要使用的位姿信息头文件
#include<geometry_msgs/Pose.h>
#include<geometry_msgs/Point.h>
#include<geometry_msgs/PoseWithCovariance.h>
#include<geometry_msgs/PoseWithCovarianceStamped.h>
#include<geometry_msgs/Twist.h>
#include<geometry_msgs/Quaternion.h>
//move_base头文件
#include<move_base_msgs/MoveBaseGoal.h>
#include<move_base_msgs/MoveBaseAction.h>
//actionlib头文件
#include<actionlib/client/simple_action_client.h>
#include<stdlib.h>
#include<cstdlib>


using namespace std;


typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;//简化类型书写为MoveBaseClient

bool go = false;//是否在运动
bool ifGuide = false;//是否在引导人
bool ifPatrol = false;//是否在巡逻
bool isMiddlePoint = true;
geometry_msgs::Twist vel; //控制机器人速度
std_msgs::String sound_flag;
std_msgs::String vision_flag;

geometry_msgs::Pose goal_pose;//目标位置
geometry_mdgs::Pose now_pose;//当前位置


//定义不同房间的位置
geometry_msgs::Pose livingroom;
geometry_msgs::Pose kictchen;
geometry_msgs::Pose bedroom;
geometry_msgs::Pose entrance;
geometry_msgs::Pose balcony;
geometry_msgs::Pose start;
geometry_msgs::Pose door1;
geometry_msgs::Pose door2;
geometry_msgs::Pose door3;
geometry_msgs::Pose dining;


ros::Publisher voice_pub;//收到语音后向视觉发布消息开始寻人
ros::Publisher vision_pub;//到达门口后向语音发布消息


ros::Subscriber voice_sub;//向下一个点前进
ros::Subscriber vision_sub;    //收到语音消息后停止巡逻


void visionCallback(const std_msgs::String::ConstPtr& msg);
void voiceCallback(const std_msgs::String::ConstPtr& msg);


void initplace()
{
  start.position.x = 0;
  start.position.y = 0;
  start.position.z = 0;
  start.orientation.x = 0;
  start.orientation.y = 0;
  start.orientation.z = 0;
  start.orientation.w = 0;
  
  door1.position.x = 0;
  door1.position.y = 0;
  door1.position.z = 0;
  door1.orientation.x = 0;
  door1.orientation.y = 0;
  door1.orientation.z = 0;
  door1.orientation.w = 0;

  door2.position.x = 0;
  door2.position.y = 0;
  door2.position.z = 0;
  door2.orientation.x = 0;
  door2.orientation.y = 0;
  door2.orientation.z = 0;
  door2.orientation.w = 0;
//1
  door3.position.x = 0;
  door3.position.y = 0;
  door3.position.z = 0;
  door3.orientation.x = 0;
  door3.orientation.y = 0;
  door3.orientation.z = 0;
  door3.orientation.w = 0;
//2

  livingroom.position.x = 0;
  livingroom.position.y = 0;
  livingroom.position.z = 0;
  livingroom.orientation.x = 0;
  livingroom.orientation.y = 0;
  livingroom.orientation.z = 0;
  livingroom.orientation.w = 0;
  
  kitchen.position.x = 0;
  kitchen.position.y = 0;
  kitchen.position.z = 0;
  kitchen.orientation.x = 0;
  kitchen.orientation.y = 0;
  kitchen.orientation.z = 0;
  kitchen.orientation.w = 0;
//3
  bedroom.position.x = 0;
  bedroom.position.y = 0;
  bedroom.position.z = 0;
  bedroom.orientation.x = 0;
  bedroom.orientation.y = 0;
  bedroom.orientation.z = 0;
  bedroom.orientation.w = 0;

  entrance.position.x = 0;
  entrance.position.y = 0;
  entrance.position.z = 0;
  entrance.orientation.x = 0;
  entrance.orientation.y = 0;
  entrance.orientation.z = 0;
  entrance.orientation.w = 0;

  balcony.position.x = 0;
  balcony.position.y = 0;
  balcony.position.z = 0;
  balcony.orientation.x = 0;
  balcony.orientation.y = 0;
  balcony.orientation.z = 0;
  balcony.orientation.w = 0;
//4
  dining.position.x = 0;
  dining.position.y = 0;
  dining.position.z = 0;
  dining.orientation.x = 0;
  dining.orientation.y = 0;
  dining.orientation.z = 0;
  dining.orientation.w = 0;
}


//语音控制
void voiceCallback(const std_msgs::String::ConstPtr& msg)
{
  if(msg->data == "start finding")
	{
	  go = false;
	  ifPatrol = false;
	  vision_flag.data = "start finding";
	  vision_pub.publish(vision_flag);

	  cout<<"The robot has started finding people!";
	}
  if(msg->data == "starting patrolling")
    {
      go = true;
      ifPatrol = true;
      voice_flag.data = "starting patrolling!";
      voice_pub.publish(voice_flag);

      cout<<"The robot has started patrolling!";
    }
  if(msg->data == "go to the living room")
    {
      go = true;
      ifPatrol = false;
      goal_pose = livingroom;
    }
  if(msg->data == "go to the kitchen")
     {
       go = true;
       ifPatrol = false;
       goal_pose = kitchen;
     }
  if(msg->data == "go to the bedroom")
     {
       go = true;
       ifPatrol = false;
       goal_pose = bedroom;
     } 
  if(msg->data == "go to the entrance")
     {
       go = true;
       ifPatrol = false;
       goal_pose = entrance;
     } 
  if(msg->data == "go to the balcony")
     {
       go = true;
       ifPatrol = false;
       goal_pose = balcony;
     } 
  if(msg->data == "go to the start")
     {
       go = true;
       ifPatrol = false;
       goal_pose = start;
     } 
  if(msg->data == "go to the dining")
     {
       go = true;
       ifPatrol = false;
       goal_pose = dining;
     }  
}


//向下一个点继续前进
void visionCallback(const std_msgs::String::CosntPtr& msg)
{
  if(msg->data == "go on")
    {
      go = true;
      ifPatrol = true;
    }
  if(msg->data == "people finded")
    {
      go = false;
      ifPartol = false;
      ifGuide = true;
    }
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "navi_demo");
	ros::NodeHandle myNode;
	initplace();
	cout<<"Welcome to ultraman!"<<endl;


	voice_pub = myNode.advertise<std_msgs::String>("nav2sp",10);
	vision_pub = myNode.advertise<std_msgs::String>("nav2img",10);

	voice_sub = myNode.subscribe("sp2nav",1);
	vision_sub = myNode.subscribe("img2nav",1);

	MoveBaseClient  mc_("move_base", true); //建立导航客户端
	move_base_msgs::MoveBaseGoal naviGoal; //导航目标点

	while(ros::ok())
	{
		if(go == true)
		{
			if(ifPatrol == true)
			{
				if(now_pose==dining)
				{
					//第一个点
					ROS_INFO("****************************************");
					//naviGoal.target_pose.header.frame_id = "map"; 
					naviGoal.target_pose.header.frame_id = "map"; 
					naviGoal.target_pose.header.stamp = ros::Time::now();
					naviGoal.target_pose.pose = geometry_msgs::Pose(start);

					while(!mc_.waitForServer(ros::Duration(5.0)))
					{
						//等待服务初始化
						cout<<"Waiting for the server..."<<endl;
					}
					mc_.sendGoal(naviGoal);
					mc_.waitForResult(ros::Duration(40.0));
				
					if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
					{

						cout<<"Yes! The robot has arrived!"<<endl;
						vision_flag.data = "arrived";
						//nav_pub.publish(send_flag);
						vision_pub.publish(vision_flag);
						sleep(10);
						cout<<"I have arrived at the start!"<<endl;

						go=false;
						ifPatrol=false;
						now_pose=start;
						//sleep(15);
				
					}
				}

				 if(now_pose==start)
                                {
                                        //第一个点
                                        ROS_INFO("****************************************");
                                        //naviGoal.target_pose.header.frame_id = "map"; 
                                        naviGoal.target_pose.header.frame_id = "map";
                                        naviGoal.target_pose.header.stamp = ros::Time::now();
                                        naviGoal.target_pose.pose = geometry_msgs::Pose(livingroom);

                                        while(!mc_.waitForServer(ros::Duration(5.0)))
                                        {
                                                //等待服务初始化
                                                cout<<"Waiting for the server..."<<endl;
                                        }
                                        mc_.sendGoal(naviGoal);
                                        mc_.waitForResult(ros::Duration(40.0));

                                        if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                        {

                                                cout<<"Yes! The robot has arrived!"<<endl;
                                                vision_flag.data = "arrived";
                                                //nav_pub.publish(send_flag);
                                                vision_pub.publish(vision_flag);
                                                sleep(10);
                                                cout<<"I have arrived at the livingroom!"<<endl;

                                                go=false;
						ifPatrol=false;
                                                now_pose=livingroom;
                                                //sleep(15);

                                        }
                                }
				 if(now_pose==livingroom)
                                {
                                        //第一个点
                                        ROS_INFO("****************************************");
                                        //naviGoal.target_pose.header.frame_id = "map"; 
                                        naviGoal.target_pose.header.frame_id = "map";
                                        naviGoal.target_pose.header.stamp = ros::Time::now();
                                        naviGoal.target_pose.pose = geometry_msgs::Pose(kitchen);

                                        while(!mc_.waitForServer(ros::Duration(5.0)))
                                        {
                                                //等待服务初始化
                                                cout<<"Waiting for the server..."<<endl;
                                        }
                                        mc_.sendGoal(naviGoal);
                                        mc_.waitForResult(ros::Duration(40.0));

                                        if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                        {

                                                cout<<"Yes! The robot has arrived!"<<endl;
                                                vision_flag.data = "arrived";
                                                //nav_pub.publish(send_flag);
                                                vision_pub.publish(vision_flag);
                                                sleep(10);
                                                cout<<"I have arrived at the kitchen!"<<endl;

                                                go=false;
						ifPatrol=false;
                                                now_pose=kitchen;
                                                //sleep(15);

                                        }
                                }

				 if(now_pose==kitchen)
                                {
                                        //第一个点
                                        ROS_INFO("****************************************");
                                        //naviGoal.target_pose.header.frame_id = "map"; 
                                        naviGoal.target_pose.header.frame_id = "map";
                                        naviGoal.target_pose.header.stamp = ros::Time::now();
                                        naviGoal.target_pose.pose = geometry_msgs::Pose(bedroom);

                                        while(!mc_.waitForServer(ros::Duration(5.0)))
                                        {
                                                //等待服务初始化
                                                cout<<"Waiting for the server..."<<endl;
                                        }
                                        mc_.sendGoal(naviGoal);
                                        mc_.waitForResult(ros::Duration(40.0));

                                        if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                        {

                                                cout<<"Yes! The robot has arrived!"<<endl;
                                                vision_flag.data = "arrived";
                                                //nav_pub.publish(send_flag);
                                                vision_pub.publish(vision_flag);
                                                sleep(10);
                                                cout<<"I have arrived at the bedroom!"<<endl;

                                                go=false;
						ifPatrol=false;
                                                now_pose=bedroom;
                                                //sleep(15);

                                        }
                                }
			

				 if(now_pose==bedroom)
                                {
                                        //第一个点
                                        ROS_INFO("****************************************");
                                        //naviGoal.target_pose.header.frame_id = "map"; 
                                        naviGoal.target_pose.header.frame_id = "map";
                                        naviGoal.target_pose.header.stamp = ros::Time::now();
                                        naviGoal.target_pose.pose = geometry_msgs::Pose(entrance);

                                        while(!mc_.waitForServer(ros::Duration(5.0)))
                                        {
                                                //等待服务初始化
                                                cout<<"Waiting for the server..."<<endl;
                                        }
                                        mc_.sendGoal(naviGoal);
                                        mc_.waitForResult(ros::Duration(40.0));

                                        if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                        {

                                                cout<<"Yes! The robot has arrived!"<<endl;
                                                vision_flag.data = "arrived";
                                                //nav_pub.publish(send_flag);
                                                vision_pub.publish(vision_flag);
                                                sleep(10);
                                                cout<<"I have arrived at the entrance!"<<endl;

                                                go=false;
						ifPatrol=false;
                                                now_pose=entrance;
                                                //sleep(15);

                                        }
                                }



				 if(now_pose==entrance)
                                {
                                        //第一个点
                                        ROS_INFO("****************************************");
                                        //naviGoal.target_pose.header.frame_id = "map"; 
                                        naviGoal.target_pose.header.frame_id = "map";
                                        naviGoal.target_pose.header.stamp = ros::Time::now();
                                        naviGoal.target_pose.pose = geometry_msgs::Pose(balcony);

                                        while(!mc_.waitForServer(ros::Duration(5.0)))
                                        {
                                                //等待服务初始化
                                                cout<<"Waiting for the server..."<<endl;
                                        }
                                        mc_.sendGoal(naviGoal);
                                        mc_.waitForResult(ros::Duration(40.0));

                                        if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                        {

                                                cout<<"Yes! The robot has arrived!"<<endl;
                                                vision_flag.data = "arrived";
                                                //nav_pub.publish(send_flag);
                                                vision_pub.publish(vision_flag);
                                                sleep(10);
                                                cout<<"I have arrived at the balcony!"<<endl;

                                                go=false;
						ifPatrol=false;
                                                now_pose=balcony;
                                                //sleep(15);

                                        }
                                }


				 if(now_pose==balcony)
                                {
                                        //第一个点
                                        ROS_INFO("****************************************");
                                        //naviGoal.target_pose.header.frame_id = "map"; 
                                        naviGoal.target_pose.header.frame_id = "map";
                                        naviGoal.target_pose.header.stamp = ros::Time::now();
                                        naviGoal.target_pose.pose = geometry_msgs::Pose(dining);

                                        while(!mc_.waitForServer(ros::Duration(5.0)))
                                        {
                                                //等待服务初始化
                                                cout<<"Waiting for the server..."<<endl;
                                        }
                                        mc_.sendGoal(naviGoal);
                                        mc_.waitForResult(ros::Duration(40.0));

                                        if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                        {

                                                cout<<"Yes! The robot has arrived!"<<endl;
                                                vision_flag.data = "arrived";
                                                //nav_pub.publish(send_flag);
                                                vision_pub.publish(vision_flag);
                                                sleep(10);
                                                cout<<"I have arrived at the dining!"<<endl;

                                                go=false;
						ifPatrol=false;
                                                now_pose=dining;
                                                //sleep(15);

                                        }
                                }	
			}



			else if(ifPatrol==false)
			{
				 //第一个点
                                ROS_INFO("****************************************");
                                //naviGoal.target_pose.header.frame_id = "map"; 
                                naviGoal.target_pose.header.frame_id = "map";
                                naviGoal.target_pose.header.stamp = ros::Time::now();
                                naviGoal.target_pose.pose = geometry_msgs::Pose(goal_pose);

                                while(!mc_.waitForServer(ros::Duration(5.0)))
                                {
                                       //等待服务初始化
                                       cout<<"Waiting for the server..."<<endl;
                                }
                                mc_.sendGoal(naviGoal);
                                mc_.waitForResult(ros::Duration(40.0));

                                if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                {

                                       cout<<"Yes! The robot has arrived!"<<endl;
                                       vision_flag.data = "arrived";
                                       //nav_pub.publish(send_flag);
                                       vision_pub.publish(vision_flag);
                                       sleep(10);
                                       cout<<"I have arrived!"<<endl;

                                       go=false;
                                       now_pose=dining;
                                       //sleep(15);
				}
			}
		}
		if(ifGuide==true)
		{
			 //第一个点
                         ROS_INFO("****************************************");
                         //naviGoal.target_pose.header.frame_id = "map"; 
                         naviGoal.target_pose.header.frame_id = "map";
                         naviGoal.target_pose.header.stamp = ros::Time::now();
                         naviGoal.target_pose.pose = geometry_msgs::Pose(door1);

                         while(!mc_.waitForServer(ros::Duration(5.0)))
                         {
                                //等待服务初始化
                                cout<<"Waiting for the server..."<<endl;
                         }
                         mc_.sendGoal(naviGoal);
                         mc_.waitForResult(ros::Duration(40.0));

                         if(mc_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                         {

                               cout<<"Yes! The robot has arrived!"<<endl;
                               voice_flag.data = "I have arrived at the door!";
                               //nav_pub.publish(send_flag);
                               voicen_pub.publish(voice_flag);
                               sleep(10);
                               cout<<"I have arrived at the dining!"<<endl;

                               ifGuide=false;
                               now_pose=door1;
                               //sleep(15);
                         }

		}
		ros::spinOnce();
	}
	return 0;
}




























