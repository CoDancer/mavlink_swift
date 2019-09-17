//
//  VisionSpeedEstimateCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Speed estimate from a vision source.
public struct VisionSpeedEstimate {

	/// Timestamp (UNIX time or time since system boot)
	public let usec: UInt64

	/// Global X speed
	public let x: Float

	/// Global Y speed
	public let y: Float

	/// Global Z speed
	public let z: Float
}

extension VisionSpeedEstimate: Message {
    public static let id = UInt8(103)
    public static var typeName = "VISION_SPEED_ESTIMATE"
    public static var typeDescription = "Speed estimate from a vision source."
    public static var fieldDefinitions: [FieldDefinition] = [("usec", 0, "UInt64", 0, "Timestamp (UNIX time or time since system boot)"), ("x", 8, "Float", 0, "Global X speed"), ("y", 12, "Float", 0, "Global Y speed"), ("z", 16, "Float", 0, "Global Z speed")]

    public init(data: Data) throws {
		usec = try data.number(at: 0)
		x = try data.number(at: 8)
		y = try data.number(at: 12)
		z = try data.number(at: 16)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 20)
		try payload.set(usec, at: 0)
		try payload.set(x, at: 8)
		try payload.set(y, at: 12)
		try payload.set(z, at: 16)
        return payload
    }
}
