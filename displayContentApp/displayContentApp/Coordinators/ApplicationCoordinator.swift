import Foundation
import UIKit

class ApplicationCoordinator: BaseCoordinator, Coordinator {
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    func start() {
        initWindow()
    }
    
    private func initWindow() {
        let loginCoordinator = loginCoordinator()
        addDependency(coordinator: loginCoordinator)
        
        window?.rootViewController = loginCoordinator.navigationController
        window?.makeKeyAndVisible()
        
        loginCoordinator.start()
    }
}
