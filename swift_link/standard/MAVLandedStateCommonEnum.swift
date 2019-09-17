//
//  MAVLandedStateCommonEnum.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

/// Enumeration of landed detector states
public enum MAVLandedState: UInt8 {

	/// MAV landed state is unknown
	case undefined = 0

	/// MAV is landed (on ground)
	case onGround = 1

	/// MAV is in air
	case inAir = 2

	/// MAV currently taking off
	case takeoff = 3

	/// MAV currently landing
	case landing = 4
}

extension MAVLandedState: Enumeration {
    public static var typeName = "MAV_LANDED_STATE"
    public static var typeDescription = "Enumeration of landed detector states"
    public static var allMembers = [undefined, onGround, inAir, takeoff, landing]
    public static var membersDescriptions = [("MAV_LANDED_STATE_UNDEFINED", "MAV landed state is unknown"), ("MAV_LANDED_STATE_ON_GROUND", "MAV is landed (on ground)"), ("MAV_LANDED_STATE_IN_AIR", "MAV is in air"), ("MAV_LANDED_STATE_TAKEOFF", "MAV currently taking off"), ("MAV_LANDED_STATE_LANDING", "MAV currently landing")]
    public static var enumEnd = UInt(5)
}
