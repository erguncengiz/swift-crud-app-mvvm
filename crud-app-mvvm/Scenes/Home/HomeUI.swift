import UIKit

protocol HomeUIDelegate {
    func uiDidSelect(object: AccountModel)
}

class HomeUI : UIView {
    var delegate: HomeUIDelegate!
    
    var object : AccountModel?
    var cellIdentifier = "HomeCellId"
    
    lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        
        tbl.register(UINib(nibName: "CustomAccountCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupConstraints()
    }
}

extension HomeUI {

    private func setupUIElements() {
        // arrange subviews
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        // add constraints to subviews
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

extension HomeUI: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomAccountCell
        let url = URL(string: object?[indexPath.row].avatar ?? "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg")
        let data = try? Data(contentsOf: url!)
        cell.userImage.image = UIImage(data: data!)
        cell.userJobTitle.text = object?[indexPath.row].jobTitle ?? "-"
        cell.userName.text = ("\(object?[indexPath.row].name ?? "-") \( object?[indexPath.row].surname ?? "-")")
        return cell
    }
}

extension HomeUI: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.uiDidSelect(object: self.object!)
    }
}

