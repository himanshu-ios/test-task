import Foundation
import ClientAPI

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    private let userService: UserServiceable

    init(userService: UserServiceable = UserService()) {
        self.userService = userService
    }

    func fetchUsers() {
        userService.getAllUserData { [unowned self] result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.users.append(contentsOf: user)
                }
            case .failure(let error):
                print("Error fetching users: \(error)")
            }
        }
    }
}
