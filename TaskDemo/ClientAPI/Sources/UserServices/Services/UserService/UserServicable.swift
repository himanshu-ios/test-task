import Foundation

public protocol UserServiceable {
    @available(iOS 15, macOS 12, *)
    func getAllUserData(completion: @escaping (Result<[User], Error>) -> Void)
}
