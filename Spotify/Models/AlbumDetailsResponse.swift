//
//  AlbumDetailsResponse.swift
//  Spotify
//
//  Created by Bryan Guerra on 5/8/21.
//

import Foundation

struct AlbumDetailsResponse: Codable {
    let album_type: String
    let artists: [Artist]
    let available_markets: [String]
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: TracksResponse
}


struct TracksResponse: Codable{
    let items: [AudioTrack]
    
}
