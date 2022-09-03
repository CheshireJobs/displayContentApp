import Foundation

protocol LoginViewDelegate: AnyObject {
    func signinButtonPressed(buttonState: ButtonState, password: String)
}
