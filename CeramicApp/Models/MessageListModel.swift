//
//  MessageListModel.swift
//  CeramicApp
//
//  Created by 赵静怡 on 2024/12/2.
//

import SwiftUI
import Foundation
struct MessageListModel: Codable, Hashable {
    var message : String
    var postDate : String
    var isFromUser : Int
    
    init()
    {
        message = ""
        postDate = ""
        isFromUser = 0
    }
}

struct MessageList: Codable
{
    var items: [MessageListModel]
}
