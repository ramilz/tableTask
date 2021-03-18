//
//  ImagePostTableViewCell.swift
//  tableView
//
//  Created by Артем Иревлин on 17.03.2021.
//

import UIKit

final class ImagePostTableViewCell: UITableViewCell {
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var showPostButton: UIButton!
    
    var model: PostModelImage?
    var onShowPostTap: ((URL) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorLabel.font = .boldSystemFont(ofSize: 16)
        authorLabel.layer.shadowRadius = 3.0
        authorLabel.layer.shadowOpacity = 0.3
        authorLabel.layer.shadowOffset = CGSize.zero
        showPostButton.backgroundColor = .darkGray
        showPostButton.layer.shadowRadius = 4.0
        showPostButton.layer.shadowOpacity = 0.6
        showPostButton.layer.shadowOffset = CGSize.zero
        showPostButton.layer.cornerRadius = showPostButton.bounds.height / 2
        postImageView.layer.cornerRadius = postImageView.bounds.height / 3
        postImageView.backgroundColor = UIColor.systemGray6
        showPostButton.setTitle("Читать полностью в источнике", for: .normal)
        showPostButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func onTapShowPostButton(_ sender: Any) {
        guard let pathUrl = model?.postPath,
              let url = URL(string: pathUrl) else { return }
        
        onShowPostTap?(url)
    }
}

extension ImagePostTableViewCell: PostCellConfigurable {
    func configure(model: PostModelProtocol) {
        guard let model = model as? PostModelImage else { return }
        
        self.model = model
        authorLabel.text = model.author
        
        if let urlImage = URL(string: model.imagePath) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: urlImage) {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        
                        self.postImageView.image = UIImage(data: imageData)
                        self.postImageView.backgroundColor = .clear
                    }
                }
            }
        }
    }
}
	
