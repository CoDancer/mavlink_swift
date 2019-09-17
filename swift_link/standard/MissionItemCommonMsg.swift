//
//  MissionItemCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Message encoding a mission item. This message is emitted to announce the presence of a mission item and to set a mission item on the system. The mission item can be either in x, y, z meters (type: LOCAL) or x:lat, y:lon, z:altitude. Local frame is Z-down, right handed (NED), global frame is Z-up, right handed (ENU). See also https://mavlink.io/en/services/mission.html.
public struct MissionItem {

	/// System ID
	public let targetSystem: UInt8

	/// Component ID
	public let targetComponent: UInt8

	/// Sequence
	public let seq: UInt16

	/// The coordinate system of the waypoint.
	public let frame: MAVFrame

	/// The scheduled action for the waypoint.
	public let command: MAVCmd

	/// false:0, true:1
	public let current: UInt8

	/// Autocontinue to next waypoint
	public let autocontinue: UInt8

	/// PARAM1, see MAV_CMD enum
	public let param1: Float

	/// PARAM2, see MAV_CMD enum
	public let param2: Float

	/// PARAM3, see MAV_CMD enum
	public let param3: Float

	/// PARAM4, see MAV_CMD enum
	public let param4: Float

	/// PARAM5 / local: X coordinate, global: latitude
	public let x: Float

	/// PARAM6 / local: Y coordinate, global: longitude
	public let y: Float

	/// PARAM7 / local: Z coordinate, global: altitude (relative or absolute, depending on frame).
	public let z: Float
}

extension MissionItem: Message {
    public static let id = UInt8(39)
    public static var typeName = "MISSION_ITEM"
    public static var typeDescription = "Message encoding a mission item. This message is emitted to announce the presence of a mission item and to set a mission item on the system. The mission item can be either in x, y, z meters (type: LOCAL) or x:lat, y:lon, z:altitude. Local frame is Z-down, right handed (NED), global frame is Z-up, right handed (ENU). See also https://mavlink.io/en/services/mission.html."
    public static var fieldDefinitions: [FieldDefinition] = [("targetSystem", 32, "UInt8", 0, "System ID"), ("targetComponent", 33, "UInt8", 0, "Component ID"), ("seq", 28, "UInt16", 0, "Sequence"), ("frame", 34, "MAVFrame", 0, "The coordinate system of the waypoint."), ("command", 30, "MAVCmd", 0, "The scheduled action for the waypoint."), ("current", 35, "UInt8", 0, "false:0, true:1"), ("autocontinue", 36, "UInt8", 0, "Autocontinue to next waypoint"), ("param1", 0, "Float", 0, "PARAM1, see MAV_CMD enum"), ("param2", 4, "Float", 0, "PARAM2, see MAV_CMD enum"), ("param3", 8, "Float", 0, "PARAM3, see MAV_CMD enum"), ("param4", 12, "Float", 0, "PARAM4, see MAV_CMD enum"), ("x", 16, "Float", 0, "PARAM5 / local: X coordinate, global: latitude"), ("y", 20, "Float", 0, "PARAM6 / local: Y coordinate, global: longitude"), ("z", 24, "Float", 0, "PARAM7 / local: Z coordinate, global: altitude (relative or absolute, depending on frame).")]

    public init(data: Data) throws {
		param1 = try data.number(at: 0)
		param2 = try data.number(at: 4)
		param3 = try data.number(at: 8)
		param4 = try data.number(at: 12)
		x = try data.number(at: 16)
		y = try data.number(at: 20)
		z = try data.number(at: 24)
		seq = try data.number(at: 28)
		command = try data.enumeration(at: 30)
		targetSystem = try data.number(at: 32)
		targetComponent = try data.number(at: 33)
		frame = try data.enumeration(at: 34)
		current = try data.number(at: 35)
		autocontinue = try data.number(at: 36)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 37)
		try payload.set(param1, at: 0)
		try payload.set(param2, at: 4)
		try payload.set(param3, at: 8)
		try payload.set(param4, at: 12)
		try payload.set(x, at: 16)
		try payload.set(y, at: 20)
		try payload.set(z, at: 24)
		try payload.set(seq, at: 28)
		try payload.set(command, at: 30)
		try payload.set(targetSystem, at: 32)
		try payload.set(targetComponent, at: 33)
		try payload.set(frame, at: 34)
		try payload.set(current, at: 35)
		try payload.set(autocontinue, at: 36)
        return payload
    }
}
