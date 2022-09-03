import Foundation
import KeychainAccess

class LoginService {
    static let shared = LoginService()
    let keychain: Keychain
    
    func signUp(password: String) {
        keychain[password] = password
    }
    
    func signInCheck(password: String) -> Bool {
        guard keychain[password] != nil  else { return false }
        if keychain[password] == password {
            return true
        } else {
            return false
        }
    }
    func removePassword() {
        do {
            try keychain.removeAll()
        } catch let error {
            print(error)
        }
    }
    
    /// Use shared property instead
    private init() {
        keychain = Keychain(service: "com.cheshireJobs.displayContentApp")
    }
}
