//
//  AppMenu.swift
//  SpotifyTaskBar
//
//  Created by Philip Larsson on 2023-10-09.
//

import SwiftUI

struct AppMenu: View {
    var body: some View {
        VStack {
            VStack(spacing:0) {
                Image("CoverPlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(SongInfoImageOverlay(), alignment: .bottomLeading)
                    .padding(0)
                
                MusicPlayer()
            }
            
            
        }.frame(maxHeight: 500.0)
    }
}
