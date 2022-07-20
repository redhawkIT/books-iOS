//
//  ViewController.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let model = MainViewModel()
    var startIndex = 0
    @IBOutlet weak var tvBook: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvBook.register(UINib(nibName: BookTableViewCell.id, bundle: nil), forCellReuseIdentifier: BookTableViewCell.id)
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
            
            self.tvBook.reloadData()
        }
    }
}

extension ViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.id, for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        
        cell.lbTitle.text = model.books[indexPath.row].volumeInfo?.title
        cell.tvDescription.text = model.books[indexPath.row].volumeInfo?.desc
        cell.ivThumb.sd_setImage(with: URL(string: model.books[indexPath.row].volumeInfo!.imageLinks!.smallThumbnail!))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            self.startIndex += 1
            self.loadBooks(index: self.startIndex)
        }
    }
}
