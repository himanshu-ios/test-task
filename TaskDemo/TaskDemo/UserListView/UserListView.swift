import SwiftUI
import ClientAPI

struct UserListView: View {
    @ObservedObject var viewModel = UserListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                UserRowView(user: user)
            }
            .navigationBarTitle("Employees")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
        .accessibilityIdentifier("userList")
    }
}

struct UserRowView: View {
    var user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
                .accessibilityIdentifier("userName")
            Text(user.email)
                .font(.subheadline)
                .accessibilityIdentifier("userEmail")
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
