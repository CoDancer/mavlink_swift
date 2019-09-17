//
//  RCChannelsScaledCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// The scaled values of the RC channels received: (-100%) -10000, (0%) 0, (100%) 10000. Channels that are inactive should be set to UINT16_MAX.
public struct RCChannelsScaled {

	/// Timestamp (time since system boot).
	public let timeBootMs: UInt32

	/// Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN, 1 = AUX.
	public let port: UInt8

	/// RC channel 1 value scaled.
	public let chan1Scaled: Int16

	/// RC channel 2 value scaled.
	public let chan2Scaled: Int16

	/// RC channel 3 value scaled.
	public let chan3Scaled: Int16

	/// RC channel 4 value scaled.
	public let chan4Scaled: Int16

	/// RC channel 5 value scaled.
	public let chan5Scaled: Int16

	/// RC channel 6 value scaled.
	public let chan6Scaled: Int16

	/// RC channel 7 value scaled.
	public let chan7Scaled: Int16

	/// RC channel 8 value scaled.
	public let chan8Scaled: Int16

	/// Receive signal strength indicator in device-dependent units/scale. Values: [0-254], 255: invalid/unknown.
	public let rssi: UInt8
}

extension RCChannelsScaled: Message {
    public static let id = UInt8(34)
    public static var typeName = "RC_CHANNELS_SCALED"
    public static var typeDescription = "The scaled values of the RC channels received: (-100%) -10000, (0%) 0, (100%) 10000. Channels that are inactive should be set to UINT16_MAX."
    public static var fieldDefinitions: [FieldDefinition] = [("timeBootMs", 0, "UInt32", 0, "Timestamp (time since system boot)."), ("port", 20, "UInt8", 0, "Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN, 1 = AUX."), ("chan1Scaled", 4, "Int16", 0, "RC channel 1 value scaled."), ("chan2Scaled", 6, "Int16", 0, "RC channel 2 value scaled."), ("chan3Scaled", 8, "Int16", 0, "RC channel 3 value scaled."), ("chan4Scaled", 10, "Int16", 0, "RC channel 4 value scaled."), ("chan5Scaled", 12, "Int16", 0, "RC channel 5 value scaled."), ("chan6Scaled", 14, "Int16", 0, "RC channel 6 value scaled."), ("chan7Scaled", 16, "Int16", 0, "RC channel 7 value scaled."), ("chan8Scaled", 18, "Int16", 0, "RC channel 8 value scaled."), ("rssi", 21, "UInt8", 0, "Receive signal strength indicator in device-dependent units/scale. Values: [0-254], 255: invalid/unknown.")]

    public init(data: Data) throws {
		timeBootMs = try data.number(at: 0)
		chan1Scaled = try data.number(at: 4)
		chan2Scaled = try data.number(at: 6)
		chan3Scaled = try data.number(at: 8)
		chan4Scaled = try data.number(at: 10)
		chan5Scaled = try data.number(at: 12)
		chan6Scaled = try data.number(at: 14)
		chan7Scaled = try data.number(at: 16)
		chan8Scaled = try data.number(at: 18)
		port = try data.number(at: 20)
		rssi = try data.number(at: 21)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 22)
		try payload.set(timeBootMs, at: 0)
		try payload.set(chan1Scaled, at: 4)
		try payload.set(chan2Scaled, at: 6)
		try payload.set(chan3Scaled, at: 8)
		try payload.set(chan4Scaled, at: 10)
		try payload.set(chan5Scaled, at: 12)
		try payload.set(chan6Scaled, at: 14)
		try payload.set(chan7Scaled, at: 16)
		try payload.set(chan8Scaled, at: 18)
		try payload.set(port, at: 20)
		try payload.set(rssi, at: 21)
        return payload
    }
}
