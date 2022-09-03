import UIKit

final class PhotoCoordinator: Coordinator {
    var navigationController = UINavigationController()
    
    func start() {
        let photoViewController = PhotoListViewController()
        
        navigationController.setViewControllers([photoViewController], animated: false)
        navigationController.tabBarItem = UITabBarItem(title: "Фото", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 1)
    }
}
