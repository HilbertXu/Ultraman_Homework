#!/bin/sh

#echo "turtlebot connected"
#gnome-terminal -x bash -c "roslaunch turtlebot_bringup minimal.launch"

#sleep 1

#echo "kinect connected"
#gnome-terminal -x bash -c "roslaunch freenect_launch doublekinect_test.launch"
#sleep 1

#echo "gender recognizition start"
#gnome-terminal -x bash -c "rosrun imgpcl gender_2017"

#sleep 1


echo "camera start"
gnome-terminal -x bash -c "roslaunch usb_cam usb_cam-test.launch"

sleep 1

echo "wechat start"
gnome-terminal -x bash -c "rosrun machine_vision send_wechat.py"

sleep 1

echo "navigation start"
gnome-terminal -x bash -c "roslaunch navigation nav.launch"

sleep 1

echo "riddle.launch start"
gnome-terminal -x bash -c "roslaunch speech SPR.launch;"

sleep 1

echo "dictionary start"
gnome-terminal -x bash -c " pocketsphinx_continuous -inmic yes -dict ~/catkin_ws/src/speech/voice_library/homework/2955.dic -lm ~/catkin_ws/src/speech/voice_library/homework/2955.lm"

echo "take photo"
gnome-terminal -x bash -c "rosrun machine_vision take_photo"

sleep 1

echo "room detect"
gnome-terminal -x bash -c "rosrun machine_vision room_detect.py"

sleep 1

echo "find person"
gnome-terminal -x bash -c "rosrun machine_vision find_person"

sleep 1

exit 0 
