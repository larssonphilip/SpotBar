//
//  RequestHandler.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-10-25.
//

import SwiftUI

struct RequestManager {
    @State private var accessToken: String = ""
    @State private var accessTokenType: String = ""
    @State var currentlyPlaying: String? = nil
    @State var isPlaying: Bool = false
    
    public func fetchAccessToken(clientId: String, clientSecret: String) {
        let stringToEncode = "\(clientId):\(clientSecret)"
        var authCode = ""
        
        if let data = stringToEncode.data(using: .utf8) {
            authCode = data.base64EncodedString()
        }
        
        let url = URL(string: "https://accounts.spotify.com/api/token")!
        let dispatch = DispatchGroup()
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic \(authCode)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        let body = ["grant_type": "client_credentials"]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        dispatch.enter()
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let tokenResponse = try? JSONDecoder().decode(Token.self, from: data) {
                    self.accessToken = tokenResponse.access_token
                    self.accessTokenType = tokenResponse.token_type
                } else {
                    print("Error decoding JSON")
                }
            } else {
                print("No data received")
            }
            dispatch.leave()
        }.resume()
        
        dispatch.wait()
    }
    
    func getNextSongInQueue() {}
    
    func playPauseSong() {}
    
    func previousSong() {}
    
    func nextSong() {}
    
}
