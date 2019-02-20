import Vapor

final class ListController {
    func index(_ request: Request) throws -> Future<List> {
        guard let futureList = try? request.parameters.next(List.self) else {
            throw Abort(.badRequest)
        }
        return futureList
    }

    func create(_ request: Request) throws -> Future<List> {
        return try request.content.decode(List.self).flatMap { List in
            return List.save(on: request)
        }
    }

    func delete(_ request: Request) throws -> Future<HTTPStatus> {
        return try request.parameters.next(List.self).flatMap { List in
            return List.delete(on: request)
        }.transform(to: .ok)
    }
}
