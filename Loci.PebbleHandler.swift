//
//  PebbleHandler.swift
//  Loci
//
//  Created by Jonathan Kingsley on 31/07/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

import Foundation

class PebbleHandler: NSObject, PBPebbleCentralDelegate {
    var watch: PBWatch?
    
    override init() {
        super.init()
        let pebble = PBPebbleCentral.defaultCentral()
        pebble.delegate = self
        
        var uuidBytes = Array<UInt8>(count:16, repeatedValue:0)
        let uuid = NSUUID(UUIDString: "4b2b8165-f7c2-46dd-9370-52c050fc20bc")
        uuid?.getUUIDBytes(&uuidBytes)
        pebble.appUUID = NSData(bytes: &uuidBytes, length: uuidBytes.count)
        
        watch = pebble.lastConnectedWatch()
        
        watch!.appMessagesLaunch({ (_, error) in
            if error != nil {
                println("App launched!")
            }
        })
        
        watch?.appMessagesAddReceiveUpdateHandler({(watch, update) -> Bool in
            println("")
  
            return true
        })
    }
    
    func pebbleCentral(central: PBPebbleCentral!, watchDidConnect watch: PBWatch!, isNew: Bool) {
        if self.watch != watch {
            self.watch = watch
        }
    }
    
    func pebbleCentral(central: PBPebbleCentral!, watchDidDisconnect watch: PBWatch!) {
        if self.watch == watch || watch.isEqual(self.watch) {
            self.watch = nil
        }
    }
}