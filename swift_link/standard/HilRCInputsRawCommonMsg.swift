//
//  HilRCInputsRawCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Sent from simulation to autopilot. The RAW values of the RC channels received. The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%. Individual receivers/transmitters might violate this specification.
public struct HilRCInputsRaw {

	/// Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number.
	public let timeUsec: UInt64

	/// RC channel 1 value
	public let chan1Raw: UInt16

	/// RC channel 2 value
	public let chan2Raw: UInt16

	/// RC channel 3 value
	public let chan3Raw: UInt16

	/// RC channel 4 value
	public let chan4Raw: UInt16

	/// RC channel 5 value
	public let chan5Raw: UInt16

	/// RC channel 6 value
	public let chan6Raw: UInt16

	/// RC channel 7 value
	public let chan7Raw: UInt16

	/// RC channel 8 value
	public let chan8Raw: UInt16

	/// RC channel 9 value
	public let chan9Raw: UInt16

	/// RC channel 10 value
	public let chan10Raw: UInt16

	/// RC channel 11 value
	public let chan11Raw: UInt16

	/// RC channel 12 value
	public let chan12Raw: UInt16

	/// Receive signal strength indicator in device-dependent units/scale. Values: [0-254], 255: invalid/unknown.
	public let rssi: UInt8
}

extension HilRCInputsRaw: Message {
    public static let id = UInt8(92)
    public static var typeName = "HIL_RC_INPUTS_RAW"
    public static var typeDescription = "Sent from simulation to autopilot. The RAW values of the RC channels received. The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%. Individual receivers/transmitters might violate this specification."
    public static var fieldDefinitions: [FieldDefinition] = [("timeUsec", 0, "UInt64", 0, "Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number."), ("chan1Raw", 8, "UInt16", 0, "RC channel 1 value"), ("chan2Raw", 10, "UInt16", 0, "RC channel 2 value"), ("chan3Raw", 12, "UInt16", 0, "RC channel 3 value"), ("chan4Raw", 14, "UInt16", 0, "RC channel 4 value"), ("chan5Raw", 16, "UInt16", 0, "RC channel 5 value"), ("chan6Raw", 18, "UInt16", 0, "RC channel 6 value"), ("chan7Raw", 20, "UInt16", 0, "RC channel 7 value"), ("chan8Raw", 22, "UInt16", 0, "RC channel 8 value"), ("chan9Raw", 24, "UInt16", 0, "RC channel 9 value"), ("chan10Raw", 26, "UInt16", 0, "RC channel 10 value"), ("chan11Raw", 28, "UInt16", 0, "RC channel 11 value"), ("chan12Raw", 30, "UInt16", 0, "RC channel 12 value"), ("rssi", 32, "UInt8", 0, "Receive signal strength indicator in device-dependent units/scale. Values: [0-254], 255: invalid/unknown.")]

    public init(data: Data) throws {
		timeUsec = try data.number(at: 0)
		chan1Raw = try data.number(at: 8)
		chan2Raw = try data.number(at: 10)
		chan3Raw = try data.number(at: 12)
		chan4Raw = try data.number(at: 14)
		chan5Raw = try data.number(at: 16)
		chan6Raw = try data.number(at: 18)
		chan7Raw = try data.number(at: 20)
		chan8Raw = try data.number(at: 22)
		chan9Raw = try data.number(at: 24)
		chan10Raw = try data.number(at: 26)
		chan11Raw = try data.number(at: 28)
		chan12Raw = try data.number(at: 30)
		rssi = try data.number(at: 32)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 33)
		try payload.set(timeUsec, at: 0)
		try payload.set(chan1Raw, at: 8)
		try payload.set(chan2Raw, at: 10)
		try payload.set(chan3Raw, at: 12)
		try payload.set(chan4Raw, at: 14)
		try payload.set(chan5Raw, at: 16)
		try payload.set(chan6Raw, at: 18)
		try payload.set(chan7Raw, at: 20)
		try payload.set(chan8Raw, at: 22)
		try payload.set(chan9Raw, at: 24)
		try payload.set(chan10Raw, at: 26)
		try payload.set(chan11Raw, at: 28)
		try payload.set(chan12Raw, at: 30)
		try payload.set(rssi, at: 32)
        return payload
    }
}
