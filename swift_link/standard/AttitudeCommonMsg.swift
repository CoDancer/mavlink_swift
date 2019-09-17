//
//  AttitudeCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// The attitude in the aeronautical frame (right-handed, Z-down, X-front, Y-right).
public struct Attitude {

	/// Timestamp (time since system boot).
	public let timeBootMs: UInt32

	/// Roll angle (-pi..+pi)
	public let roll: Float

	/// Pitch angle (-pi..+pi)
	public let pitch: Float

	/// Yaw angle (-pi..+pi)
	public let yaw: Float

	/// Roll angular speed
	public let rollspeed: Float

	/// Pitch angular speed
	public let pitchspeed: Float

	/// Yaw angular speed
	public let yawspeed: Float
}

extension Attitude: Message {
    public static let id = UInt8(30)
    public static var typeName = "ATTITUDE"
    public static var typeDescription = "The attitude in the aeronautical frame (right-handed, Z-down, X-front, Y-right)."
    public static var fieldDefinitions: [FieldDefinition] = [("timeBootMs", 0, "UInt32", 0, "Timestamp (time since system boot)."), ("roll", 4, "Float", 0, "Roll angle (-pi..+pi)"), ("pitch", 8, "Float", 0, "Pitch angle (-pi..+pi)"), ("yaw", 12, "Float", 0, "Yaw angle (-pi..+pi)"), ("rollspeed", 16, "Float", 0, "Roll angular speed"), ("pitchspeed", 20, "Float", 0, "Pitch angular speed"), ("yawspeed", 24, "Float", 0, "Yaw angular speed")]

    public init(data: Data) throws {
		timeBootMs = try data.number(at: 0)
		roll = try data.number(at: 4)
		pitch = try data.number(at: 8)
		yaw = try data.number(at: 12)
		rollspeed = try data.number(at: 16)
		pitchspeed = try data.number(at: 20)
		yawspeed = try data.number(at: 24)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 28)
		try payload.set(timeBootMs, at: 0)
		try payload.set(roll, at: 4)
		try payload.set(pitch, at: 8)
		try payload.set(yaw, at: 12)
		try payload.set(rollspeed, at: 16)
		try payload.set(pitchspeed, at: 20)
		try payload.set(yawspeed, at: 24)
        return payload
    }
}
