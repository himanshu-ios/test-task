public struct User: Identifiable, Codable {
    public let id: Int
    public let name: String
    public let email: String
    public let phone: String?
    public let website: String?
    
    public init(id: Int,
                name: String,
                email: String,
                phone: String?,
                website: String?) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
    }
}
