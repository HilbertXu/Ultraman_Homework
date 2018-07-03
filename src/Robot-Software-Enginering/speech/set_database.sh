#!/bin/sh
echo "camera start"
gnome-terminal -x bash -c "roslaunch usb_cam usb_cam-test.launch"

sleep 1

echo "riddle.launch start"
gnome-terminal -x bash -c "roslaunch speech SPR.launch;"

sleep 1

echo "dictionary start"
gnome-terminal -x bash -c " pocketsphinx_continuous -inmic yes -dict ~/catkin_ws/src/speech/voice_library/homework/2955.dic -lm ~/catkin_ws/src/speech/voice_library/homework/2955.lm"

sleep 1

echo "face detect"
gnome-terminal -x bash -c "rosrun machine_vision face_detection"

sleep 1

echo "model train"
gnome-terminal -x bash -c "rosrun machine_vision face_keras.py"

sleep 1
