//
//  MAVLinkManager.swift
//  swift_link
//
//  Created by CoDancer on 2019/6/22.
//  Copyright © 2019 IOS. All rights reserved.
//

import UIKit

class MAVLinkManager: NSObject {

    typealias DidReceiveHandler = (Packet, Channel, MAVLink) -> Void
    typealias DidFailToReceiveHandler = (Packet?, MAVLinkError, Channel, MAVLink) -> Void
    typealias DidParseHandler = (Message, Packet, Channel, MAVLink) -> Void
    typealias DidFailToParseMessageHandler = (Packet, MAVLinkError, Channel, MAVLink) -> Void
    typealias DidFinalizeHandler = (Message, Packet, Data, Channel, MAVLink) -> Void
    
    var didReceive: DidReceiveHandler?
    var didFailToReceive: DidFailToReceiveHandler?
    var didParse: DidParseHandler?
    var didFailToParseMessage: DidFailToParseMessageHandler?
    var didFinalize: DidFinalizeHandler?
    
    init(didReceive: DidReceiveHandler? = nil, didFailToReceive: DidFailToReceiveHandler? = nil, didParse: DidParseHandler? = nil, didFailToParseMessage: DidFailToParseMessageHandler? = nil, didFinalize: DidFinalizeHandler? = nil) {
        self.didReceive = didReceive
        self.didFailToReceive = didFailToReceive
        self.didParse = didParse
        self.didFailToParseMessage = didFailToParseMessage
        self.didFinalize = didFinalize
    }
}

extension MAVLinkManager: MAVLinkDelegate {
    
    func didReceive(packet: Packet, on channel: Channel, via link: MAVLink) {
        didReceive?(packet, channel, link)
    }
    
    func didFailToReceive(packet: Packet?, with error: MAVLinkError, on channel: Channel, via link: MAVLink) {
        didFailToReceive?(packet, error, channel, link)
    }
    
    func didParse(message: Message, from packet: Packet, on channel: Channel, via link: MAVLink) {
        didParse?(message, packet, channel, link)
    }
    
    func didFailToParseMessage(from packet: Packet, with error: MAVLinkError, on channel: Channel, via link: MAVLink) {
        didFailToParseMessage?(packet, error, channel, link)
    }
    
    func didFinalize(message: Message, from packet: Packet, to data: Data, on channel: Channel, in link: MAVLink) {
        didFinalize?(message, packet, data, channel, link)
    }
}
