//
//  PasswordVC.swift
//  CheckPassword
//
//  Created by Subham Padhi on 15/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class PasswordVC: PasswordView {
    
    let passwordViewModel = PasswordViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpView()
        passwordTextField.delegate = self
        handlePasswordObserverClosure()
    }
}

extension PasswordVC {
    
    func handlePasswordObserverClosure() {
        
        passwordViewModel.passwordString.bind { [unowned self] (value) in
            if (value != "") {
                let progess = self.passwordViewModel.strenghtPercent(passwordStrength: CheckPasswordStrength.shared.checkPasswordStrength(password: value ?? ""))
                var passwordStrengthInfo = PasswordStrengthInfo()
                passwordStrengthInfo = self.passwordViewModel.setProgressbarColor(progress: progess)
                self.setUpProgressInfo(progress: progess, color: passwordStrengthInfo.progressColor ?? UIColor.white, labelText: passwordStrengthInfo.strength.map { $0.rawValue }!)
            } else {
                self.passwordStrengthLabel.text = "Set Password"
            }
        }
    }
}

extension PasswordVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField {
        textField.text  =  passwordViewModel.passwordString.value
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField {
        textField.text  =  passwordViewModel.passwordString.value
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTextField {
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            passwordViewModel.updatePassword(password: newString)
        }
        return true
    }
}


