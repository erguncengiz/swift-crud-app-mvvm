/// Account Model
struct Account {
    typealias didFetchSuccess = (Account)->()
    typealias didFailWithError = (Error?) -> ()
    
    // Your Model Structure
    var id : Int?
    var name : String?
    var surname : String?
    var avatar : String?
    var createdAt : String?
    var jobTitle : String?
    
    func didFetch(withSuccess: @escaping didFetchSuccess, withError: @escaping didFailWithError) {
        withSuccess(Account())
        withError(nil)
    }
}
