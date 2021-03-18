//
//  TextPostTableViewCell.swift
//  tableView
//
//  Created by Артем Иревлин on 17.03.2021.
//

import UIKit

final class TextPostTableViewCell: UITableViewCell {
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorLabel.font = .boldSystemFont(ofSize: 16)
        contentLabel.font = .systemFont(ofSize: 16)
        authorLabel.layer.shadowRadius = 3.0
        authorLabel.layer.shadowOpacity = 0.3
        authorLabel.layer.shadowOffset = CGSize.zero
    }
}

extension TextPostTableViewCell: PostCellConfigurable {
    func configure(model: PostModelProtocol) {
        guard let model = model as? PostModelText else { return }
        
        authorLabel.text = model.author
        contentLabel.text = model.text
    }
}
