//
//  ADSBFlagsCommonEnum.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

/// These flags indicate status such as data validity of each data source. Set = data valid
public enum ADSBFlags: UInt16 {
	case validCoords = 1
	case validAltitude = 2
	case validHeading = 4
	case validVelocity = 8
	case validCallsign = 16
	case validSquawk = 32
	case simulated = 64
}

extension ADSBFlags: Enumeration {
    public static var typeName = "ADSB_FLAGS"
    public static var typeDescription = "These flags indicate status such as data validity of each data source. Set = data valid"
    public static var allMembers = [validCoords, validAltitude, validHeading, validVelocity, validCallsign, validSquawk, simulated]
    public static var membersDescriptions = [("ADSB_FLAGS_VALID_COORDS", ""), ("ADSB_FLAGS_VALID_ALTITUDE", ""), ("ADSB_FLAGS_VALID_HEADING", ""), ("ADSB_FLAGS_VALID_VELOCITY", ""), ("ADSB_FLAGS_VALID_CALLSIGN", ""), ("ADSB_FLAGS_VALID_SQUAWK", ""), ("ADSB_FLAGS_SIMULATED", "")]
    public static var enumEnd = UInt(65)
}
