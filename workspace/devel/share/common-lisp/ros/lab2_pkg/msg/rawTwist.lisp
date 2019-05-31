; Auto-generated. Do not edit!


(cl:in-package lab2_pkg-msg)


;//! \htmlinclude rawTwist.msg.html

(cl:defclass <rawTwist> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type lab2_pkg-msg:Vector3
    :initform (cl:make-instance 'lab2_pkg-msg:Vector3))
   (angular
    :reader angular
    :initarg :angular
    :type lab2_pkg-msg:Vector3
    :initform (cl:make-instance 'lab2_pkg-msg:Vector3)))
)

(cl:defclass rawTwist (<rawTwist>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rawTwist>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rawTwist)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab2_pkg-msg:<rawTwist> is deprecated: use lab2_pkg-msg:rawTwist instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <rawTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab2_pkg-msg:linear-val is deprecated.  Use lab2_pkg-msg:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <rawTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab2_pkg-msg:angular-val is deprecated.  Use lab2_pkg-msg:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rawTwist>) ostream)
  "Serializes a message object of type '<rawTwist>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rawTwist>) istream)
  "Deserializes a message object of type '<rawTwist>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rawTwist>)))
  "Returns string type for a message object of type '<rawTwist>"
  "lab2_pkg/rawTwist")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rawTwist)))
  "Returns string type for a message object of type 'rawTwist"
  "lab2_pkg/rawTwist")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rawTwist>)))
  "Returns md5sum for a message object of type '<rawTwist>"
  "9f195f881246fdfa2798d1d3eebca84a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rawTwist)))
  "Returns md5sum for a message object of type 'rawTwist"
  "9f195f881246fdfa2798d1d3eebca84a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rawTwist>)))
  "Returns full string definition for message of type '<rawTwist>"
  (cl:format cl:nil "# This expresses velocity in free space broken into its linear and angular parts.~%Vector3 linear ~%Vector3  angular~%~%================================================================================~%MSG: lab2_pkg/Vector3~%#this can be used now to create vector messages~%#rawTwist.msg uses this file. Refer to it as example~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rawTwist)))
  "Returns full string definition for message of type 'rawTwist"
  (cl:format cl:nil "# This expresses velocity in free space broken into its linear and angular parts.~%Vector3 linear ~%Vector3  angular~%~%================================================================================~%MSG: lab2_pkg/Vector3~%#this can be used now to create vector messages~%#rawTwist.msg uses this file. Refer to it as example~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rawTwist>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rawTwist>))
  "Converts a ROS message object to a list"
  (cl:list 'rawTwist
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))
