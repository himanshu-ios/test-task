import Foundation

public class UserService: UserServiceable {
    public init() {}

    @available(iOS 13.0.0, *)
    public func getAllUserData(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: Configuration.getUserUrlPath) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        NetworkManager.shared.fetchData(from: url) { (result: Result<[User], NetworkError>) in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
