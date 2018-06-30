;; Auto-generated. Do not edit!


(when (boundp 'human_navigation::HumanNaviAvatarPose)
  (if (not (find-package "HUMAN_NAVIGATION"))
    (make-package "HUMAN_NAVIGATION"))
  (shadow 'HumanNaviAvatarPose (find-package "HUMAN_NAVIGATION")))
(unless (find-package "HUMAN_NAVIGATION::HUMANNAVIAVATARPOSE")
  (make-package "HUMAN_NAVIGATION::HUMANNAVIAVATARPOSE"))

(in-package "ROS")
;;//! \htmlinclude HumanNaviAvatarPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass human_navigation::HumanNaviAvatarPose
  :super ros::object
  :slots (_head _left_hand _right_hand ))

(defmethod human_navigation::HumanNaviAvatarPose
  (:init
   (&key
    ((:head __head) (instance geometry_msgs::Pose :init))
    ((:left_hand __left_hand) (instance geometry_msgs::Pose :init))
    ((:right_hand __right_hand) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _head __head)
   (setq _left_hand __left_hand)
   (setq _right_hand __right_hand)
   self)
  (:head
   (&rest __head)
   (if (keywordp (car __head))
       (send* _head __head)
     (progn
       (if __head (setq _head (car __head)))
       _head)))
  (:left_hand
   (&rest __left_hand)
   (if (keywordp (car __left_hand))
       (send* _left_hand __left_hand)
     (progn
       (if __left_hand (setq _left_hand (car __left_hand)))
       _left_hand)))
  (:right_hand
   (&rest __right_hand)
   (if (keywordp (car __right_hand))
       (send* _right_hand __right_hand)
     (progn
       (if __right_hand (setq _right_hand (car __right_hand)))
       _right_hand)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _head
    (send _head :serialization-length)
    ;; geometry_msgs/Pose _left_hand
    (send _left_hand :serialization-length)
    ;; geometry_msgs/Pose _right_hand
    (send _right_hand :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _head
       (send _head :serialize s)
     ;; geometry_msgs/Pose _left_hand
       (send _left_hand :serialize s)
     ;; geometry_msgs/Pose _right_hand
       (send _right_hand :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _head
     (send _head :deserialize buf ptr-) (incf ptr- (send _head :serialization-length))
   ;; geometry_msgs/Pose _left_hand
     (send _left_hand :deserialize buf ptr-) (incf ptr- (send _left_hand :serialization-length))
   ;; geometry_msgs/Pose _right_hand
     (send _right_hand :deserialize buf ptr-) (incf ptr- (send _right_hand :serialization-length))
   ;;
   self)
  )

(setf (get human_navigation::HumanNaviAvatarPose :md5sum-) "da17fe0a6c6bd33b9ccc614a3a7af77c")
(setf (get human_navigation::HumanNaviAvatarPose :datatype-) "human_navigation/HumanNaviAvatarPose")
(setf (get human_navigation::HumanNaviAvatarPose :definition-)
      "geometry_msgs/Pose head
geometry_msgs/Pose left_hand
geometry_msgs/Pose right_hand

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :human_navigation/HumanNaviAvatarPose "da17fe0a6c6bd33b9ccc614a3a7af77c")


