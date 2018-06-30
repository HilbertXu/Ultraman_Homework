;; Auto-generated. Do not edit!


(when (boundp 'human_navigation::HumanNaviObjectInfo)
  (if (not (find-package "HUMAN_NAVIGATION"))
    (make-package "HUMAN_NAVIGATION"))
  (shadow 'HumanNaviObjectInfo (find-package "HUMAN_NAVIGATION")))
(unless (find-package "HUMAN_NAVIGATION::HUMANNAVIOBJECTINFO")
  (make-package "HUMAN_NAVIGATION::HUMANNAVIOBJECTINFO"))

(in-package "ROS")
;;//! \htmlinclude HumanNaviObjectInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass human_navigation::HumanNaviObjectInfo
  :super ros::object
  :slots (_name _position ))

(defmethod human_navigation::HumanNaviObjectInfo
  (:init
   (&key
    ((:name __name) "")
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _position __position)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get human_navigation::HumanNaviObjectInfo :md5sum-) "899cf99e2e01a64170a87c0171b5b2ec")
(setf (get human_navigation::HumanNaviObjectInfo :datatype-) "human_navigation/HumanNaviObjectInfo")
(setf (get human_navigation::HumanNaviObjectInfo :definition-)
      "string name
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :human_navigation/HumanNaviObjectInfo "899cf99e2e01a64170a87c0171b5b2ec")


