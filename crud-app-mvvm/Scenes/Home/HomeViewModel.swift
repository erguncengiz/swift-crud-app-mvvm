import Foundation

protocol HomeViewModelProtocol {
    func fetchData()
    func didReceiveUISelect(object: Account)
}

class HomeViewModel {
    var view : HomeViewProtocol!
    var object = Account()
    
    func fetchData() {
        object.didFetch(withSuccess: { (success) in
            self.view.viewWillPresent(data: success)
        }) { (err) in
            debugPrint("Error happened", err as Any)
        }
    }
    
    func didReceiveUISelect(object: Account) {
        debugPrint("Did receive UI object", object)
    }
}
