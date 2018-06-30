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
bool ifRescue = false;
bool isMiddlePoint = true;
bool ifEnd = false;
geometry_msgs::Twist vel; //控制机器人速度
std_msgs::String voice_flag;
std_msgs::String vision_flag;
std_msgs::String name;

geometry_msgs::Pose goal_pose;//目标位置
int now_pose=1;//当前位置


//定义不同房间的位置
geometry_msgs::Pose livingroom;
geometry_msgs::Pose kitchen;
geometry_msgs::Pose bedroom;
geometry_msgs::Pose entrance;


ros::Publisher voice_pub;//收到语音后向视觉发布消息开始寻人
ros::Publisher vision_pub;//到达门口后向语音发布消息
ros::Publisher room_name;//fa bu dang qian fang jian de ming zi 
ros::Publisher find_person;


ros::Subscriber voice_sub;//向下一个点前进
ros::Subscriber vision_sub;    //收到语音消息后停止巡逻


void visionCallback(const std_msgs::String::ConstPtr& msg);
void voiceCallback(const std_msgs::String::ConstPtr& msg);


void initplace()
{
  
//2

  livingroom.position.x = 1.89922;
  livingroom.position.y = -4.88757;
  livingroom.position.z = 0;
  livingroom.orientation.x = 0;
  livingroom.orientation.y = 0;
  livingroom.orientation.z = -0.737651;
  livingroom.orientation.w = 0.675182;
  
  kitchen.position.x = 1.69523;
  kitchen.position.y = -8.89527;
  kitchen.position.z = 0;
  kitchen.orientation.x = 0;
  kitchen.orientation.y = 0;
  kitchen.orientation.z = 0.994026;
  kitchen.orientation.w = 0.109148;
//3
  bedroom.position.x = 5.42315;
  bedroom.position.y = -10.1052;
  bedroom.position.z = 0;
  bedroom.orientation.x = 0;
  bedroom.orientation.y = 0;
  bedroom.orientation.z = -0.0361616;
  bedroom.orientation.w = 0.999346;

  entrance.position.x = 0.0280674;
  entrance.position.y = 0.0209783;
  entrance.position.z = 0;
  entrance.orientation.x = 0;
  entrance.orientation.y = 0;
  entrance.orientation.z = 0.00163915;
  entrance.orientation.w = 0.999999;


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
  if(msg->data == "starting_patrolling")
    {
      go = true;
      ifPatrol = true;
      cout<<"The robot has started patrolling!";
    }
  if(msg->data == "go to the living room")
    {
      ifRescue = true;
      goal_pose = livingroom;
    }
  if(msg->data == "go to the kitchen")
     {
       ifRescue = true;
       goal_pose = kitchen;
     }
  if(msg->data == "go to the bedroom")
     {
       ifRescue = true;
       goal_pose = bedroom;
     } 
  if(msg->data == "go to the entrance")
     {
       ifRescue = true;
       goal_pose = entrance;
     } 
  if(msg->data == "end")
  {
      ifEnd = true;
      goal_pose = entrance;
  } 
}


