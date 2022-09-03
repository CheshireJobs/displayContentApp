import Foundation
import UIKit

final class loginCoordinator: Coordinator {
    var navigationController = UINavigationController()
    var tabBarController = UITabBarController()
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.onLoginButtonTapped = {
            self.startMainFlow()
        }
        navigationController.setViewControllers([loginViewController], animated: false)
    }
    
    func startMainFlow() {
        let photoCoordinator = PhotoCoordinator()
        let settingsCoordinator = SettingsCoordinator()
        
        tabBarController.viewControllers = [photoCoordinator.navigationController, settingsCoordinator.navigationController]
        navigationController.viewControllers = [tabBarController]
        
        photoCoordinator.start()
        settingsCoordinator.start()
    }
}
