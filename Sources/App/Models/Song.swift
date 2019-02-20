//
//  Song.swift
//  App
//
//  Created by Isom,Grant on 2/12/19.
//

import FluentSQLite
import Vapor

final class Song: SQLiteModel {
    var id: Int?
    var listId: Int?
    var name: String
    var artist: String
    var uri: URL
    
    init(id: Int? = nil, listId: Int?, name: String, artist: String, uri: URL) {
        self.id = id
        self.listId = listId
        self.name = name
        self.artist = artist
        self.uri = uri
    }
}

extension Song: Migration { }

extension Song: Content { }

extension Song: Parameter { }
