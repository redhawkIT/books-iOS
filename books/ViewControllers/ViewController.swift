//
//  ViewController.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import UIKit

class ViewController: UIViewController {

    let model = MainViewModel()
    var startIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBooks(index: startIndex)
    }

    func loadBooks(index: Int)
    {
        DialogHelper.showProgress(view: self.view, message: "")
        
        model.loadBooksByIndex(index: index) { error in
            DialogHelper.dismissProgress()
            
            if (error != nil)
            {
                DialogHelper.showErrorAlert(view: self, error)
                return
            }
            
            
        }
    }
}

