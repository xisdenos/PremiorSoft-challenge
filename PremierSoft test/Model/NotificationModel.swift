//
//  NotificationModel.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import Foundation

struct Notifications: Decodable {
    
    let notifications: [Content]
}

struct Content: Decodable {
    let id: String
    let isRead: Bool
    let content: String
}
