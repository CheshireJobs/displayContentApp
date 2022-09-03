import UIKit

class SettingsView: UIView {
    lazy var settingsTableView: UITableView = {
        var settingsTableView = UITableView()
        settingsTableView.register(SettingsSortTableViewCell.self, forCellReuseIdentifier: String(describing: SettingsSortTableViewCell.self))
        return settingsTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(settingsTableView)
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
