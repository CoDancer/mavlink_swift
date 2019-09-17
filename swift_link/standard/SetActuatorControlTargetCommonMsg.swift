//
//  SetActuatorControlTargetCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Set the vehicle attitude and body angular rates.
public struct SetActuatorControlTarget {

	/// Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number.
	public let timeUsec: UInt64

	/// Actuator group. The "_mlx" indicates this is a multi-instance message and a MAVLink parser should use this field to difference between instances.
	public let groupMlx: UInt8

	/// System ID
	public let targetSystem: UInt8

	/// Component ID
	public let targetComponent: UInt8

	/// Actuator controls. Normed to -1..+1 where 0 is neutral position. Throttle for single rotation direction motors is 0..1, negative range for reverse direction. Standard mapping for attitude controls (group 0): (index 0-7): roll, pitch, yaw, throttle, flaps, spoilers, airbrakes, landing gear. Load a pass-through mixer to repurpose them as generic outputs.
	public let controls: [Float]
}

extension SetActuatorControlTarget: Message {
    public static let id = UInt8(139)
    public static var typeName = "SET_ACTUATOR_CONTROL_TARGET"
    public static var typeDescription = "Set the vehicle attitude and body angular rates."
    public static var fieldDefinitions: [FieldDefinition] = [("timeUsec", 0, "UInt64", 0, "Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number."), ("groupMlx", 40, "UInt8", 0, "Actuator group. The \"_mlx\" indicates this is a multi-instance message and a MAVLink parser should use this field to difference between instances."), ("targetSystem", 41, "UInt8", 0, "System ID"), ("targetComponent", 42, "UInt8", 0, "Component ID"), ("controls", 8, "[Float]", 8, "Actuator controls. Normed to -1..+1 where 0 is neutral position. Throttle for single rotation direction motors is 0..1, negative range for reverse direction. Standard mapping for attitude controls (group 0): (index 0-7): roll, pitch, yaw, throttle, flaps, spoilers, airbrakes, landing gear. Load a pass-through mixer to repurpose them as generic outputs.")]

    public init(data: Data) throws {
		timeUsec = try data.number(at: 0)
		controls = try data.array(at: 8, capacity: 8)
		groupMlx = try data.number(at: 40)
		targetSystem = try data.number(at: 41)
		targetComponent = try data.number(at: 42)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 43)
		try payload.set(timeUsec, at: 0)
		try payload.set(controls, at: 8, capacity: 8)
		try payload.set(groupMlx, at: 40)
		try payload.set(targetSystem, at: 41)
		try payload.set(targetComponent, at: 42)
        return payload
    }
}
