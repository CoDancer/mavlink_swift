//
//  MAVMountModeCommonEnum.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

/// Enumeration of possible mount operation modes
public enum MAVMountMode: Int {

	/// Load and keep safe position (Roll,Pitch,Yaw) from permant memory and stop stabilization
	case retract = 0

	/// Load and keep neutral position (Roll,Pitch,Yaw) from permanent memory.
	case neutral = 1

	/// Load neutral position and start MAVLink Roll,Pitch,Yaw control with stabilization
	case mavlinkTargeting = 2

	/// Load neutral position and start RC Roll,Pitch,Yaw control with stabilization
	case rcTargeting = 3

	/// Load neutral position and start to point to Lat,Lon,Alt
	case gpsPoint = 4
}

extension MAVMountMode: Enumeration {
    public static var typeName = "MAV_MOUNT_MODE"
    public static var typeDescription = "Enumeration of possible mount operation modes"
    public static var allMembers = [retract, neutral, mavlinkTargeting, rcTargeting, gpsPoint]
    public static var membersDescriptions = [("MAV_MOUNT_MODE_RETRACT", "Load and keep safe position (Roll,Pitch,Yaw) from permant memory and stop stabilization"), ("MAV_MOUNT_MODE_NEUTRAL", "Load and keep neutral position (Roll,Pitch,Yaw) from permanent memory."), ("MAV_MOUNT_MODE_MAVLINK_TARGETING", "Load neutral position and start MAVLink Roll,Pitch,Yaw control with stabilization"), ("MAV_MOUNT_MODE_RC_TARGETING", "Load neutral position and start RC Roll,Pitch,Yaw control with stabilization"), ("MAV_MOUNT_MODE_GPS_POINT", "Load neutral position and start to point to Lat,Lon,Alt")]
    public static var enumEnd = UInt(5)
}
