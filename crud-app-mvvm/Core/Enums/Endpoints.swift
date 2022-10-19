enum Endpoints {
    case create
    case delete
    case put
    case get
    
    func baseUrl(id: String?) -> String {
        switch self {
        case .get:
            return "https://6340108ee44b83bc73c812f2.mockapi.io/account"
        case .create:
            return "https://6340108ee44b83bc73c812f2.mockapi.io/account"
        case .delete:
            return "https://6340108ee44b83bc73c812f2.mockapi.io/account/\(id!)"
        case .put:
            return "https://6340108ee44b83bc73c812f2.mockapi.io/account/\(id!)"
        }
    }
}
