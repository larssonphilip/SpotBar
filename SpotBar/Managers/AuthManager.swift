//
//  AuthManager.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-17.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    var isUserSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpiresAt: Date? {
        return nil
    }
    
    private var timeToRefreshToken: Bool {
        return false
    }
}
