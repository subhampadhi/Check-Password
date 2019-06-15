//
//  CheckPasswordStrength.swift
//  CheckPassword
//
//  Created by Subham Padhi on 16/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

class CheckPasswordStrength{
    
    static let shared = CheckPasswordStrength()
    
    init() {
    }
func checkPasswordStrength(password: String) -> Int {
    var strenght = 0
    
    if password.count > 6 {
        strenght+=1
    } else {
        return 0
    }
    if checkCapital(password: password){
        strenght+=1
    }
    if checkSmall(password:password){
        strenght+=1
    }
    if checkNumber(password: password){
        strenght+=1
    }
    if checkSpecialCharacter(password: password) {
        strenght+=1
    }
    return strenght
}

func checkCapital(password:String) -> Bool {
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
    let capitalresult = texttest.evaluate(with: password)
    return capitalresult
}

func checkSmall(password:String) -> Bool {
    
    let smallLetterRegEx  = ".*[a-z]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", smallLetterRegEx)
    let smallresult = texttest.evaluate(with: password)
    return smallresult
}

func checkNumber(password:String) -> Bool {
    
    let numberRegEx  = ".*[0-9]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
    let numberresult = texttest.evaluate(with: password)
    return numberresult
    
}

func checkSpecialCharacter(password:String) -> Bool {
    
    let specialCharacterRegEx  = ".*[!&^%$#@()/?]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
    let specialresult = texttest.evaluate(with: password)
    return specialresult
    }
}
