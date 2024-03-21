import XCTest
@testable import TaskDemo

final class UserViewModelTests: XCTestCase {
    var viewModel: UserListViewModel!

       override func setUp() {
           super.setUp()
           viewModel = UserListViewModel(userService: MockUserService())
       }

       override func tearDown() {
           viewModel = nil
           super.tearDown()
       }

    func testFetchUsers() {
        let expectation = XCTestExpectation(description: "Fetch users data")

        viewModel.fetchUsers()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.viewModel.users.count, 2, "User count should be 2 after fetching data")

            XCTAssertEqual(self.viewModel.users[0].name, "John Doe", "First user's name should be John Doe")
            XCTAssertEqual(self.viewModel.users[0].email, "john@example.com", "First user's email should be john@example.com")

            XCTAssertEqual(self.viewModel.users[1].name, "Jane Smith", "Second user's name should be Jane Smith")
            XCTAssertEqual(self.viewModel.users[1].email, "jane@example.com", "Second user's email should be jane@example.com")

            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled, or timeout after 5 seconds
        wait(for: [expectation], timeout: 5.0)
    }

}
