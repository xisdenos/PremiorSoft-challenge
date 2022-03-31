//
//  APIcaller.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import Foundation

struct NotificationsFetcher {
    
    enum NotificationsFetcherError: Error {
        
        case invalidURL
        case missingData
    }
    
    static func fetchNotifications() async throws -> Notifications {
        
        guard let url = URL(string: "https://api.jsonbin.io/b/607db4d70ed6f819beb03020") else {
            throw NotificationsFetcherError.invalidURL
    }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        let dataResult = try JSONDecoder().decode(Notifications.self, from: data)
        return dataResult
    }
}
