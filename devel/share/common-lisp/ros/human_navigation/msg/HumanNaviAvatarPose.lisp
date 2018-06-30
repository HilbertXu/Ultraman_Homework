; Auto-generated. Do not edit!


(cl:in-package human_navigation-msg)


;//! \htmlinclude HumanNaviAvatarPose.msg.html

(cl:defclass <HumanNaviAvatarPose> (roslisp-msg-protocol:ros-message)
  ((head
    :reader head
    :initarg :head
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (left_hand
    :reader left_hand
    :initarg :left_hand
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (right_hand
    :reader right_hand
    :initarg :right_hand
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass HumanNaviAvatarPose (<HumanNaviAvatarPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanNaviAvatarPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanNaviAvatarPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_navigation-msg:<HumanNaviAvatarPose> is deprecated: use human_navigation-msg:HumanNaviAvatarPose instead.")))

(cl:ensure-generic-function 'head-val :lambda-list '(m))
(cl:defmethod head-val ((m <HumanNaviAvatarPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:head-val is deprecated.  Use human_navigation-msg:head instead.")
  (head m))

(cl:ensure-generic-function 'left_hand-val :lambda-list '(m))
(cl:defmethod left_hand-val ((m <HumanNaviAvatarPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:left_hand-val is deprecated.  Use human_navigation-msg:left_hand instead.")
  (left_hand m))

(cl:ensure-generic-function 'right_hand-val :lambda-list '(m))
(cl:defmethod right_hand-val ((m <HumanNaviAvatarPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:right_hand-val is deprecated.  Use human_navigation-msg:right_hand instead.")
  (right_hand m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanNaviAvatarPose>) ostream)
  "Serializes a message object of type '<HumanNaviAvatarPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'head) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left_hand) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right_hand) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanNaviAvatarPose>) istream)
  "Deserializes a message object of type '<HumanNaviAvatarPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'head) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left_hand) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right_hand) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanNaviAvatarPose>)))
  "Returns string type for a message object of type '<HumanNaviAvatarPose>"
  "human_navigation/HumanNaviAvatarPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanNaviAvatarPose)))
  "Returns string type for a message object of type 'HumanNaviAvatarPose"
  "human_navigation/HumanNaviAvatarPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanNaviAvatarPose>)))
  "Returns md5sum for a message object of type '<HumanNaviAvatarPose>"
  "da17fe0a6c6bd33b9ccc614a3a7af77c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanNaviAvatarPose)))
  "Returns md5sum for a message object of type 'HumanNaviAvatarPose"
  "da17fe0a6c6bd33b9ccc614a3a7af77c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanNaviAvatarPose>)))
  "Returns full string definition for message of type '<HumanNaviAvatarPose>"
  (cl:format cl:nil "geometry_msgs/Pose head~%geometry_msgs/Pose left_hand~%geometry_msgs/Pose right_hand~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanNaviAvatarPose)))
  "Returns full string definition for message of type 'HumanNaviAvatarPose"
  (cl:format cl:nil "geometry_msgs/Pose head~%geometry_msgs/Pose left_hand~%geometry_msgs/Pose right_hand~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanNaviAvatarPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'head))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left_hand))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right_hand))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanNaviAvatarPose>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanNaviAvatarPose
    (cl:cons ':head (head msg))
    (cl:cons ':left_hand (left_hand msg))
    (cl:cons ':right_hand (right_hand msg))
))
