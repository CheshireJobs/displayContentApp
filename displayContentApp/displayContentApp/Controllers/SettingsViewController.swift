import Foundation
import UIKit

class SettingsViewController: UIViewController {
    private let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = settingsView
        settingsView.settingsTableView.dataSource = self
        settingsView.settingsTableView.delegate = self
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
           let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsSortTableViewCell.self), for: indexPath) as! SettingsSortTableViewCell
            return cell
        case 1:
            let cell = UITableViewCell()
            cell.textLabel?.text = "Поменять пароль"
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            UserDefaults.standard.set(false, forKey: "password")
            let loginContoller = LoginViewController()
            loginContoller.loginService.removePassword()
            loginContoller.onLoginButtonTapped = {
                self.navigationController?.dismiss(animated: true)
            }
            navigationController?.present(loginContoller, animated: true)
        }
    }
}
