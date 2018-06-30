; Auto-generated. Do not edit!


(cl:in-package human_navigation-msg)


;//! \htmlinclude HumanNaviTaskInfo.msg.html

(cl:defclass <HumanNaviTaskInfo> (roslisp-msg-protocol:ros-message)
  ((environment_id
    :reader environment_id
    :initarg :environment_id
    :type cl:string
    :initform "")
   (objects_info
    :reader objects_info
    :initarg :objects_info
    :type (cl:vector human_navigation-msg:HumanNaviObjectInfo)
   :initform (cl:make-array 0 :element-type 'human_navigation-msg:HumanNaviObjectInfo :initial-element (cl:make-instance 'human_navigation-msg:HumanNaviObjectInfo)))
   (target_object
    :reader target_object
    :initarg :target_object
    :type human_navigation-msg:HumanNaviObjectInfo
    :initform (cl:make-instance 'human_navigation-msg:HumanNaviObjectInfo))
   (destination
    :reader destination
    :initarg :destination
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass HumanNaviTaskInfo (<HumanNaviTaskInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanNaviTaskInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanNaviTaskInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_navigation-msg:<HumanNaviTaskInfo> is deprecated: use human_navigation-msg:HumanNaviTaskInfo instead.")))

(cl:ensure-generic-function 'environment_id-val :lambda-list '(m))
(cl:defmethod environment_id-val ((m <HumanNaviTaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:environment_id-val is deprecated.  Use human_navigation-msg:environment_id instead.")
  (environment_id m))

(cl:ensure-generic-function 'objects_info-val :lambda-list '(m))
(cl:defmethod objects_info-val ((m <HumanNaviTaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:objects_info-val is deprecated.  Use human_navigation-msg:objects_info instead.")
  (objects_info m))

(cl:ensure-generic-function 'target_object-val :lambda-list '(m))
(cl:defmethod target_object-val ((m <HumanNaviTaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:target_object-val is deprecated.  Use human_navigation-msg:target_object instead.")
  (target_object m))

(cl:ensure-generic-function 'destination-val :lambda-list '(m))
(cl:defmethod destination-val ((m <HumanNaviTaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_navigation-msg:destination-val is deprecated.  Use human_navigation-msg:destination instead.")
  (destination m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanNaviTaskInfo>) ostream)
  "Serializes a message object of type '<HumanNaviTaskInfo>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'environment_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'environment_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects_info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects_info))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target_object) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'destination) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanNaviTaskInfo>) istream)
  "Deserializes a message object of type '<HumanNaviTaskInfo>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'environment_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'environment_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects_info) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects_info)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'human_navigation-msg:HumanNaviObjectInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target_object) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'destination) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanNaviTaskInfo>)))
  "Returns string type for a message object of type '<HumanNaviTaskInfo>"
  "human_navigation/HumanNaviTaskInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanNaviTaskInfo)))
  "Returns string type for a message object of type 'HumanNaviTaskInfo"
  "human_navigation/HumanNaviTaskInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanNaviTaskInfo>)))
  "Returns md5sum for a message object of type '<HumanNaviTaskInfo>"
  "a171437ef155a1af48679c78f18cbc7d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanNaviTaskInfo)))
  "Returns md5sum for a message object of type 'HumanNaviTaskInfo"
  "a171437ef155a1af48679c78f18cbc7d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanNaviTaskInfo>)))
  "Returns full string definition for message of type '<HumanNaviTaskInfo>"
  (cl:format cl:nil "string environment_id~%HumanNaviObjectInfo[] objects_info~%HumanNaviObjectInfo target_object~%geometry_msgs/Point destination~%~%================================================================================~%MSG: human_navigation/HumanNaviObjectInfo~%string name~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanNaviTaskInfo)))
  "Returns full string definition for message of type 'HumanNaviTaskInfo"
  (cl:format cl:nil "string environment_id~%HumanNaviObjectInfo[] objects_info~%HumanNaviObjectInfo target_object~%geometry_msgs/Point destination~%~%================================================================================~%MSG: human_navigation/HumanNaviObjectInfo~%string name~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanNaviTaskInfo>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'environment_id))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects_info) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target_object))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'destination))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanNaviTaskInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanNaviTaskInfo
    (cl:cons ':environment_id (environment_id msg))
    (cl:cons ':objects_info (objects_info msg))
    (cl:cons ':target_object (target_object msg))
    (cl:cons ':destination (destination msg))
))
