//
//  AppMenu.swift
//  SpotifyTaskBar
//
//  Created by Philip Larsson on 2023-10-09.
//

import SwiftUI

struct AppMenuView: View {
    var body: some View {
        VStack {
            if !AuthManager.shared.isUserSignedIn {
                NavigationView {
                    HStack {
                        Spacer()
                        NavigationLink(destination: LoginView()) {
                            Text("Sign in with Spotify")
                        }.frame(minWidth:285.0, minHeight: 75.0)
                        Spacer()
                    }.frame(alignment: .center)
                }
            } else {
                VStack(spacing:0) {
                    Image("CoverPlaceholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(SongInfoImageOverlayView(), alignment: .bottomLeading)
                        .padding(0)
                    
                    MusicPlayerView()
                }
            }
        }.frame(maxHeight: 500.0)
    }
}
