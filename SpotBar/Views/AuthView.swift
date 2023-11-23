//
//  AuthView.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-17.
//

import SwiftUI
import WebKit

struct AuthView: View {
    var body: some View {
        WebView(url: "https://www.google.com").frame(maxHeight:500.0)
    }
}
