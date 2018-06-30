// Generated by gencpp from file human_navigation/HumanNaviObjectInfo.msg
// DO NOT EDIT!


#ifndef HUMAN_NAVIGATION_MESSAGE_HUMANNAVIOBJECTINFO_H
#define HUMAN_NAVIGATION_MESSAGE_HUMANNAVIOBJECTINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace human_navigation
{
template <class ContainerAllocator>
struct HumanNaviObjectInfo_
{
  typedef HumanNaviObjectInfo_<ContainerAllocator> Type;

  HumanNaviObjectInfo_()
    : name()
    , position()  {
    }
  HumanNaviObjectInfo_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , position(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> const> ConstPtr;

}; // struct HumanNaviObjectInfo_

typedef ::human_navigation::HumanNaviObjectInfo_<std::allocator<void> > HumanNaviObjectInfo;

typedef boost::shared_ptr< ::human_navigation::HumanNaviObjectInfo > HumanNaviObjectInfoPtr;
typedef boost::shared_ptr< ::human_navigation::HumanNaviObjectInfo const> HumanNaviObjectInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace human_navigation

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'human_navigation': ['/home/kamerider/catkin_ws/src/human-navigation-ros/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "899cf99e2e01a64170a87c0171b5b2ec";
  }

  static const char* value(const ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x899cf99e2e01a641ULL;
  static const uint64_t static_value2 = 0x70a87c0171b5b2ecULL;
};

template<class ContainerAllocator>
struct DataType< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "human_navigation/HumanNaviObjectInfo";
  }

  static const char* value(const ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
geometry_msgs/Point position\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HumanNaviObjectInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::human_navigation::HumanNaviObjectInfo_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HUMAN_NAVIGATION_MESSAGE_HUMANNAVIOBJECTINFO_H