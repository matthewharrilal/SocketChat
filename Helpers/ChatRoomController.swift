//
//  ChatRoomController.swift
//  SocketChat
//
//  Created by Matthew Harrilal on 4/12/18.
//  Copyright © 2018 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class ChatRoomController: NSObject {
    
    // Creating the two properties that allow us to open a socket connection from client to server
    
    // When using these two properties allow us to create a connection from client to the server
    var inputStream: InputStream! // Provides read access to stream data
    var outputStream: OutputStream! // Provided write access to stream data
    
    var username: String = ""
    
    // Delcaration of variable the limits the size of a message
    let maxReadLength = 4096
    
    func setUpNetworkCommunication() {
        // This function is going to be used to connect the client to the server
        
        // Declaring a property that allows us to read data from the stream
        var readStream: Unmanaged<CFReadStream>?
        
        // Declaring a propert that allows us to write data to the stream
        var writeStream: Unmanaged<CFWriteStream>?
        
        // Binding the read and write socket streams to the host running on port 1234 allows us to read and write byte data
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "52.91.109.76" as CFString, 1234, &readStream, &writeStream)
        
        
        // By calling retained value on these unmanaged objects allows ARC to automatically deallocate them therefore there will not be a memory leak
        self.inputStream = readStream?.takeRetainedValue() as! InputStream // This gives us access to read data from the input stream
        self.outputStream = writeStream?.takeRetainedValue() as! OutputStream // Gives us access to write data to the output stream
        
        // Creating a run loop for both of our streams so that they can coordinate and respond to events occuring on the thread, purpose to keep thread busy when there is work to do and sleeping when there is no work
        self.inputStream.schedule(in: .current, forMode: .commonModes) // Not thread safe to call run loops
        self.outputStream.schedule(in: .current, forMode: .commonModes) // on any other thread than the current thread
        
        // Opens the connections of the following streams
        self.inputStream.open()
        self.outputStream.open()
    }
    
}
