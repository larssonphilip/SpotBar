//
//  AuthView.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-17.
//

import SwiftUI
import WebKit

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                
                Spacer()
                
                NavigationLink(destination: WebView(url: "http://google.com"), label: { Text("Sign in with Spotify")
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                    .font(.system(size: 18))}
                )
                .padding(.top, 50.0)
                .padding(.bottom, 50.0)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
            }
        }
    }
}

struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