//向下一个点继续前进
void visionCallback(const std_msgs::String::ConstPtr& msg)
{
  if(msg->data == "go_on")
    {
      go = true;
      ifPatrol = true;
    }
  if(msg->data == "found_person")
    {
      go = false;
      ifPatrol = false;
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

	voice_sub = myNode.subscribe("speech2nav",1,voiceCallback);
	vision_sub = myNode.subscribe("img2nav",1,visionCallback);
	room_name = myNode.advertise<std_msgs::String>("room_name",1);
	find_person = myNode.advertise<std_msgs::String>("/start_find",1);

	MoveBaseClient  mc_("move_base", true); //建立导航客户端
	move_base_msgs::MoveBaseGoal naviGoal; //导航目标点
	int count1=0;

	while(ros::ok())
	{

	if(ifGuide==true)
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
                voice_flag.data = "exit";
                //nav_pub.publish(send_flag);
                voice_pub.publish(voice_flag);
                sleep(10);
                cout<<"I have arrived at the entrance!"<<endl;

                ifGuide=false;
                now_pose=0;
                //sleep(15);
             }

		}	

	if(ifRescue == true)
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
                    vision_flag.data = "in_position";
                    //nav_pub.publish(send_flag);
                    vision_pub.publish(vision_flag);
                    //find_person.publish(vision_flag);
                    voice_flag.data="start_find";
                    voice_pub.publish(voice_flag);
                    sleep(10);
                    cout<<"I have arrived!"<<endl;
					now_pose=0;
					ifRescue= false;
                    //sleep(15);
				}
			}	
    if(ifEnd == true)
    {
      //第一个点
          ROS_INFO("task finished");
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

            voice_flag.data="end";
            cout<<"End the Show"<<endl;
            if(count1==0)
            {	
            voice_pub.publish(voice_flag);
            count1++;
        	}
            sleep(10);
            cout<<"I have arrived at the entrance!"<<endl;
            go=false;
            ifPatrol=false;
            ifEnd = false;
          }
    }
    else
		if(go == true)
		{
			if(ifPatrol == true)
			{
				if(now_pose==1)
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

						cout<<"Yes! The robot has arrived the entrance!"<<endl;
						vision_flag.data = "arrived";
						//nav_pub.publish(send_flag);
						vision_pub.publish(vision_flag);
                        voice_flag.data = "arrived entrance";
                        voice_pub.publish(voice_flag);
                        voice_flag.data=" ";
                        sleep(3);
                        voice_flag.data="takepics entrance";
                        voice_pub.publish(voice_flag);
                        voice_flag.data=" ";
						name.data="entrance";
						room_name.publish(name);
						sleep(7);
						cout<<"I have arrived at the entrance!"<<endl;

						//go=false;
						//ifPatrol=false;
						now_pose=2;
						//sleep(15);
				
					}
				}

				 if(now_pose==2)
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
                                                voice_flag.data = "arrived living room";
                                                voice_pub.publish(voice_flag);
                                                voice_flag.data=" ";
                                                sleep(3);
                                                voice_flag.data="takepics living room";
                                                voice_pub.publish(voice_flag);
                                                voice_flag.data=" ";
						                        name.data="livingroom";
						                        room_name.publish(name);
                                                sleep(7);
                                                cout<<"I have arrived at the livingroom!"<<endl;

                                                //go=false;
												//ifPatrol=false;
                                                now_pose=3;
                                                //sleep(15);

                                        }
                                }
				 if(now_pose==3)
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
                                                voice_flag.data = "arrived kitchen";
                                                voice_pub.publish(voice_flag);
                                                voice_flag.data=" ";
                                                sleep(3);
                                                voice_flag.data="takepics kitchen";
                                                voice_pub.publish(voice_flag);
                                                voice_flag.data=" ";
						                        name.data="kitchen";
						                        room_name.publish(name);
                                                sleep(7);
                                                cout<<"I have arrived at the kitchen!"<<endl;

                                                //go=false;
												//ifPatrol=false;
                                                now_pose=4;
                                                //sleep(15);

                                        }
                                }

				 if(now_pose==4)
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
                                                voice_flag.data = "arrived bedroom";
                                                voice_pub.publish(voice_flag);
                                                voice_flag.data=" ";
                                                sleep(3);
                                                voice_flag.data="takepics bedroom";
                                                voice_pub.publish(voice_flag);
                                                voice_flag.data=" ";
						                        name.data="bedroom";
						                        room_name.publish(name);
                                                sleep(7);
                                                voice_flag.data="warning";
                                                voice_pub.publish(voice_flag);
                                                cout<<"I have arrived at the bedroom!"<<endl;
                                                
                                                go=false;
                                                now_pose=0;
												ifPatrol=false;
                                                //sleep(15);

                                        }
                                }
		  }



			
		}
		
		ros::spinOnce();
	}
	return 0;
}




























