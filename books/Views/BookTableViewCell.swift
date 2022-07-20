//
//  BookTableViewCell.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    
    static let id = "BookTableViewCell"
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tvDescription.textContainer.maximumNumberOfLines = 6
        tvDescription.textContainer.lineBreakMode = .byTruncatingTail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
