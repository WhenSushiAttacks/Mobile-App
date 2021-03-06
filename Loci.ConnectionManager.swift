//
//  ConnectionManager.swift
//  Loci
//
//  Created by Jonathan Kingsley on 02/08/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

//import Foundation
//import PeerKit
//import MultipeerConnectivity

//protocol MPCSerializable {
//    var mpcSerialized: NSData { get }
//    init(mpcSerialized: NSData)
//}
//
//enum Event: String {
//    case Bump = "Bump",
//    AnswerBump = "AnswerBump",
//    CancelBump = "CancelBump",
//    SendData = "SendData"
//}
//
//struct ConnectionManager {
//    
//    // Properties
//    private static var peers: [MCPeerID] {
//        return PeerKit.session?.connectedPeers as! [MCPeerID]? ?? []
//    }
//    
////    static var otherPlayers: [Player] {
////        return peers.map { Player(peer: $0) }
////    }
////    
////    static var allPlayers: [Player] { return [Player.getMe()] + otherPlayers }
//    
//    // Start
//    
//    static func start() {
//        PeerKit.transceive("loci-local-bump")
//    }
//    
//    // Event Handling
//    
//    static func onConnect(run: PeerBlock?) {
//        PeerKit.onConnect = run
//    }
//    
//    static func onDisconnect(run: PeerBlock?) {
//        PeerKit.onDisconnect = run
//    }
//    
//    static func onEvent(event: Event, run: ObjectBlock?) {
//        if let run = run {
//            PeerKit.eventBlocks[event.rawValue] = run
//        } else {
//            PeerKit.eventBlocks.removeValueForKey(event.rawValue)
//        }
//    }
//    
//    // Sending
//    static func sendEvent(event: Event, object: [String: MPCSerializable]? = nil, toPeers peers: [MCPeerID]? = PeerKit.session?.connectedPeers as! [MCPeerID]?) {
//        var anyObject: [String: NSData]?
//        if let object = object {
//            anyObject = [String: NSData]()
//            for (key, value) in object {
//                anyObject![key] = value.mpcSerialized
//            }
//        }
//        PeerKit.sendEvent(event.rawValue, object: anyObject, toPeers: peers)
//    }
//    
//    static func sendEventForEach(event: Event, objectBlock: () -> ([String: MPCSerializable])) {
//        for peer in ConnectionManager.peers {
//            ConnectionManager.sendEvent(event, object: objectBlock(), toPeers: [peer])
//        }
//    }
//}