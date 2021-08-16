//
//  RecommendationsResponse.swift
//  Spotify
//
//  Created by Bryan Guerra on 4/24/21.
//

import Foundation
struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
