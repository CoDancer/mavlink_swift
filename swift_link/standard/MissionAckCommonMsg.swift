//
//  MissionAckCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Acknowledgment message during waypoint handling. The type field states if this message is a positive ack (type=0) or if an error happened (type=non-zero).
public struct MissionAck {

	/// System ID
	public let targetSystem: UInt8

	/// Component ID
	public let targetComponent: UInt8

	/// Mission result.
	public let type: MAVMissionResult
}

extension MissionAck: Message {
    public static let id = UInt8(47)
    public static var typeName = "MISSION_ACK"
    public static var typeDescription = "Acknowledgment message during waypoint handling. The type field states if this message is a positive ack (type=0) or if an error happened (type=non-zero)."
    public static var fieldDefinitions: [FieldDefinition] = [("targetSystem", 0, "UInt8", 0, "System ID"), ("targetComponent", 1, "UInt8", 0, "Component ID"), ("type", 2, "MAVMissionResult", 0, "Mission result.")]

    public init(data: Data) throws {
		targetSystem = try data.number(at: 0)
		targetComponent = try data.number(at: 1)
		type = try data.enumeration(at: 2)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 3)
		try payload.set(targetSystem, at: 0)
		try payload.set(targetComponent, at: 1)
		try payload.set(type, at: 2)
        return payload
    }
}
