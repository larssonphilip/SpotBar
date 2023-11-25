//
//  Track.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-25.
//

import Foundation
struct Track: Codable {
    let name: String
    let artists: [ArtistObject]
    let album: Album

    struct ArtistObject: Codable {
        let name: String
    }
    
    struct Album: Codable {
        let images: [Image]
        
        struct Image: Codable {
            let url: String
            let width: Int
            let height: Int
        }
    }
}
