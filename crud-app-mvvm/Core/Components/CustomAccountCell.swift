import UIKit

class CustomAccountCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userJobTitle: UILabel!
    @IBOutlet weak var userEditButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        // Set any attributes of your UI components here.
//        userName.translatesAutoresizingMaskIntoConstraints = false
//        userName.font = UIFont.systemFont(ofSize: 20)
//
        // Add the UI components
        self.addSubview(userImage)
        self.addSubview(userName)
        self.addSubview(userJobTitle)
        self.addSubview(userEditButton)
        
//        NSLayoutConstraint.activate([
//            userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            userName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
//            userName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            userName.heightAnchor.constraint(equalToConstant: 50)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
