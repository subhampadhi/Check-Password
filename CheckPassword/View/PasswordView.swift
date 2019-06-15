//
//  PasswordView.swift
//  CheckPassword
//
//  Created by Subham Padhi on 15/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class PasswordView: UIViewController {
    
    var passwordTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 2
        view.setLeftPaddingPoints(20)
        view.setRightPaddingPoints(20)
        view.isSecureTextEntry = true
        return view
    }()
    
    var passwordStrenghtProgressBar: UIProgressView = {
        let view = UIProgressView()
        view.layer.cornerRadius = 15
        view.progressTintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.trackTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var passwordStrengthLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "HelveticaNeue-Bold",
                                 size: 20.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpView() {
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordStrengthLabel)
        view.addSubview(passwordStrenghtProgressBar)
        
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordStrengthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 20).isActive = true
        passwordStrengthLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        
        passwordStrenghtProgressBar.leadingAnchor.constraint(equalTo: passwordStrengthLabel.trailingAnchor , constant: 10).isActive = true
        passwordStrenghtProgressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true
        passwordStrenghtProgressBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordStrenghtProgressBar.centerYAnchor.constraint(equalTo: passwordStrengthLabel.centerYAnchor).isActive = true
        passwordStrengthLabel.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
    }
    
    func setUpProgressInfo(progress:Float , color:UIColor , labelText:String) {
        UIView.animate(withDuration: 2.0) {
            self.passwordStrenghtProgressBar.setProgress(progress, animated: true)
            self.passwordStrenghtProgressBar.progressTintColor = color
            self.passwordStrengthLabel.text = labelText
        }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
