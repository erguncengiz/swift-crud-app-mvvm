import Alamofire

/// Account Entity
struct Account : Codable {
    typealias didFetchSuccess = (AccountModel)->()
    typealias didFailWithError = (Error?) -> ()
    
    var createdAt, name: String?
    var avatar: String?
    var surname, jobTitle, id: String?
    
    var baseUrl : String {
        return "https://6340108ee44b83bc73c812f2.mockapi.io/account"
    }
    
    func didFetch(withSuccess: @escaping didFetchSuccess, withError: @escaping didFailWithError) {
        var accountModel: AccountModel?
            NetworkManager.instance.fetch(HTTPMethod.get, url: baseUrl, requestModel: nil, model: AccountModel.self ) { response in
                switch(response)
                {
                    case .success(let model):
                    accountModel = model as? AccountModel
                    //
                    withSuccess(accountModel ?? [])
                    case .failure(_): withError(nil)
                }
            }
    }
}

typealias AccountModel = [Account]
