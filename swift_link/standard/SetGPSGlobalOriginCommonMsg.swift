//
//  SetGPSGlobalOriginCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// As local waypoints exist, the global waypoint reference allows to transform between the local coordinate frame and the global (GPS) coordinate frame. This can be necessary when e.g. in- and outdoor settings are connected and the MAV should move from in- to outdoor.
public struct SetGPSGlobalOrigin {

	/// System ID
	public let targetSystem: UInt8

	/// Latitude (WGS84)
	public let latitude: Int32

	/// Longitude (WGS84)
	public let longitude: Int32

	/// Altitude (MSL). Positive for up.
	public let altitude: Int32
}

extension SetGPSGlobalOrigin: Message {
    public static let id = UInt8(48)
    public static var typeName = "SET_GPS_GLOBAL_ORIGIN"
    public static var typeDescription = "As local waypoints exist, the global waypoint reference allows to transform between the local coordinate frame and the global (GPS) coordinate frame. This can be necessary when e.g. in- and outdoor settings are connected and the MAV should move from in- to outdoor."
    public static var fieldDefinitions: [FieldDefinition] = [("targetSystem", 12, "UInt8", 0, "System ID"), ("latitude", 0, "Int32", 0, "Latitude (WGS84)"), ("longitude", 4, "Int32", 0, "Longitude (WGS84)"), ("altitude", 8, "Int32", 0, "Altitude (MSL). Positive for up.")]

    public init(data: Data) throws {
		latitude = try data.number(at: 0)
		longitude = try data.number(at: 4)
		altitude = try data.number(at: 8)
		targetSystem = try data.number(at: 12)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 13)
		try payload.set(latitude, at: 0)
		try payload.set(longitude, at: 4)
		try payload.set(altitude, at: 8)
		try payload.set(targetSystem, at: 12)
        return payload
    }
}
