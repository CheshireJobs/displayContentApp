import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if UserDefaults.standard.object(forKey: "password") == nil {
            UserDefaults.standard.set(false, forKey: "password")
        }
        
        if UserDefaults.standard.object(forKey: "alphabetSort") == nil {
            UserDefaults.standard.set(true, forKey: "alphabetSort")
        }
        
        let applicationCoordinator = ApplicationCoordinator(window: window!)
        applicationCoordinator.start()
        
        return true
    }
}

