


import Foundation
import Firebase
import UIKit

class FirebaseSmsAuthentication {
    
    // 電話番号を引数とし確認コードを送信する関数
    static func phoneAuthSend(phoneNumber: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                // Sign in using the verificationID and the code sent to the user
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                return
            }
        }
    }
    // 確認コードを使ってユーザーをログインさせる関数
    static func phoneAuthReceive(verificationCode: String) {
        let verificationID: String! = UserDefaults.standard.string(forKey: "authVerificationID")
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        // FIRPhoneAuthCredentialオブジェクトを使用してユーザーをログインさせます。
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                // User is signed in
            }
        }
    }
    
}
