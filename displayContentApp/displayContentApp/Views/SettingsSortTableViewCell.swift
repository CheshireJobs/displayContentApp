import Foundation
import UIKit

final class SettingsSortTableViewCell: UITableViewCell {
    let settingNameLabel: UILabel = {
        let photoNameLabel = UILabel()
        photoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoNameLabel.textColor = .black
        photoNameLabel.text = "Сортировка"
        photoNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        photoNameLabel.numberOfLines = 0
        return photoNameLabel
    }()
    
    let settingSwitch: UISwitch = {
        let settingSwitch = UISwitch()
        settingSwitch.isOn = UserDefaults.standard.bool(forKey: "alphabetSort")
        settingSwitch.translatesAutoresizingMaskIntoConstraints = false
        settingSwitch.addTarget(self, action: #selector(switchDidChanged), for: .valueChanged)
        return settingSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(UserDefaults.standard.bool(forKey: "alphabetSort"))
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchDidChanged() {
        print(#function)
        UserDefaults.standard.set(settingSwitch.isOn, forKey: "alphabetSort")
    }
}

private extension SettingsSortTableViewCell {
    func setupConstraints() {
        contentView.addSubview(settingNameLabel)
        contentView.addSubview(settingSwitch)
        
        NSLayoutConstraint.activate([
            settingNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            settingNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            settingSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            settingSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
