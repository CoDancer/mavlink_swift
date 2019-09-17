//
//  ServoOutputRawCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// The RAW values of the servo outputs (for RC input from the remote, use the RC_CHANNELS messages). The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%.
public struct ServoOutputRaw {

	/// Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number.
	public let timeUsec: UInt32

	/// Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN, 1 = AUX.
	public let port: UInt8

	/// Servo output 1 value
	public let servo1Raw: UInt16

	/// Servo output 2 value
	public let servo2Raw: UInt16

	/// Servo output 3 value
	public let servo3Raw: UInt16

	/// Servo output 4 value
	public let servo4Raw: UInt16

	/// Servo output 5 value
	public let servo5Raw: UInt16

	/// Servo output 6 value
	public let servo6Raw: UInt16

	/// Servo output 7 value
	public let servo7Raw: UInt16

	/// Servo output 8 value
	public let servo8Raw: UInt16
}

extension ServoOutputRaw: Message {
    public static let id = UInt8(36)
    public static var typeName = "SERVO_OUTPUT_RAW"
    public static var typeDescription = "The RAW values of the servo outputs (for RC input from the remote, use the RC_CHANNELS messages). The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%."
    public static var fieldDefinitions: [FieldDefinition] = [("timeUsec", 0, "UInt32", 0, "Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number."), ("port", 20, "UInt8", 0, "Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN, 1 = AUX."), ("servo1Raw", 4, "UInt16", 0, "Servo output 1 value"), ("servo2Raw", 6, "UInt16", 0, "Servo output 2 value"), ("servo3Raw", 8, "UInt16", 0, "Servo output 3 value"), ("servo4Raw", 10, "UInt16", 0, "Servo output 4 value"), ("servo5Raw", 12, "UInt16", 0, "Servo output 5 value"), ("servo6Raw", 14, "UInt16", 0, "Servo output 6 value"), ("servo7Raw", 16, "UInt16", 0, "Servo output 7 value"), ("servo8Raw", 18, "UInt16", 0, "Servo output 8 value")]

    public init(data: Data) throws {
		timeUsec = try data.number(at: 0)
		servo1Raw = try data.number(at: 4)
		servo2Raw = try data.number(at: 6)
		servo3Raw = try data.number(at: 8)
		servo4Raw = try data.number(at: 10)
		servo5Raw = try data.number(at: 12)
		servo6Raw = try data.number(at: 14)
		servo7Raw = try data.number(at: 16)
		servo8Raw = try data.number(at: 18)
		port = try data.number(at: 20)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 21)
		try payload.set(timeUsec, at: 0)
		try payload.set(servo1Raw, at: 4)
		try payload.set(servo2Raw, at: 6)
		try payload.set(servo3Raw, at: 8)
		try payload.set(servo4Raw, at: 10)
		try payload.set(servo5Raw, at: 12)
		try payload.set(servo6Raw, at: 14)
		try payload.set(servo7Raw, at: 16)
		try payload.set(servo8Raw, at: 18)
		try payload.set(port, at: 20)
        return payload
    }
}
