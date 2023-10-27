//
//  RequestHandler.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-10-25.
//

import SwiftUI

struct RequestHandler {
    @State private var accessToken: String = ""
    @State private var accessTokenType: String = ""
    @State var currentlyPlaying: String? = nil
    @State var isPlaying: Bool = false
    func fetchAccessToken(clientId: String, clientSecret: String) {
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
                    accessTokenType = tokenResponse.token_type
                }
            }
            dispatch.leave()
        }.resume()
        
        dispatch.wait()
    }
    
    func getCurrentSong() {
        if accessToken != "" {
            let authorizaztionHeader = "Authorization: \(accessTokenType) \(accessToken)"
            let url = URL(string: "https://api.spotify.com/v1/me/player/currently-playing")
        }
        //https://api.spotify.com/v1/me/player/currently-playing
    }
    
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

struct CurrentlyPlayingResponse: Decodable {
    let currentProgressInMs: Int
    let isPlaying: Bool
    
}

struct TrackObject: Decodable{
    let name: String
    let artists: [ArtistObject]

    struct ArtistObject: Decodable {
        let name: String
    }
    
    struct Album: Decodable {
        let externalUrls: [ExternalUrl]
        
        struct ExternalUrl: Decodable {
            let images: [Image]
            
            struct Image: Decodable {
                let url: String
                let width: Int
                let height: Int
            }
        }
    }
}

