import UIKit

final class SettingsCoordinator: Coordinator {
    var navigationController = UINavigationController()
    
    func start() {
        let settingsViewController = SettingsViewController()
        
        navigationController.setViewControllers([settingsViewController], animated: false)
        navigationController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gear.circle.fill"), tag: 1)
    }
}
