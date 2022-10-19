import UIKit
import Alamofire

class CustomAccountCell: UITableViewCell {

    var accountId: String!
    var indexOfUser: Int!
    var delegate : HomeUIDelegate?
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userJobTitle: UILabel!
    @IBOutlet weak var userEditButton: UIButton!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add the UI components
        self.addSubview(userImage)
        self.addSubview(userName)
        self.addSubview(userJobTitle)
        self.addSubview(userEditButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    @IBAction func deleteDidTap(_ sender: UIButton) {
        //TODO: user preloader when user tried to delete!
        self.delegate?.deleteDidTapped(indexOfAccount: self.indexOfUser)
        NetworkManager.instance.request(HTTPMethod.delete, url: Endpoints.delete.baseUrl(id: accountId ?? "0"), requestModel: nil, model: Account.self) { response in
            switch(response)
            {
            case .success(_):
                print("User deleted successfully!")
                //
            case .failure(_):
                print("Error while deleting user!")
            }
        }
    }
}
