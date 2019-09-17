//
//  DebugCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Send a debug value. The index is used to discriminate between values. These values show up in the plot of QGroundControl as DEBUG N.
public struct Debug {

	/// Timestamp (time since system boot).
	public let timeBootMs: UInt32

	/// index of debug variable
	public let ind: UInt8

	/// DEBUG value
	public let value: Float
}

extension Debug: Message {
    public static let id = UInt8(254)
    public static var typeName = "DEBUG"
    public static var typeDescription = "Send a debug value. The index is used to discriminate between values. These values show up in the plot of QGroundControl as DEBUG N."
    public static var fieldDefinitions: [FieldDefinition] = [("timeBootMs", 0, "UInt32", 0, "Timestamp (time since system boot)."), ("ind", 8, "UInt8", 0, "index of debug variable"), ("value", 4, "Float", 0, "DEBUG value")]

    public init(data: Data) throws {
		timeBootMs = try data.number(at: 0)
		value = try data.number(at: 4)
		ind = try data.number(at: 8)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 9)
		try payload.set(timeBootMs, at: 0)
		try payload.set(value, at: 4)
		try payload.set(ind, at: 8)
        return payload
    }
}
