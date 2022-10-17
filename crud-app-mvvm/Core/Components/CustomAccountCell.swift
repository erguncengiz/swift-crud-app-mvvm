import UIKit

class CustomAccountCell: UITableViewCell {

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
}


//CARRY THIS CODE OUT OF HERE
extension UIImageView {
    
    func makeCircleImage() {
        
        layer.borderWidth = 0
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
