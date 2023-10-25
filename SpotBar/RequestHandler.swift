//
//  RequestHandler.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-10-25.
//

import SwiftUI

struct RequestHandler {
    
    func fetchAccessToken(clientId: String, clientSecret: String) -> String{
        var accessToken = ""
        let grantTypeStr = "grant_type=client_credentials&client_id=\(clientId)&client_secret=\(clientSecret)"
        let url = URL(string: "https://accounts.spotify.com/api/token")!
        let dispatch = DispatchGroup()
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = grantTypeStr.data(using: .utf8)
        
        dispatch.enter()
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let tokenResponse = try? JSONDecoder().decode(TokenResponse.self, from: data) {
                    accessToken = tokenResponse.access_token
                }
            }
            dispatch.leave()
        }.resume()
        
        dispatch.wait()
        
        return accessToken
    }
    
    func getCurrentSong() {}
    
    func getNextSongInQueue() {}
    
    func playPauseSong() {}
    
    func previousSong() {}
    
    func nextSong() {}
    
}

struct TokenResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
}

