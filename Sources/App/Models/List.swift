import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class List: SQLiteModel {
    var id: Int?
    var name: String

    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension List: Migration { }

extension List: Content { }

extension List: Parameter { }
