//
//  TerrainReportCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from standard.xml, common.xml on Sat Jun 22 2019 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Response from a TERRAIN_CHECK request
public struct TerrainReport {

	/// Latitude
	public let lat: Int32

	/// Longitude
	public let lon: Int32

	/// grid spacing (zero if terrain at this location unavailable)
	public let spacing: UInt16

	/// Terrain height MSL
	public let terrainHeight: Float

	/// Current vehicle height above lat/lon terrain height
	public let currentHeight: Float

	/// Number of 4x4 terrain blocks waiting to be received or read from disk
	public let pending: UInt16

	/// Number of 4x4 terrain blocks in memory
	public let loaded: UInt16
}

extension TerrainReport: Message {
    public static let id = UInt8(136)
    public static var typeName = "TERRAIN_REPORT"
    public static var typeDescription = "Response from a TERRAIN_CHECK request"
    public static var fieldDefinitions: [FieldDefinition] = [("lat", 0, "Int32", 0, "Latitude"), ("lon", 4, "Int32", 0, "Longitude"), ("spacing", 16, "UInt16", 0, "grid spacing (zero if terrain at this location unavailable)"), ("terrainHeight", 8, "Float", 0, "Terrain height MSL"), ("currentHeight", 12, "Float", 0, "Current vehicle height above lat/lon terrain height"), ("pending", 18, "UInt16", 0, "Number of 4x4 terrain blocks waiting to be received or read from disk"), ("loaded", 20, "UInt16", 0, "Number of 4x4 terrain blocks in memory")]

    public init(data: Data) throws {
		lat = try data.number(at: 0)
		lon = try data.number(at: 4)
		terrainHeight = try data.number(at: 8)
		currentHeight = try data.number(at: 12)
		spacing = try data.number(at: 16)
		pending = try data.number(at: 18)
		loaded = try data.number(at: 20)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 22)
		try payload.set(lat, at: 0)
		try payload.set(lon, at: 4)
		try payload.set(terrainHeight, at: 8)
		try payload.set(currentHeight, at: 12)
		try payload.set(spacing, at: 16)
		try payload.set(pending, at: 18)
		try payload.set(loaded, at: 20)
        return payload
    }
}
