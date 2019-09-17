//
//  WindCovCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Wind covariance estimate from vehicle.
public struct WindCov {

	/// Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number.
	public let timeUsec: UInt64

	/// Wind in X (NED) direction
	public let windX: Float

	/// Wind in Y (NED) direction
	public let windY: Float

	/// Wind in Z (NED) direction
	public let windZ: Float

	/// Variability of the wind in XY. RMS of a 1 Hz lowpassed wind estimate.
	public let varHoriz: Float

	/// Variability of the wind in Z. RMS of a 1 Hz lowpassed wind estimate.
	public let varVert: Float

	/// Altitude (MSL) that this measurement was taken at
	public let windAlt: Float

	/// Horizontal speed 1-STD accuracy
	public let horizAccuracy: Float

	/// Vertical speed 1-STD accuracy
	public let vertAccuracy: Float
}

extension WindCov: Message {
    public static let id = UInt8(231)
    public static var typeName = "WIND_COV"
    public static var typeDescription = "Wind covariance estimate from vehicle."
    public static var fieldDefinitions: [FieldDefinition] = [("timeUsec", 0, "UInt64", 0, "Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since 1.1.1970 or since system boot) by checking for the magnitude the number."), ("windX", 8, "Float", 0, "Wind in X (NED) direction"), ("windY", 12, "Float", 0, "Wind in Y (NED) direction"), ("windZ", 16, "Float", 0, "Wind in Z (NED) direction"), ("varHoriz", 20, "Float", 0, "Variability of the wind in XY. RMS of a 1 Hz lowpassed wind estimate."), ("varVert", 24, "Float", 0, "Variability of the wind in Z. RMS of a 1 Hz lowpassed wind estimate."), ("windAlt", 28, "Float", 0, "Altitude (MSL) that this measurement was taken at"), ("horizAccuracy", 32, "Float", 0, "Horizontal speed 1-STD accuracy"), ("vertAccuracy", 36, "Float", 0, "Vertical speed 1-STD accuracy")]

    public init(data: Data) throws {
		timeUsec = try data.number(at: 0)
		windX = try data.number(at: 8)
		windY = try data.number(at: 12)
		windZ = try data.number(at: 16)
		varHoriz = try data.number(at: 20)
		varVert = try data.number(at: 24)
		windAlt = try data.number(at: 28)
		horizAccuracy = try data.number(at: 32)
		vertAccuracy = try data.number(at: 36)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 40)
		try payload.set(timeUsec, at: 0)
		try payload.set(windX, at: 8)
		try payload.set(windY, at: 12)
		try payload.set(windZ, at: 16)
		try payload.set(varHoriz, at: 20)
		try payload.set(varVert, at: 24)
		try payload.set(windAlt, at: 28)
		try payload.set(horizAccuracy, at: 32)
		try payload.set(vertAccuracy, at: 36)
        return payload
    }
}
