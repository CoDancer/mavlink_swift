//
//  MAVLinkModel.swift
//  swift_link
//
//  Created by CoDancer on 2019/6/22.
//  Copyright © 2019 IOS. All rights reserved.
//

import UIKit

class MAVLinkModel: NSObject {
    
    var testHeartbeatMessage: Heartbeat {
        
        return Heartbeat(type: MAVType(rawValue: 6)!,
                         autopilot: MAVAutopilot(rawValue: 8)!,
                         baseMode:.autoEnabled,
                         customMode: 0,
                         systemStatus: MAVState(rawValue: 0)!,
                         mavlinkVersion: 1)
    }
    
    func receivePacketMessage() {
        
        let delegate = MAVLinkManager(didReceive: { packet, channel, mavlink in
            
            print(packet)
        })
        
        let mavLink = MAVLink()
        mavLink.delegate = delegate
    }

    func dispatchDidPutProperSystemId() {
        
        var callsCount = 0
        let systemId = UInt8(0xFF)
        
        let delegate = MAVLinkManager(didFinalize: { _, _, data, _, _ in
            
            assert(data[3] == systemId, "Fourth byte of MAVLink packet should be system id (\(systemId))")
            callsCount += 1
        })
        
        let mavLink = MAVLink()
        mavLink.delegate = delegate
        try! mavLink.dispatch(message: testHeartbeatMessage, systemId: systemId, componentId: 0, channel: 0)
        
        assert(callsCount == 1, "MAVLink instance should return exactly one finalized packet from provided message")
    }
    
    func dispatchDidPutProperMessageId() {
        
        var callsCount = 0
        
        let delegate = MAVLinkManager(didFinalize: { _, _, data, _, _ in
            assert(data[5] == Heartbeat.id, "Sixth byte of MAVLink packet should be message id (in this specific case \(Heartbeat.id))")
            
            callsCount += 1
        })
        
        let mavLink = MAVLink()
        mavLink.parse(data: Data(), channel: 05) { (message, packet) in
            
        }
        mavLink.delegate = delegate
        try! mavLink.dispatch(message: testHeartbeatMessage, systemId: 0, componentId: 0, channel: 0)
        
        assert(callsCount == 1, "MAVLink instance should return exactly one finalized packet from provided message")
    }
    
    func dispatchDidPutProperComponentId() {
        
        var callsCount = 0
        let componentId = UInt8(0xFF)
        
        let delegate = MAVLinkManager(didFinalize: { _, _, data, _, _ in
            assert(data[4] == componentId, "Fifth byte of generated MAVLink packet should contain component id (\(componentId))")
            
            callsCount += 1
        })
        
        let mavLink = MAVLink()
        mavLink.delegate = delegate
        try! mavLink.dispatch(message: testHeartbeatMessage, systemId: 0, componentId: componentId, channel: 0)
        
        assert(callsCount == 1, "MAVLink instance should return exactly one finalized packet from provided message")
    }
    
}
