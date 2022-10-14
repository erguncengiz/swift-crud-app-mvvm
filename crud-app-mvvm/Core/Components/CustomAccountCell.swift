import UIKit

class CustomAccountCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userJobTitle: UILabel!
    @IBOutlet weak var userEditButton: UIButton!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userImage.maskCircle(anyImage: userImage.image!)
        
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


// extensions
extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
      self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true

   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
   self.image = anyImage
  }
}
