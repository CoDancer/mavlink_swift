//
//  MAVROICommonEnum.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

/// The ROI (region of interest) for the vehicle. This can be be used by the vehicle for camera/vehicle attitude alignment (see MAV_CMD_NAV_ROI).
public enum MAVROI: Int {

	/// No region of interest.
	case none = 0

	/// Point toward next waypoint, with optional pitch/roll/yaw offset.
	case wpnext = 1

	/// Point toward given waypoint.
	case wpindex = 2

	/// Point toward fixed location.
	case location = 3

	/// Point toward of given id.
	case target = 4
}

extension MAVROI: Enumeration {
    public static var typeName = "MAV_ROI"
    public static var typeDescription = "The ROI (region of interest) for the vehicle. This can be be used by the vehicle for camera/vehicle attitude alignment (see MAV_CMD_NAV_ROI)."
    public static var allMembers = [none, wpnext, wpindex, location, target]
    public static var membersDescriptions = [("MAV_ROI_NONE", "No region of interest."), ("MAV_ROI_WPNEXT", "Point toward next waypoint, with optional pitch/roll/yaw offset."), ("MAV_ROI_WPINDEX", "Point toward given waypoint."), ("MAV_ROI_LOCATION", "Point toward fixed location."), ("MAV_ROI_TARGET", "Point toward of given id.")]
    public static var enumEnd = UInt(5)
}
