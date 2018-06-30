;; Auto-generated. Do not edit!


(when (boundp 'human_navigation::HumanNaviTaskInfo)
  (if (not (find-package "HUMAN_NAVIGATION"))
    (make-package "HUMAN_NAVIGATION"))
  (shadow 'HumanNaviTaskInfo (find-package "HUMAN_NAVIGATION")))
(unless (find-package "HUMAN_NAVIGATION::HUMANNAVITASKINFO")
  (make-package "HUMAN_NAVIGATION::HUMANNAVITASKINFO"))

(in-package "ROS")
;;//! \htmlinclude HumanNaviTaskInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass human_navigation::HumanNaviTaskInfo
  :super ros::object
  :slots (_environment_id _objects_info _target_object _destination ))

(defmethod human_navigation::HumanNaviTaskInfo
  (:init
   (&key
    ((:environment_id __environment_id) "")
    ((:objects_info __objects_info) (let (r) (dotimes (i 0) (push (instance human_navigation::HumanNaviObjectInfo :init) r)) r))
    ((:target_object __target_object) (instance human_navigation::HumanNaviObjectInfo :init))
    ((:destination __destination) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _environment_id (string __environment_id))
   (setq _objects_info __objects_info)
   (setq _target_object __target_object)
   (setq _destination __destination)
   self)
  (:environment_id
   (&optional __environment_id)
   (if __environment_id (setq _environment_id __environment_id)) _environment_id)
  (:objects_info
   (&rest __objects_info)
   (if (keywordp (car __objects_info))
       (send* _objects_info __objects_info)
     (progn
       (if __objects_info (setq _objects_info (car __objects_info)))
       _objects_info)))
  (:target_object
   (&rest __target_object)
   (if (keywordp (car __target_object))
       (send* _target_object __target_object)
     (progn
       (if __target_object (setq _target_object (car __target_object)))
       _target_object)))
  (:destination
   (&rest __destination)
   (if (keywordp (car __destination))
       (send* _destination __destination)
     (progn
       (if __destination (setq _destination (car __destination)))
       _destination)))
  (:serialization-length
   ()
   (+
    ;; string _environment_id
    4 (length _environment_id)
    ;; human_navigation/HumanNaviObjectInfo[] _objects_info
    (apply #'+ (send-all _objects_info :serialization-length)) 4
    ;; human_navigation/HumanNaviObjectInfo _target_object
    (send _target_object :serialization-length)
    ;; geometry_msgs/Point _destination
    (send _destination :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _environment_id
       (write-long (length _environment_id) s) (princ _environment_id s)
     ;; human_navigation/HumanNaviObjectInfo[] _objects_info
     (write-long (length _objects_info) s)
     (dolist (elem _objects_info)
       (send elem :serialize s)
       )
     ;; human_navigation/HumanNaviObjectInfo _target_object
       (send _target_object :serialize s)
     ;; geometry_msgs/Point _destination
       (send _destination :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _environment_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _environment_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; human_navigation/HumanNaviObjectInfo[] _objects_info
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects_info (let (r) (dotimes (i n) (push (instance human_navigation::HumanNaviObjectInfo :init) r)) r))
     (dolist (elem- _objects_info)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; human_navigation/HumanNaviObjectInfo _target_object
     (send _target_object :deserialize buf ptr-) (incf ptr- (send _target_object :serialization-length))
   ;; geometry_msgs/Point _destination
     (send _destination :deserialize buf ptr-) (incf ptr- (send _destination :serialization-length))
   ;;
   self)
  )

(setf (get human_navigation::HumanNaviTaskInfo :md5sum-) "a171437ef155a1af48679c78f18cbc7d")
(setf (get human_navigation::HumanNaviTaskInfo :datatype-) "human_navigation/HumanNaviTaskInfo")
(setf (get human_navigation::HumanNaviTaskInfo :definition-)
      "string environment_id
HumanNaviObjectInfo[] objects_info
HumanNaviObjectInfo target_object
geometry_msgs/Point destination

================================================================================
MSG: human_navigation/HumanNaviObjectInfo
string name
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :human_navigation/HumanNaviTaskInfo "a171437ef155a1af48679c78f18cbc7d")


