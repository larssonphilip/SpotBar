//
//  SongInfoImageOverlay.swift
//  SpotifyTaskBar
//
//  Created by Philip Larsson on 2023-10-12.
//

import SwiftUI

struct SongInfoImageOverlay: View {
    @State private var artistAndSongText: String = "Placeholder Artist - Placeholder Song Title"
    var body: some View {
        ZStack {
            Text(artistAndSongText)
                .tag(1)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(.leading, 6)
    }
    
    public func updateSongTitle(artist: String, songTitle: String) {
        artistAndSongText = "\(artist) - \(songTitle)"
    }
}
