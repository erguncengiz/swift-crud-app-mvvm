import UIKit

protocol HomeViewProtocol {
    func viewWillPresent(data: AccountModel)
}

class HomeView: UIViewController, HomeViewProtocol {
    
    private var ui = HomeUI()
    var viewModel : HomeViewModel! {
        willSet {
            newValue.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchData()
    }
    
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    func viewWillPresent(data: AccountModel) {
        ui.object = data
        ui.tableView.reloadData()
    }
}

extension HomeView : HomeUIDelegate {
    func uiDidSelect(object: AccountModel) {
        viewModel.didReceiveUISelect(object: object)
    }
}
