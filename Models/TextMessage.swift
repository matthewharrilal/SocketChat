//
//  TextMessage.swift
//  SocketChat
//
//  Created by Matthew Harrilal on 4/13/18.
//  Copyright © 2018 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

struct TextMessage {
    
    // Creating a model for the structure that the text messages will be taking
    var authorOfMessage: String
    var textOfMessage: String
    
    init(authorOfMessage: String, textOfMessage: String) {
        self.authorOfMessage = authorOfMessage
        self.textOfMessage = textOfMessage
    }
}
