//
//  CurrentlyPlaying.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-11-25.
//

import SwiftUI

struct CurrentlyPlaying: Codable {
    let currentProgressInMs: Int
    let isPlaying: Bool
}
