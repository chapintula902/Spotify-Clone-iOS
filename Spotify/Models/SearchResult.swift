//
//  SearchResult.swift
//  Spotify
//
//  Created by Bryan Guerra on 6/23/21.
//

import Foundation
enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
    
    
}
