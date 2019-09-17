//
//  AppDelegate.swift
//  swift_link
//
//  Created by CoDancer on 2019/6/18.
//  Copyright © 2019 IOS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mavLinkHandler = MAVLink()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        mavLinkHandler.delegate = self
        configRootController()
//        mavLinkHandler.receivePacketMessage()
//        mavLinkHandler.dispatchDidPutProperSystemId()
        
        return true
    }
    
    func configRootController() -> Void {
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow.init(frame: MAINSCREEN)
        appDelegate.window?.backgroundColor = UIColor.white
        
        appDelegate.window?.rootViewController = RSBaseNavigationController.init(rootViewController: ViewController())
        appDelegate.window?.makeKeyAndVisible()
    }

}

extension AppDelegate: MAVLinkDelegate {
    func didReceive(packet: Packet, on channel: Channel, via link: MAVLink) {
        print(packet)
    }
    
    func didFailToReceive(packet: Packet?, with error: MAVLinkError, on channel: Channel, via link: MAVLink) {
        
    }
    
    func didParse(message: Message, from packet: Packet, on channel: Channel, via link: MAVLink) {
        
    }
    
    func didFailToParseMessage(from packet: Packet, with error: MAVLinkError, on channel: Channel, via link: MAVLink) {
        
    }
    
    func didFinalize(message: Message, from packet: Packet, to data: Data, on channel: Channel, in link: MAVLink) {
        
    }
    
    
    
}
