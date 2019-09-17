//
//  GPSRTKCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// RTK GPS data. Gives information on the relative baseline calculation the GPS is reporting
public struct GPSRTK {

	/// Time since boot of last baseline message received.
	public let timeLastBaselineMs: UInt32

	/// Identification of connected RTK receiver.
	public let rtkReceiverId: UInt8

	/// GPS Week Number of last baseline
	public let wn: UInt16

	/// GPS Time of Week of last baseline
	public let tow: UInt32

	/// GPS-specific health report for RTK data.
	public let rtkHealth: UInt8

	/// Rate of baseline messages being received by GPS
	public let rtkRate: UInt8

	/// Current number of sats used for RTK calculation.
	public let nsats: UInt8

	/// Coordinate system of baseline
	public let baselineCoordsType: RTKBaselineCoordinateSystem

	/// Current baseline in ECEF x or NED north component.
	public let baselineAMm: Int32

	/// Current baseline in ECEF y or NED east component.
	public let baselineBMm: Int32

	/// Current baseline in ECEF z or NED down component.
	public let baselineCMm: Int32

	/// Current estimate of baseline accuracy.
	public let accuracy: UInt32

	/// Current number of integer ambiguity hypotheses.
	public let iarNumHypotheses: Int32
}

extension GPSRTK: Message {
    public static let id = UInt8(127)
    public static var typeName = "GPS_RTK"
    public static var typeDescription = "RTK GPS data. Gives information on the relative baseline calculation the GPS is reporting"
    public static var fieldDefinitions: [FieldDefinition] = [("timeLastBaselineMs", 0, "UInt32", 0, "Time since boot of last baseline message received."), ("rtkReceiverId", 30, "UInt8", 0, "Identification of connected RTK receiver."), ("wn", 28, "UInt16", 0, "GPS Week Number of last baseline"), ("tow", 4, "UInt32", 0, "GPS Time of Week of last baseline"), ("rtkHealth", 31, "UInt8", 0, "GPS-specific health report for RTK data."), ("rtkRate", 32, "UInt8", 0, "Rate of baseline messages being received by GPS"), ("nsats", 33, "UInt8", 0, "Current number of sats used for RTK calculation."), ("baselineCoordsType", 34, "RTKBaselineCoordinateSystem", 0, "Coordinate system of baseline"), ("baselineAMm", 8, "Int32", 0, "Current baseline in ECEF x or NED north component."), ("baselineBMm", 12, "Int32", 0, "Current baseline in ECEF y or NED east component."), ("baselineCMm", 16, "Int32", 0, "Current baseline in ECEF z or NED down component."), ("accuracy", 20, "UInt32", 0, "Current estimate of baseline accuracy."), ("iarNumHypotheses", 24, "Int32", 0, "Current number of integer ambiguity hypotheses.")]

    public init(data: Data) throws {
		timeLastBaselineMs = try data.number(at: 0)
		tow = try data.number(at: 4)
		baselineAMm = try data.number(at: 8)
		baselineBMm = try data.number(at: 12)
		baselineCMm = try data.number(at: 16)
		accuracy = try data.number(at: 20)
		iarNumHypotheses = try data.number(at: 24)
		wn = try data.number(at: 28)
		rtkReceiverId = try data.number(at: 30)
		rtkHealth = try data.number(at: 31)
		rtkRate = try data.number(at: 32)
		nsats = try data.number(at: 33)
		baselineCoordsType = try data.enumeration(at: 34)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 35)
		try payload.set(timeLastBaselineMs, at: 0)
		try payload.set(tow, at: 4)
		try payload.set(baselineAMm, at: 8)
		try payload.set(baselineBMm, at: 12)
		try payload.set(baselineCMm, at: 16)
		try payload.set(accuracy, at: 20)
		try payload.set(iarNumHypotheses, at: 24)
		try payload.set(wn, at: 28)
		try payload.set(rtkReceiverId, at: 30)
		try payload.set(rtkHealth, at: 31)
		try payload.set(rtkRate, at: 32)
		try payload.set(nsats, at: 33)
		try payload.set(baselineCoordsType, at: 34)
        return payload
    }
}
