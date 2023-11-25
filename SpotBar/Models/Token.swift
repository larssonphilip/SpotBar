//
//  TokenResponse.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-25.
//

import SwiftUI

struct Token: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
}
