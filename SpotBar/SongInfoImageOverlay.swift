//
//  SongInfoImageOverlay.swift
//  SpotifyTaskBar
//
//  Created by Philip Larsson on 2023-10-12.
//

import SwiftUI

struct SongInfoImageOverlay: View {
    var body: some View {
        ZStack {
            Text("Placeholder Artist - Placeholder Song Title")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(.leading, 6)
    }
}
