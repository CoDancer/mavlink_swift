//
//  MissionRequestIntCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Request the information of the mission item with the sequence number seq. The response of the system to this message should be a MISSION_ITEM_INT message. https://mavlink.io/en/services/mission.html
public struct MissionRequestInt {

	/// System ID
	public let targetSystem: UInt8

	/// Component ID
	public let targetComponent: UInt8

	/// Sequence
	public let seq: UInt16
}

extension MissionRequestInt: Message {
    public static let id = UInt8(51)
    public static var typeName = "MISSION_REQUEST_INT"
    public static var typeDescription = "Request the information of the mission item with the sequence number seq. The response of the system to this message should be a MISSION_ITEM_INT message. https://mavlink.io/en/services/mission.html"
    public static var fieldDefinitions: [FieldDefinition] = [("targetSystem", 2, "UInt8", 0, "System ID"), ("targetComponent", 3, "UInt8", 0, "Component ID"), ("seq", 0, "UInt16", 0, "Sequence")]

    public init(data: Data) throws {
		seq = try data.number(at: 0)
		targetSystem = try data.number(at: 2)
		targetComponent = try data.number(at: 3)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 4)
		try payload.set(seq, at: 0)
		try payload.set(targetSystem, at: 2)
		try payload.set(targetComponent, at: 3)
        return payload
    }
}
