//
//  SettingModels.swift
//  Spotify
//
//  Created by Bryan Guerra on 4/18/21.
//

import Foundation

struct Section {
    let tittle: String
    let options: [Options]
    
}

struct Options{
    let title: String
    let handler: () -> Void
    
}
