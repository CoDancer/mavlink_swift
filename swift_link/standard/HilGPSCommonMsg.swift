//
//  HilGPSCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// The global position, as returned by the Global Positioning System (GPS). This is NOT the global position estimate of the sytem, but rather a RAW sensor value. See message GLOBAL_POSITION for the global position estimate.
public struct HilGPS {

	/// Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number.
	public let timeUsec: UInt64

	/// 0-1: no fix, 2: 2D fix, 3: 3D fix. Some applications will not use the value of this field unless it is at least two, so always correctly fill in the fix.
	public let fixType: UInt8

	/// Latitude (WGS84)
	public let lat: Int32

	/// Longitude (WGS84)
	public let lon: Int32

	/// Altitude (MSL). Positive for up.
	public let alt: Int32

	/// GPS HDOP horizontal dilution of position. If unknown, set to: 65535
	public let eph: UInt16

	/// GPS VDOP vertical dilution of position. If unknown, set to: 65535
	public let epv: UInt16

	/// GPS ground speed. If unknown, set to: 65535
	public let vel: UInt16

	/// GPS velocity in NORTH direction in earth-fixed NED frame
	public let vn: Int16

	/// GPS velocity in EAST direction in earth-fixed NED frame
	public let ve: Int16

	/// GPS velocity in DOWN direction in earth-fixed NED frame
	public let vd: Int16

	/// Course over ground (NOT heading, but direction of movement), 0.0..359.99 degrees. If unknown, set to: 65535
	public let cog: UInt16

	/// Number of satellites visible. If unknown, set to 255
	public let satellitesVisible: UInt8
}

extension HilGPS: Message {
    public static let id = UInt8(113)
    public static var typeName = "HIL_GPS"
    public static var typeDescription = "The global position, as returned by the Global Positioning System (GPS). This is NOT the global position estimate of the sytem, but rather a RAW sensor value. See message GLOBAL_POSITION for the global position estimate."
    public static var fieldDefinitions: [FieldDefinition] = [("timeUsec", 0, "UInt64", 0, "Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number."), ("fixType", 34, "UInt8", 0, "0-1: no fix, 2: 2D fix, 3: 3D fix. Some applications will not use the value of this field unless it is at least two, so always correctly fill in the fix."), ("lat", 8, "Int32", 0, "Latitude (WGS84)"), ("lon", 12, "Int32", 0, "Longitude (WGS84)"), ("alt", 16, "Int32", 0, "Altitude (MSL). Positive for up."), ("eph", 20, "UInt16", 0, "GPS HDOP horizontal dilution of position. If unknown, set to: 65535"), ("epv", 22, "UInt16", 0, "GPS VDOP vertical dilution of position. If unknown, set to: 65535"), ("vel", 24, "UInt16", 0, "GPS ground speed. If unknown, set to: 65535"), ("vn", 26, "Int16", 0, "GPS velocity in NORTH direction in earth-fixed NED frame"), ("ve", 28, "Int16", 0, "GPS velocity in EAST direction in earth-fixed NED frame"), ("vd", 30, "Int16", 0, "GPS velocity in DOWN direction in earth-fixed NED frame"), ("cog", 32, "UInt16", 0, "Course over ground (NOT heading, but direction of movement), 0.0..359.99 degrees. If unknown, set to: 65535"), ("satellitesVisible", 35, "UInt8", 0, "Number of satellites visible. If unknown, set to 255")]

    public init(data: Data) throws {
		timeUsec = try data.number(at: 0)
		lat = try data.number(at: 8)
		lon = try data.number(at: 12)
		alt = try data.number(at: 16)
		eph = try data.number(at: 20)
		epv = try data.number(at: 22)
		vel = try data.number(at: 24)
		vn = try data.number(at: 26)
		ve = try data.number(at: 28)
		vd = try data.number(at: 30)
		cog = try data.number(at: 32)
		fixType = try data.number(at: 34)
		satellitesVisible = try data.number(at: 35)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 36)
		try payload.set(timeUsec, at: 0)
		try payload.set(lat, at: 8)
		try payload.set(lon, at: 12)
		try payload.set(alt, at: 16)
		try payload.set(eph, at: 20)
		try payload.set(epv, at: 22)
		try payload.set(vel, at: 24)
		try payload.set(vn, at: 26)
		try payload.set(ve, at: 28)
		try payload.set(vd, at: 30)
		try payload.set(cog, at: 32)
		try payload.set(fixType, at: 34)
		try payload.set(satellitesVisible, at: 35)
        return payload
    }
}
