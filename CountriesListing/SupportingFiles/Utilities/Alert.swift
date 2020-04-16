//
//  Alert.swift
//  BaseProject
//
//  Created by Author Name on 01/02/2018.
//  Copyright © 2018 Author Name. All rights reserved.
//

import UIKit

public class Alert {
    
    static let shared = Alert()
    
    private init() {
    
    }
    
    func showMsg(title : String = "Notification", msg : String , btnActionTitle : String? = "Okay", controller: UIViewController ) -> Void {
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: btnActionTitle, style: .default) { (action) in
        }
        alertController .addAction(alertAction)
        controller.present(alertController, animated: true) {
            
        }
    }
    
}

