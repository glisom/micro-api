//
//  SongController.swift
//  App
//
//  Created by Isom,Grant on 2/13/19.
//

import Vapor

final class SongController {
    func index(_ request: Request) throws -> Future<[Song]> {
        return try request.parameters.next(List.self).flatMap { list in
            return Song.query(on: request).filter(\Song.listId, ._equal, list.id).all()
        }
    }
    
    func create(_ request: Request) throws -> Future<Song> {
        return try request.content.decode(Song.self).flatMap { Song in
            return Song.save(on: request)
        }
    }
    
    func delete(_ request: Request) throws -> Future<HTTPStatus> {
        return try request.parameters.next(Song.self).flatMap { Song in
            return Song.delete(on: request)
            }.transform(to: .ok)
    }
}
