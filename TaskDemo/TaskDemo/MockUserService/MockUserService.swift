import Foundation
import ClientAPI

class MockUserService: UserServiceable {
    func getAllUserData(completion: @escaping (Result<[User], Error>) -> Void) {
        let mockUsers = [
            User(id: 1, name: "John Doe", email: "john@example.com", phone: "8788888888", website: "www.john.com"),
            User(id: 2, name: "Jane Smith", email: "jane@example.com", phone: "8788888882", website: "www.jane.com")
        ]
        completion(.success(mockUsers))
    }
}
