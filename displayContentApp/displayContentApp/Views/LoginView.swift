import Foundation
import UIKit

enum ButtonState {
    case signIn
    case signUp
}

class LoginView: UIView {
    var delegate: LoginViewDelegate?
    var buttonState = UserDefaults.standard.bool(forKey: "password") ? ButtonState.signIn : ButtonState.signUp
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: passwordTextField.frame.height))
        passwordTextField.leftView = paddingView
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var signinButton: UIButton = {
        let signinButton = UIButton()
        signinButton.setTitle(buttonState == ButtonState.signIn ? "Введите пароль" : "Создать пароль", for: .normal)
        signinButton.setTitleColor(.white, for: .normal)
        signinButton.backgroundColor = .systemGreen
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.layer.cornerRadius = 10
        signinButton.clipsToBounds = true
        signinButton.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)
        return signinButton
    }()
    
    func setSignInButtonTitle(title: String) {
        signinButton.setTitle(title, for: .normal)
    }
    func resetPasswordTextField() {
        passwordTextField.text = ""
    }
    
    @objc private func signinButtonTapped() {
        delegate?.signinButtonPressed(buttonState: buttonState,password: passwordTextField.text ?? "")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(passwordTextField)
        addSubview(signinButton)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 240),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            signinButton.heightAnchor.constraint(equalToConstant: 50),
            signinButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            signinButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            
        ])
    }
    
}
