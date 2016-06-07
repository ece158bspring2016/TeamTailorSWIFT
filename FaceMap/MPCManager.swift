//
//  MPCManager.swift
//
//  Created by Corey Baker on 4/11/16.
//  Copyright © 2016 University of California San Diego - ECE 158B. All rights reserved.
//  
//  Followed and made additions to original tutorial by Gabriel Theodoropoulos - http://www.appcoda.com/intro-multipeer-connectivity-framework-ios-programming/
//

import MultipeerConnectivity


protocol MPCManagerDelegate {
    func foundPeer()
    
    func lostPeer()
    
    func invitationWasReceived(fromPeer: String)
    
    func connectedWithPeer(peerID: MCPeerID)
}

class MPCManager: NSObject, MCSessionDelegate, MCNearbyServiceBrowserDelegate, MCNearbyServiceAdvertiserDelegate {
    
    var delegate:MPCManagerDelegate?
    var session: MCSession!
    var peer: MCPeerID!
    var browser: MCNearbyServiceBrowser!
    var advertiser: MCNearbyServiceAdvertiser!
    var foundPeers = [MCPeerID]()
    var invitationHandler: ((Bool, MCSession) ->Void)!
    var connectionState: Int
    
    var dict = [MCPeerID : String]()
    
    override init(){
        
        connectionState = -1
        super.init()
        
        //Initialize variables 
        peer = MCPeerID(displayName: "facemap")
        print("(0)")
        
        /*
        //session = MCSession(peer: peer, securityIdentity: [myIdentity], encryptionPreference: MCEncryptionPreference.Required)
        session = MCSession(peer: peer)
        session.delegate = self
        
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: kAppName)
        browser.delegate = self
        
        //TODO: When need to add new information to advertiser. Stop it, and reinitialize
        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: kAppName)
        advertiser.delegate = self
        */
    
    }
    
    //Update Info
    func updatePeer(ss: String, feels: String){
        peer = MCPeerID(displayName: ss)
        print("Updated!")
        
        //session = MCSession(peer: peer, securityIdentity: [myIdentity], encryptionPreference: MCEncryptionPreference.Required)
        session = MCSession(peer: peer)
        session.delegate = self
        
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: kAppName)
        browser.delegate = self
        
        //TODO: When need to add new information to advertiser. Stop it, and reinitialize
        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: ["emotion" : feels], serviceType: kAppName)
        print("!!!!!!!!!DISCOVERY!!!!!!!")
        print(advertiser.discoveryInfo)
        advertiser.delegate = self

    }
    
    //BROWSER: 
    //used to find other nearby devices and invite them to join a session
    //Prereq: other devices must advertise themselves
    //Delagete methods
    
    
    
    func browser(browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        
        var peerAlreadyInBrowser = false
        
        //TODO: All discover information for a specific peer will be here. Need to pass it to the foundPeer delegate
        print("BROWSING!")
        print(peerID)
        print(info?.enumerate())
        
        
        //dict[peerID] = info!["emotion"]
        /*
        print("dictionary...")
        for (key, val) in dict {
            print(dict[key])
        }
        */
        
        
        //TODO LATER: Implement faster search function to find peers and remove
        //syntax below: for loop for dictionaries (key, val)
        for (index, aPeer) in foundPeers.enumerate()
        {
            if aPeer == peerID{
                foundPeers.insert(peerID, atIndex: index)
                peerAlreadyInBrowser = true
                break
            }
        }
        
        
        if !peerAlreadyInBrowser{
            foundPeers.append(peerID)
        }
        
        delegate?.foundPeer()
    }
    
    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        for (index, aPeer) in foundPeers.enumerate()
        {
            if aPeer == peerID{
                foundPeers.removeAtIndex(index)
                let messageDictionary: [String: String] = [kCommunicationsMessageTerm: kCommunicationsLostConnectionTerm]
                let dataToSend = NSKeyedArchiver.archivedDataWithRootObject(messageDictionary)
                let dictionary: [String: AnyObject] = [kCommunicationsDataTerm : dataToSend, kCommunicationsFromPeerTerm: aPeer]
                NSNotificationCenter.defaultCenter().postNotificationName("receivedMPCDisconnectionNotification", object: dictionary)
                break
            }
        }
        
        delegate?.lostPeer()
    }
    
    func browser(browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: NSError) {
        print(error.localizedDescription)
    }
    
    
    //ADVERTISER:
    //This class is responsible for advertising a device, 
    //meaning making the device visible or not to others, 
    //and for accepting or not invitations from other peers for connecting to sessions.

    func advertiser(advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: NSData?, invitationHandler: ((Bool, MCSession) -> Void)) {
        
        self.invitationHandler = invitationHandler
        
        //Information user is interested in should be in "withContext" and passed to invitationWasReceived
        delegate?.invitationWasReceived(peerID.displayName)
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: NSError) {
        print("ERROR:")
        print(error.localizedDescription)
    }
    
    //SESSION:
    //connection established between two peers, 
    //after the first one has invited the second
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        print("!!!!STATE!!!!")
        switch state{
        case MCSessionState.Connected:
            print("Connected to session: \(session)")
            delegate?.connectedWithPeer(peerID)
            connectionState = 0
        case MCSessionState.Connecting:
            print("Connecting to session \(session)")
            connectionState = 1
        case MCSessionState.NotConnected:
            connectionState = 2
            print("Not connected to session \(session)")

            /*
            let alert = UIAlertView()
            alert.title = "Connection Terminated"
            //alert.message = "Connection failed"
            alert.addButtonWithTitle("Dismiss")
            alert.show()
*/
            let messageDictionary: [String: String] = [kCommunicationsMessageTerm: kCommunicationsLostConnectionTerm]
            let dataToSend = NSKeyedArchiver.archivedDataWithRootObject(messageDictionary)
            let dictionary: [String: AnyObject] = [kCommunicationsDataTerm : dataToSend, kCommunicationsFromPeerTerm: peerID]
            NSNotificationCenter.defaultCenter().postNotificationName("receivedMPCChatDataNotification", object: dictionary)
            
        }
        
        
        
        print(connectionState)
    }
    
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
    
        //REMEMBER: Do not remove the following lines, they are needed to receive Messages from peer
        let dictionary: [String: AnyObject] = [
            kCommunicationsDataTerm: data,
            kCommunicationsFromPeerTerm: peerID]
        NSNotificationCenter.defaultCenter().postNotificationName("receivedMPCChatDataNotification", object: dictionary)
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        
    }
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(session: MCSession, didReceiveCertificate certificate: [AnyObject]?, fromPeer peerID: MCPeerID, certificateHandler: ((Bool) -> Void)) {
       
        //This is needed if certificates are not implement. Ommitting will not allow MPC to connect
        certificateHandler(true)
    }
    
    
    func sendData(dictionaryWithData dictionary: Dictionary<String,String>, toPeer targetPeer: MCPeerID) -> Bool {
        
        //This is the data that gets sent to peer
        let dataToSend = NSKeyedArchiver.archivedDataWithRootObject(dictionary)
        let peersArray = [targetPeer]
        
        do {
            try session.sendData(dataToSend, toPeers: peersArray, withMode: MCSessionSendDataMode.Reliable)
        }catch let error as NSError {
            
            print(error.localizedDescription)
            return false
        }
        
        return true
    }
    
}
