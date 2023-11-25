//
//  HeaderView.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-25.
//

import SwiftUI

struct HeaderView : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.red)

            VStack {
                Text("SpotBar")
                    .font(.system(size:50))
                    .foregroundColor(.white)
                    .bold()
                
                Text("A taskbar app for Spotify")
                    .font(.system(size:16))
                    .foregroundColor(.white)
                
            }
        }.frame(width:300, height:150)
    }
}

struct HeaderView_Previews : PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
