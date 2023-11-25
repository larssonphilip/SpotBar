//
//  MusicPlayer.swift
//  SpotifyTaskBar
//
//  Created by Philip Larsson on 2023-10-12.
//

import SwiftUI

struct MusicPlayerView: View {
    @State private var progress = 0.0
    let requestHandler = RequestManager()
    let secrets = Secrets()
    func playMusic() {
        requestHandler.fetchAccessToken(clientId: secrets.clientId, clientSecret: secrets.clientSecret)
    }
    
    func pauseMusic() {
        
    }
    
    func nextSong() {
        
    }
    
    func previousSong() {
        
    }
    
    func shuffleSongs() {
        
    }
    
    func repeatPlaylist() {
        
    }
    
    var body: some View {
        VStack(spacing:0) {
            ProgressView(value: progress, total: 100)
                        .progressViewStyle(LinearProgressViewStyle())
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                self.progress += 1
                            }
                        }
                        .tint(Color(red: 31/255, green: 214/255, blue: 95/255))
                        .foregroundColor(Color(red: 62/255, green: 62/255, blue: 62/255))
                        .background(Color.clear)
            HStack(spacing:25) {
                Button(action: repeatPlaylist, label: { Image(systemName:"repeat") })
                    .background(Color.clear)
                    .buttonStyle(PlainButtonStyle())
                Button(action: previousSong, label: { Image(systemName:"backward.end.alt.fill") })
                    .background(Color.clear)
                    .buttonStyle(PlainButtonStyle())
                Button(action: playMusic, label: { Image(systemName:"play.fill") })
                    .background(Color.clear)
                    .buttonStyle(PlainButtonStyle())
                Button(action: nextSong, label: { Image(systemName:"forward.end.alt.fill") })
                    .background(Color.clear)
                    .buttonStyle(PlainButtonStyle())
                Button(action: shuffleSongs, label: { Image(systemName:"shuffle") })
                    .background(Color.clear)
                    .buttonStyle(PlainButtonStyle())
            }.frame(minHeight: 75.0)
            
        }.onAppear()
            .background(Color(red: 18/255, green: 18/255, blue: 18/255))
    }
}

struct MusicPlayerView_Previews : PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
