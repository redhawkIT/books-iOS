//
//  Dialog.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import Foundation
import UIKit
import MBProgressHUD

class DialogHelper {
    
    static var progressHUD :MBProgressHUD!
    
    static func showErrorAlert(view: UIViewController, _ error: String?) {
        if let error = error {
            let errorAlert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            errorAlert.show(view, sender: nil)
        }
    }
    
    
    static func showProgress(view: UIView, message: String)
    {
        progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = message
        
    }
    
    static func dismissProgress()
    {
        progressHUD.hide(animated: true)
    }
    
}
