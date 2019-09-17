//
//  ParamSetCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Set a parameter value (write new value to permanent storage). IMPORTANT: The receiving component should acknowledge the new parameter value by sending a PARAM_VALUE message to all communication partners. This will also ensure that multiple GCS all have an up-to-date list of all parameters. If the sending GCS did not receive a PARAM_VALUE message within its timeout time, it should re-send the PARAM_SET message. The parameter microservice is documented at https://mavlink.io/en/services/parameter.html
public struct ParamSet {

	/// System ID
	public let targetSystem: UInt8

	/// Component ID
	public let targetComponent: UInt8

	/// Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the ID is stored as string
	public let paramId: String

	/// Onboard parameter value
	public let paramValue: Float

	/// Onboard parameter type.
	public let paramType: MAVParamType
}

extension ParamSet: Message {
    public static let id = UInt8(23)
    public static var typeName = "PARAM_SET"
    public static var typeDescription = "Set a parameter value (write new value to permanent storage). IMPORTANT: The receiving component should acknowledge the new parameter value by sending a PARAM_VALUE message to all communication partners. This will also ensure that multiple GCS all have an up-to-date list of all parameters. If the sending GCS did not receive a PARAM_VALUE message within its timeout time, it should re-send the PARAM_SET message. The parameter microservice is documented at https://mavlink.io/en/services/parameter.html"
    public static var fieldDefinitions: [FieldDefinition] = [("targetSystem", 4, "UInt8", 0, "System ID"), ("targetComponent", 5, "UInt8", 0, "Component ID"), ("paramId", 6, "String", 16, "Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the ID is stored as string"), ("paramValue", 0, "Float", 0, "Onboard parameter value"), ("paramType", 22, "MAVParamType", 0, "Onboard parameter type.")]

    public init(data: Data) throws {
		paramValue = try data.number(at: 0)
		targetSystem = try data.number(at: 4)
		targetComponent = try data.number(at: 5)
		paramId = try data.string(at: 6, length: 16)
		paramType = try data.enumeration(at: 22)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 23)
		try payload.set(paramValue, at: 0)
		try payload.set(targetSystem, at: 4)
		try payload.set(targetComponent, at: 5)
		try payload.set(paramId, at: 6, length: 16)
		try payload.set(paramType, at: 22)
        return payload
    }
}
