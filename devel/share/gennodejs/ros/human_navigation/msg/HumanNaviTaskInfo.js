// Auto-generated. Do not edit!

// (in-package human_navigation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let HumanNaviObjectInfo = require('./HumanNaviObjectInfo.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class HumanNaviTaskInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.environment_id = null;
      this.objects_info = null;
      this.target_object = null;
      this.destination = null;
    }
    else {
      if (initObj.hasOwnProperty('environment_id')) {
        this.environment_id = initObj.environment_id
      }
      else {
        this.environment_id = '';
      }
      if (initObj.hasOwnProperty('objects_info')) {
        this.objects_info = initObj.objects_info
      }
      else {
        this.objects_info = [];
      }
      if (initObj.hasOwnProperty('target_object')) {
        this.target_object = initObj.target_object
      }
      else {
        this.target_object = new HumanNaviObjectInfo();
      }
      if (initObj.hasOwnProperty('destination')) {
        this.destination = initObj.destination
      }
      else {
        this.destination = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HumanNaviTaskInfo
    // Serialize message field [environment_id]
    bufferOffset = _serializer.string(obj.environment_id, buffer, bufferOffset);
    // Serialize message field [objects_info]
    // Serialize the length for message field [objects_info]
    bufferOffset = _serializer.uint32(obj.objects_info.length, buffer, bufferOffset);
    obj.objects_info.forEach((val) => {
      bufferOffset = HumanNaviObjectInfo.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [target_object]
    bufferOffset = HumanNaviObjectInfo.serialize(obj.target_object, buffer, bufferOffset);
    // Serialize message field [destination]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.destination, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HumanNaviTaskInfo
    let len;
    let data = new HumanNaviTaskInfo(null);
    // Deserialize message field [environment_id]
    data.environment_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [objects_info]
    // Deserialize array length for message field [objects_info]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects_info = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects_info[i] = HumanNaviObjectInfo.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [target_object]
    data.target_object = HumanNaviObjectInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [destination]
    data.destination = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.environment_id.length;
    object.objects_info.forEach((val) => {
      length += HumanNaviObjectInfo.getMessageSize(val);
    });
    length += HumanNaviObjectInfo.getMessageSize(object.target_object);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'human_navigation/HumanNaviTaskInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a171437ef155a1af48679c78f18cbc7d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string environment_id
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HumanNaviTaskInfo(null);
    if (msg.environment_id !== undefined) {
      resolved.environment_id = msg.environment_id;
    }
    else {
      resolved.environment_id = ''
    }

    if (msg.objects_info !== undefined) {
      resolved.objects_info = new Array(msg.objects_info.length);
      for (let i = 0; i < resolved.objects_info.length; ++i) {
        resolved.objects_info[i] = HumanNaviObjectInfo.Resolve(msg.objects_info[i]);
      }
    }
    else {
      resolved.objects_info = []
    }

    if (msg.target_object !== undefined) {
      resolved.target_object = HumanNaviObjectInfo.Resolve(msg.target_object)
    }
    else {
      resolved.target_object = new HumanNaviObjectInfo()
    }

    if (msg.destination !== undefined) {
      resolved.destination = geometry_msgs.msg.Point.Resolve(msg.destination)
    }
    else {
      resolved.destination = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = HumanNaviTaskInfo;
