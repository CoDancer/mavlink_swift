//
//  TimesyncCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Time synchronization message.
public struct Timesync {

	/// Time sync timestamp 1
	public let tc1: Int64

	/// Time sync timestamp 2
	public let ts1: Int64
}

extension Timesync: Message {
    public static let id = UInt8(111)
    public static var typeName = "TIMESYNC"
    public static var typeDescription = "Time synchronization message."
    public static var fieldDefinitions: [FieldDefinition] = [("tc1", 0, "Int64", 0, "Time sync timestamp 1"), ("ts1", 8, "Int64", 0, "Time sync timestamp 2")]

    public init(data: Data) throws {
		tc1 = try data.number(at: 0)
		ts1 = try data.number(at: 8)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 16)
		try payload.set(tc1, at: 0)
		try payload.set(ts1, at: 8)
        return payload
    }
}
