import Foundation
import UIKit

class LoginViewController: UIViewController {
    private var tryPassword: String?
    var loginService = LoginService.shared
    
    private let loginView = LoginView()
    var onLoginButtonTapped: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { _ in }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewDelegate {
    func signinButtonPressed(buttonState: ButtonState, password: String) {
        if buttonState == .signUp { // регистрируем нового пользователя
            if password.lengthOfBytes(using: .utf8) < 4 { // неверный формат пароля
                showAlert(message: "Пароль должен состоять минимум из четырёх символов.")
            } else if !UserDefaults.standard.bool(forKey: "password") { // первый раз введен пароль
                    tryPassword = password
                    loginView.setSignInButtonTitle(title: "Повторите пароль")
                    loginView.resetPasswordTextField()
                    UserDefaults.standard.set(true, forKey: "password")
            } else if tryPassword == password { // проверям повторный ввод пароля
                loginService.signUp(password: password)
                UserDefaults.standard.set(true, forKey: "password")
                loginView.buttonState = .signIn
                self.onLoginButtonTapped?()
            } else {
                showAlert(message: "Пароли не совпадают")
                UserDefaults.standard.set(false, forKey: "password")
                loginView.setSignInButtonTitle(title: "Создать пароль")
                loginView.resetPasswordTextField()
            }
        } else if loginService.signInCheck(password: password) { // проверяем существующий пароль
            self.onLoginButtonTapped?()
        } else {
            showAlert(message: "Неверный пароль")
        }
    }
}
