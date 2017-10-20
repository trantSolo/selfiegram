//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Trant Solo on 18.10.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet var imageView: WKInterfaceImage!
    
    private var watchSession:WCSession?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Apple Watch Session
        
        if WCSession.isSupported() {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func nextWasTapped() {
        watchSession?.sendMessage(["Next" : "next"], replyHandler: nil, errorHandler: nil)
    }
    
    @IBAction func likeWasTapped()
    {
        watchSession?.sendMessage(["Like" : "like"], replyHandler: nil, errorHandler: nil)
    }
}

extension InterfaceController {
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        
        guard let image = UIImage(data: messageData) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.imageView.setImage(image)
        }
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
