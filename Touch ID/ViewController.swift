//
//  ViewController.swift
//  Touch ID
//
//  Created by XYF on 2018/12/26.
//  Copyright © 2018 XYF. All rights reserved.
//

import UIKit
import LocalAuthentication

   
class ViewController: UIViewController {
    
    func errorMessageForLAErrorCode(errorCode: Int) -> String {
        var message = ""
        
        switch errorCode {
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts."
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Did not find error code on LAError object"
        }
        return message
    }
    
    func touchID (){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            // 开始进入识别状态，以闭包形式返回结果。闭包的 success 是布尔值，代表识别成功与否。error 为错误信息。
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "请用指纹解锁", reply: {success, error in
                
                if success {
                    // 成功之后的逻辑， 通常使用多线程来实现跳转逻辑。
                }else {
                    if let error = error as? NSError {
                        // 获取错误信息
                        let message = self.errorMessageForLAErrorCode(errorCode: error.code)
                        print(message)
                    }
                }
                
            })
        }
    }
    
    
    
    
    
    
    @IBAction func TouchID(_ sender: Any) {
        touchID ()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

