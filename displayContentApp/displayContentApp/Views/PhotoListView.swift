import UIKit

class PhotoListView: UIView {
    
    lazy var photoTableView: UITableView = {
        var photoTableView = UITableView()
        return photoTableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        photoTableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(photoTableView)
        
        NSLayoutConstraint.activate([
            photoTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photoTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photoTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            photoTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func reloadData() {
        photoTableView.reloadData()
    }
}
