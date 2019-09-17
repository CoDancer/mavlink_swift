//
//  SetModeCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Set the system mode, as defined by enum MAV_MODE. There is no target component id as the mode is by definition for the overall aircraft, not only for one component.
public struct SetMode {

	/// The system setting the mode
	public let targetSystem: UInt8

	/// The new base mode.
	public let baseMode: MAVMode

	/// The new autopilot-specific mode. This field can be ignored by an autopilot.
	public let customMode: UInt32
}

extension SetMode: Message {
    public static let id = UInt8(11)
    public static var typeName = "SET_MODE"
    public static var typeDescription = "Set the system mode, as defined by enum MAV_MODE. There is no target component id as the mode is by definition for the overall aircraft, not only for one component."
    public static var fieldDefinitions: [FieldDefinition] = [("targetSystem", 4, "UInt8", 0, "The system setting the mode"), ("baseMode", 5, "MAVMode", 0, "The new base mode."), ("customMode", 0, "UInt32", 0, "The new autopilot-specific mode. This field can be ignored by an autopilot.")]

    public init(data: Data) throws {
		customMode = try data.number(at: 0)
		targetSystem = try data.number(at: 4)
		baseMode = try data.enumeration(at: 5)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 6)
		try payload.set(customMode, at: 0)
		try payload.set(targetSystem, at: 4)
		try payload.set(baseMode, at: 5)
        return payload
    }
}
