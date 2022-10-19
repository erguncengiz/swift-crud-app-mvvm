import UIKit

protocol HomeViewProtocol {
    func viewWillPresent(data: AccountModel)
}

class HomeView: UIViewController, HomeViewProtocol {
    
    @IBOutlet weak var addAccountButton: UIBarButtonItem!
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

    @IBAction func addAccountDidTapped(_ sender: Any) {
        //
    }
}

extension HomeView : HomeUIDelegate {

    func deleteDidTapped(indexOfAccount: Int) {
        ui.object?.remove(at: indexOfAccount)
        ui.tableView.deleteRows(at: [IndexPath(row: indexOfAccount, section: 0)], with: .fade)
    }
    
    func uiDidSelect(object: AccountModel) {
        viewModel.didReceiveUISelect(object: object)
    }
}
