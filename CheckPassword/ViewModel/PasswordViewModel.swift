//
//  PasswordViewModel.swift
//  CheckPassword
//
//  Created by Subham Padhi on 15/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class PasswordViewModel {
    
    private var passwordModel = PasswordModel() {
        didSet {
            passwordString.value = passwordModel.password
        }
    }
    var passwordString: Box<String?> = Box("")
    
    init(passwordModel:PasswordModel = PasswordModel()) {
        self.passwordModel = passwordModel
    }
    
    func updatePassword(password:String){
        passwordModel.password = password
    }
    
    func strenghtPercent(passwordStrength: Int) -> Float{
        return Float(Float(passwordStrength)/Float(5))
    }
    
    func setProgressbarColor(progress:Float) -> PasswordStrengthInfo {
        var passwordStrengthInfo = PasswordStrengthInfo(strength: Strength.weak, progressColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        if progress <= 0.45 {
            passwordStrengthInfo.strength = Strength.weak
            passwordStrengthInfo.progressColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        } else if progress > 0.45 && progress < 0.80 {
            passwordStrengthInfo.strength = Strength.medium
            passwordStrengthInfo.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }else {
            passwordStrengthInfo.strength = Strength.strong
            passwordStrengthInfo.progressColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }
        return passwordStrengthInfo
    }
}

struct PasswordStrengthInfo {
    
    var strength:Strength?
    var progressColor : UIColor?
    
    
}

enum Strength:String {
    case weak = "WEAK 👎👎"
    case medium = "OKAY ~ 🤞🤞"
    case strong = "STRONG! 👍👍"
}
